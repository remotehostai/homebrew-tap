# remote 2.0.7, written by clients/remote/npm/channels.ts in
# remotehostai's monorepo (REM-6888). The next release rewrites it: change the
# generator, not this file.
class Remote < Formula
  desc "RemoteHost's command-line interface: remote, and rh for short"
  homepage "https://remotehost.ai"
  version "2.0.7"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@remotehost/cli-darwin-arm64/-/cli-darwin-arm64-2.0.7.tgz"
      sha256 "9c6a6f7e912d7e244a4f19b66fd1e90e1f96449b8b8b4930d44250cc1b4500c3"
    end
    on_intel do
      url "https://registry.npmjs.org/@remotehost/cli-darwin-x64/-/cli-darwin-x64-2.0.7.tgz"
      sha256 "87515966f3a7f66195400cbeac710a2c937d9b331741f0e75000b3ba6d57ff87"
    end
  end

  on_linux do
    on_intel do
      url "https://registry.npmjs.org/@remotehost/cli-linux-x64/-/cli-linux-x64-2.0.7.tgz"
      sha256 "bcd876ea4ffa8691adfd75ab3c25b761b763dd80a2493d45cf088262fa848421"
    end
    on_arm do
      url "https://registry.npmjs.org/@remotehost/cli-linux-arm64/-/cli-linux-arm64-2.0.7.tgz"
      sha256 "773ce826a4be489672a6ded8d15300870ecc14a863f56ff5ddfef838542f2e21"
    end
  end

  def install
    # `remote` looks for its network helper and the network daemon beside its own real path.
    libexec.install "bin/remote", "bin/remote-network-helper", "bin/remotehost-netd", "bin/remotehost-net"
    bin.install_symlink libexec/"remote"
    bin.install_symlink libexec/"remote" => "rh"
    prefix.install "LICENSE.md"
    doc.install "README.md", "THIRD-PARTY-NOTICES.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/remote --version")
  end
end
