class OpencodeFork < Formula
  desc "AI-powered development tool (fork with LiteLLM provider support)"
  homepage "https://github.com/balcsida/opencode"
  version "1.17.11-litellm.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/balcsida/opencode/releases/download/v#{version}/opencode-darwin-arm64.zip"
      sha256 "62ab4ea82710af485cd9e741a4ee83837af99defffeaac63e36f9ea60e916344"
    end

    on_intel do
      url "https://github.com/balcsida/opencode/releases/download/v#{version}/opencode-darwin-x64.zip"
      sha256 "7d13d581d2544d0162b059964a401a1bdb3ac666ec6e33f0f66af7a23511127d"
    end
  end

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version 2>&1", 0)
  end
end
