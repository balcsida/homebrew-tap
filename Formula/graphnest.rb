class Graphnest < Formula
  desc "Import CodeGraph indexes into GraphNest and sign in with OAuth"
  homepage "https://github.com/balcsida/graphnest"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/balcsida/graphnest/releases/download/v0.13.1/graphnest_0.13.1_darwin_arm64"
      sha256 "bcf3c1f0f62ada3b0bcf558e3c34f492e78cccdbb34dcf17fb24bc9307c49f77"
    end

    on_intel do
      url "https://github.com/balcsida/graphnest/releases/download/v0.13.1/graphnest_0.13.1_darwin_amd64"
      sha256 "39a0e85d1609baca1e4bd04cb9407a0d2c80fbed4423a7b5dd3d3df7c99106cd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/balcsida/graphnest/releases/download/v0.13.1/graphnest_0.13.1_linux_arm64"
      sha256 "b836311b835e5d7893916f1ab6ac9c52a801917de4b91a9d4c4905a64058ca18"
    end

    on_intel do
      url "https://github.com/balcsida/graphnest/releases/download/v0.13.1/graphnest_0.13.1_linux_amd64"
      sha256 "cc10da2a82835d8672b20f0b9fae7c7a0a068e5ac66cae5042dbf60aaa4261af"
    end
  end

  def install
    bin.install Dir["graphnest_*"].first => "graphnest"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/graphnest version")
  end
end
