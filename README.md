# RemoteHost's Homebrew tap

```sh
brew install remotehostai/tap/remote
```

Installs `remote`, RemoteHost's command-line interface, and `rh` for short, on
macOS and Linux (Apple silicon, Intel and arm64). `Formula/remote.rb` is
written by each release from the monorepo's `clients/remote/npm/channels.ts`:
it downloads the same signed archives npm serves (`@remotehost/cli-<platform>`)
and checks their SHA-256. Do not edit it here; the next release rewrites it.

Other ways to install: https://remotehost.ai/docs (the install script, npm,
apt, and direct downloads at https://packages.remotehost.ai/cli/).
