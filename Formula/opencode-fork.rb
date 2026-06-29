class OpencodeFork < Formula
  desc "AI-powered development tool (fork with LiteLLM provider support)"
  homepage "https://github.com/balcsida/opencode"
  version "1.17.11-litellm.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/balcsida/opencode/releases/download/v#{version}/opencode-darwin-arm64.zip"
      sha256 "77cde69051f0367e1576b0cddfa4d98e61c7a6b5b5ffa671ff7e981d3af78ad6"
    end

    on_intel do
      url "https://github.com/balcsida/opencode/releases/download/v#{version}/opencode-darwin-x64.zip"
      sha256 "48be04eac1eb7d738c47338fde6f3526ccd1bcbc459faa556d503434c3c3fa27"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version 2>&1", 0)
  end
end
