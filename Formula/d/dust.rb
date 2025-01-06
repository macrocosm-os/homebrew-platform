# ref: https://github.com/Homebrew/brew/blob/master/Library/Homebrew/formula.rb
# typed: false
# frozen_string_literal: true

class Dust < Formula
    desc "Run developer tasks and tools via dependencies"
    homepage "https://github.com/macrocosm-os/dust"
    version "0.1.1"
  
    # Only has dependencies
    url "file:///dev/null"
    sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  
    depends_on "argocd"
    depends_on "bash"
    depends_on "bitwarden-cli"
    depends_on "buf"
    depends_on "caddy"
    depends_on "d2"
    depends_on "direnv"
    depends_on "duckdb"
    depends_on "eget"
    depends_on "encoredev/tap/encore"
    depends_on "gh"
    depends_on "git"
    depends_on "git-town"
    depends_on "go"
    depends_on "go-task"
    depends_on "grpcurl"
    depends_on "helm"
    depends_on "kubernetes-cli"
    depends_on "alajmo/mani/mani"
    depends_on "kovetskiy/mark/mark"
    depends_on "node"
    depends_on "pipx"
    depends_on "f1bonacc1/tap/process-compose"
    depends_on "pulumi/tap/pulumi"
    depends_on "rsync"
    depends_on "starship"
    depends_on "temporal"
    depends_on "uv"
    depends_on "vercel-cli"

    conflicts_with "dust", because: "dust is in homebrew-core"
    conflicts_with "metafeather/tools/dust", because: "dust is used by other organisations"
  
    def install
      File.open(name, 'w') { |file|
        file.write <<~EOS
          #!/usr/bin/env sh
          echo "#{full_name} #{version}:"
        EOS
        deps.each do | dep |
          f = dep.to_formula
          file.write "echo - "+[f.full_name, f.version].join("\t")+"\n"
        end
      }
      bin.install name
    end    
end