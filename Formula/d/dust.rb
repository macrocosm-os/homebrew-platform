# ref: https://github.com/Homebrew/brew/blob/master/Library/Homebrew/formula.rb
# typed: false
# frozen_string_literal: true

class Dust < Formula
    desc "Run developer tasks and tools via dependencies"
    homepage ""
    version "0.1.0"
  
    # Only has dependencies
    url "file:///dev/null"
    sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  
    depends_on "bash"
    depends_on "git"
    depends_on "go-task"

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