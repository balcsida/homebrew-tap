class ZendeskMcpServer < Formula
  desc "Unofficial Model Context Protocol server for the Zendesk API"
  homepage "https://github.com/balcsida/zendesk-rs"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/balcsida/zendesk-rs/releases/download/v0.5.0/zendesk-mcp-server-aarch64-apple-darwin.tar.gz"
      sha256 "1e15aba6ed1c24ea74b31bc10b842e36b83a73bfa88343eaf682a38e964365df"
    end

    on_intel do
      url "https://github.com/balcsida/zendesk-rs/releases/download/v0.5.0/zendesk-mcp-server-x86_64-apple-darwin.tar.gz"
      sha256 "24ac40247ec266b0ab29faca7d5261d2250b80ef214555bfca8f8306360f2ca3"
    end
  end

  def install
    bin.install "zendesk-mcp-server"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zendesk-mcp-server --version")
  end
end
