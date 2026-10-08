class ZendeskMcpServer < Formula
  desc "Unofficial Model Context Protocol server for the Zendesk API"
  homepage "https://github.com/balcsida/zendesk-rs"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/balcsida/zendesk-rs/releases/download/v0.6.0/zendesk-mcp-server-aarch64-apple-darwin.tar.gz"
      sha256 "97d61c6703a6da781762803413aad30a234686feafe02b48acfe7e62495832b8"
    end

    on_intel do
      url "https://github.com/balcsida/zendesk-rs/releases/download/v0.6.0/zendesk-mcp-server-x86_64-apple-darwin.tar.gz"
      sha256 "361741d2339f33f1ad51cf5d3dfdbd2ea0b74a40e9e80a60b7a43daadf388272"
    end
  end

  def install
    bin.install "zendesk-mcp-server"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zendesk-mcp-server --version")
  end
end
