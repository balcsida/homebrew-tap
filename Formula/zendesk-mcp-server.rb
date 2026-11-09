class ZendeskMcpServer < Formula
  desc "Unofficial Model Context Protocol server for the Zendesk API"
  homepage "https://github.com/balcsida/zendesk-rs"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/balcsida/zendesk-rs/releases/download/v0.7.0/zendesk-mcp-server-aarch64-apple-darwin.tar.gz"
      sha256 "3a78ac6b1ef46215917b31270f1a8cb24d78a8d8ae12db170a1fbca85c5f3d48"
    end

    on_intel do
      url "https://github.com/balcsida/zendesk-rs/releases/download/v0.7.0/zendesk-mcp-server-x86_64-apple-darwin.tar.gz"
      sha256 "af3fedfe77526a34eeb967a00a08891b051c3ff5b5b071790ee389da580e3a5b"
    end
  end

  def install
    bin.install "zendesk-mcp-server"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zendesk-mcp-server --version")
  end
end
