class OpencodeFork < Formula
  desc "AI-powered development tool (fork with LiteLLM provider support)"
  homepage "https://github.com/balcsida/opencode"
  version "1.14.31-litellm.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/balcsida/opencode/releases/download/v#{version}/opencode-darwin-arm64.zip"
      sha256 "f52ba6ff77fa73a565808789854d27b34991e9b9fbe63fe2aa94f0bb62dbd195"
    end

    on_intel do
      url "https://github.com/balcsida/opencode/releases/download/v#{version}/opencode-darwin-x64.zip"
      sha256 "cc76b4d1e92d79d5eb6ec3c60e13dbeb4cdf4b417ec147219298d3acf23ee515"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version 2>&1", 0)
  end
end
