class Graphnest < Formula
  desc "Import CodeGraph indexes into GraphNest and sign in with OAuth"
  homepage "https://github.com/balcsida/graphnest"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/balcsida/graphnest/releases/download/v0.14.0/graphnest_0.14.0_darwin_arm64"
      sha256 "dbdd9b119a440dfabc247101b6c0b2eba689fb1f6ec1e98817b0336fcf59f99f"
    end

    on_intel do
      url "https://github.com/balcsida/graphnest/releases/download/v0.14.0/graphnest_0.14.0_darwin_amd64"
      sha256 "06c33dc19d0cc9ab2cfdee4f218a35e4dd6db5947acad1f29420b05f22602ea6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/balcsida/graphnest/releases/download/v0.14.0/graphnest_0.14.0_linux_arm64"
      sha256 "317fe93ef1bcf9db5a07eda4ea68e883a239799c1112c6b90287abb82345adcc"
    end

    on_intel do
      url "https://github.com/balcsida/graphnest/releases/download/v0.14.0/graphnest_0.14.0_linux_amd64"
      sha256 "b1c587b0968b7f6cb5d82b582d14593e0e9a991d7484f8a4f4e02cba3e103e43"
    end
  end

  def install
    bin.install Dir["graphnest_*"].first => "graphnest"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/graphnest version")
  end
end
