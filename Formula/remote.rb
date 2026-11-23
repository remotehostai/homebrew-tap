# remote 2.0.13, written by clients/remote/npm/channels.ts in
# remotehostai's monorepo (REM-6888). The next release rewrites it: change the
# generator, not this file.
class Remote < Formula
  desc "RemoteHost's command-line interface: remote, and rh for short"
  homepage "https://remotehost.ai"
  version "2.0.13"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@remotehost/cli-darwin-arm64/-/cli-darwin-arm64-2.0.13.tgz"
      sha256 "b35444e5c7e29df9ece2476633b54f425ce1bcf2439a7302bad89631dd46eacb"
    end
    on_intel do
      url "https://registry.npmjs.org/@remotehost/cli-darwin-x64/-/cli-darwin-x64-2.0.13.tgz"
      sha256 "848e7b4d9f21b690a07d4ba152d16318cbd41096a3716acbdd17dd3e725af404"
    end
  end

  on_linux do
    on_intel do
      url "https://registry.npmjs.org/@remotehost/cli-linux-x64/-/cli-linux-x64-2.0.13.tgz"
      sha256 "e0c3cd8af70882972a08ae7464ec9d37998d0e26856b7e3d1d9b827bbbf235e3"
    end
    on_arm do
      url "https://registry.npmjs.org/@remotehost/cli-linux-arm64/-/cli-linux-arm64-2.0.13.tgz"
      sha256 "a85a88501241c77dc3e02e28d980bcb4f15283a4ba5d6830aeaa13ea33e50cc6"
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
