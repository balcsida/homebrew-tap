class OpencodeFork < Formula
  desc "AI-powered development tool (fork with LiteLLM provider support)"
  homepage "https://github.com/anomalyco/opencode"
  version "1.14.29"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/anomalyco/opencode/releases/download/v#{version}/opencode-darwin-arm64.zip"
      sha256 "39c483fe12cffe07bfc050d59df534ca1b5d29d9232da237586f1b6a2ef1c7e1"
    end

    on_intel do
      url "https://github.com/anomalyco/opencode/releases/download/v#{version}/opencode-darwin-x64.zip"
      sha256 "60d1c577998e5171183d55bf91e3bc699d5d91ab9998985d82240c87e2f30fec"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version 2>&1", 0)
  end
end
