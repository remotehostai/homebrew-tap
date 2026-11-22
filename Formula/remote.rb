# remote 2.0.8, written by clients/remote/npm/channels.ts in
# remotehostai's monorepo (REM-6888). The next release rewrites it: change the
# generator, not this file.
class Remote < Formula
  desc "RemoteHost's command-line interface: remote, and rh for short"
  homepage "https://remotehost.ai"
  version "2.0.8"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@remotehost/cli-darwin-arm64/-/cli-darwin-arm64-2.0.8.tgz"
      sha256 "01de8a57f2b7ad386dbe90f9939854ef2c62a9fd73eea69647c36e98dc0e9778"
    end
    on_intel do
      url "https://registry.npmjs.org/@remotehost/cli-darwin-x64/-/cli-darwin-x64-2.0.8.tgz"
      sha256 "1a0fc8fdf1be3922285571dc55109702f1faca186053dc913d4361b9371d22c8"
    end
  end

  on_linux do
    on_intel do
      url "https://registry.npmjs.org/@remotehost/cli-linux-x64/-/cli-linux-x64-2.0.8.tgz"
      sha256 "88432e0e7c7b009b606301d5db46602706668569649c95b1fc196fa78bf89a2a"
    end
    on_arm do
      url "https://registry.npmjs.org/@remotehost/cli-linux-arm64/-/cli-linux-arm64-2.0.8.tgz"
      sha256 "97a8b0b33ae8583cf1c1bf4f907c93bdbcc929bf5efd561f0c1abaa027df4751"
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
