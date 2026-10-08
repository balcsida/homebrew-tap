class ZendeskCli < Formula
  desc "Unofficial command-line client for the Zendesk API"
  homepage "https://github.com/balcsida/zendesk-rs"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/balcsida/zendesk-rs/releases/download/v0.5.0/zendesk-aarch64-apple-darwin.tar.gz"
      sha256 "d0a1a3997ee75b3e3fbc36f696bda191302395fa7c44ba882b0fdfbb1b995300"
    end

    on_intel do
      url "https://github.com/balcsida/zendesk-rs/releases/download/v0.5.0/zendesk-x86_64-apple-darwin.tar.gz"
      sha256 "b3a748c90a5005de74fda8293e3dc438aad41f4288a953cc3c68badf11ad86b2"
    end
  end

  def install
    bin.install "zendesk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zendesk --version")
  end
end
