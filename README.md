# homebrew-platform

Homebrew Tap for tools

```sh
brew install macrocosm-os/platform/<FORMULA>
```

## Private tools

Access to tools in private repos requires an api key named
`HOMEBREW_GITHUB_API_TOKEN=""` with repo scope.

## Updating a Tap

You should not commit directly to this repo. The individual repo where the tools are maintained should be used to update this repo via CI/CD or goreleaser, etc.
