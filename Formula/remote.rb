# remote 2.0.14, written by clients/remote/npm/channels.ts in
# remotehostai's monorepo (REM-6888). The next release rewrites it: change the
# generator, not this file.
class Remote < Formula
  desc "RemoteHost's command-line interface: remote, and rh for short"
  homepage "https://remotehost.ai"
  version "2.0.14"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@remotehost/cli-darwin-arm64/-/cli-darwin-arm64-2.0.14.tgz"
      sha256 "83ca2bc1e90e85709d5c067f61187bd0d9b013ef8bd2b52a0e86caee09aff63c"
    end
    on_intel do
      url "https://registry.npmjs.org/@remotehost/cli-darwin-x64/-/cli-darwin-x64-2.0.14.tgz"
      sha256 "7981a52e8e266bf67d74c7ecd0456bd98b78ac52f22e7097047c1ce6af4a576d"
    end
  end

  on_linux do
    on_intel do
      url "https://registry.npmjs.org/@remotehost/cli-linux-x64/-/cli-linux-x64-2.0.14.tgz"
      sha256 "d3bb6127f04b35c648613185b8d530bd17a83d1e938c8ae07ad648306cb0c54c"
    end
    on_arm do
      url "https://registry.npmjs.org/@remotehost/cli-linux-arm64/-/cli-linux-arm64-2.0.14.tgz"
      sha256 "315f807a4ebfc30dbe68622c112381d7abf0110c237048d709afc3fdfcfb4188"
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
