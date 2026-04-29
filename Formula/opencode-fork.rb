class OpencodeFork < Formula
  desc "AI-powered development tool (fork with LiteLLM provider support)"
  homepage "https://github.com/balcsida/opencode"
  version "1.14.28-litellm.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/balcsida/opencode/releases/download/v#{version}/opencode-darwin-arm64.zip"
      sha256 "a71d0976ca863e6dc8b60fb81ccaa09ab5e69a8c4dd40004781d56fe58d043c8"
    end

    on_intel do
      url "https://github.com/balcsida/opencode/releases/download/v#{version}/opencode-darwin-x64.zip"
      sha256 "d2849e9cc34ec422f3ce8ba70d03518a3b18bec759aaab2292c753fbddc3f7b0"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version 2>&1", 0)
  end
end
