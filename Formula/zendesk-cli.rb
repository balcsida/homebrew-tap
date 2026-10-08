class ZendeskCli < Formula
  desc "Unofficial command-line client for the Zendesk API"
  homepage "https://github.com/balcsida/zendesk-rs"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/balcsida/zendesk-rs/releases/download/v0.6.0/zendesk-aarch64-apple-darwin.tar.gz"
      sha256 "b502542ae14a6b50afdc5f6209e830c4a354d30744c8554d0f6d84b21e6f035d"
    end

    on_intel do
      url "https://github.com/balcsida/zendesk-rs/releases/download/v0.6.0/zendesk-x86_64-apple-darwin.tar.gz"
      sha256 "b7437ec43badff72e6bf2915233c9bbb127f89cfdf9d371ae42f20414e8b9b65"
    end
  end

  def install
    bin.install "zendesk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zendesk --version")
  end
end
