class Graphnest < Formula
  desc "Import CodeGraph indexes into GraphNest and sign in with OAuth"
  homepage "https://github.com/balcsida/graphnest"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/balcsida/graphnest/releases/download/v0.11.0/graphnest_0.11.0_darwin_arm64"
      sha256 "ce7dc807523c0d2f18b2e48abb2384e6b4bd34820e927bc1fdd7f117f7b8cd8a"
    end

    on_intel do
      url "https://github.com/balcsida/graphnest/releases/download/v0.11.0/graphnest_0.11.0_darwin_amd64"
      sha256 "a37ceba7264ce2665b3687760d8c93d66b1bdb67abf7d26c19c8a2e6bc8a62e2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/balcsida/graphnest/releases/download/v0.11.0/graphnest_0.11.0_linux_arm64"
      sha256 "1b6065b58b0481e4b55756ed9d16c67cabedee3d5ff6e4091cb4caca9e130461"
    end

    on_intel do
      url "https://github.com/balcsida/graphnest/releases/download/v0.11.0/graphnest_0.11.0_linux_amd64"
      sha256 "c5c837b807e9dd1bacb7de5e4e76a179446185ee9377f57c6051ed0adb5c8ce6"
    end
  end

  def install
    bin.install Dir["graphnest_*"].first => "graphnest"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/graphnest version")
  end
end
