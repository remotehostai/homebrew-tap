# remote 2.0.11, written by clients/remote/npm/channels.ts in
# remotehostai's monorepo (REM-6888). The next release rewrites it: change the
# generator, not this file.
class Remote < Formula
  desc "RemoteHost's command-line interface: remote, and rh for short"
  homepage "https://remotehost.ai"
  version "2.0.11"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@remotehost/cli-darwin-arm64/-/cli-darwin-arm64-2.0.11.tgz"
      sha256 "d72d35ffbf147b51cc34860fc0c9b6e7ea6cb2f9a1cb3110415098ba9dfe9d1c"
    end
    on_intel do
      url "https://registry.npmjs.org/@remotehost/cli-darwin-x64/-/cli-darwin-x64-2.0.11.tgz"
      sha256 "6357b9655e811fa6819f5775b6447a962481a57f33dd7a56a593b59a19495a3d"
    end
  end

  on_linux do
    on_intel do
      url "https://registry.npmjs.org/@remotehost/cli-linux-x64/-/cli-linux-x64-2.0.11.tgz"
      sha256 "802f5d1885f2b3a8256ff5e010aa767f69e15e1f74572de3733a4d711a849d56"
    end
    on_arm do
      url "https://registry.npmjs.org/@remotehost/cli-linux-arm64/-/cli-linux-arm64-2.0.11.tgz"
      sha256 "7fe31a214dde39ea66dd53266fe14d6bf376becdfc17d3343bce54a0f4bcb9bc"
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
