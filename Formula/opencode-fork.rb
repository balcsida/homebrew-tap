class OpencodeFork < Formula
  desc "AI-powered development tool (fork with LiteLLM provider support)"
  homepage "https://github.com/balcsida/opencode"
  version "1.14.41-litellm.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/balcsida/opencode/releases/download/v#{version}/opencode-darwin-arm64.zip"
      sha256 "102203b682f2572b151d14828d6a93af1fd820f3181b3d03ed7267dfec3ddea1"
    end

    on_intel do
      url "https://github.com/balcsida/opencode/releases/download/v#{version}/opencode-darwin-x64.zip"
      sha256 "13fac456cc015fad62b82acd5d1164922fb7f462487587c863b94613d2ebf490"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version 2>&1", 0)
  end
end
