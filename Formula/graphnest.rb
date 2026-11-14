class Graphnest < Formula
  desc "Import CodeGraph indexes into GraphNest and sign in with OAuth"
  homepage "https://github.com/balcsida/graphnest"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/balcsida/graphnest/releases/download/v0.12.0/graphnest_0.12.0_darwin_arm64"
      sha256 "c732a5bce2990b0f0a9f3f36086f5c78127cc8e16547bb481e133161003de4c6"
    end

    on_intel do
      url "https://github.com/balcsida/graphnest/releases/download/v0.12.0/graphnest_0.12.0_darwin_amd64"
      sha256 "0b898c7bdd3bba39bd7c9e2cf9ca1287d7104759ce914f7338f0870a8ba9959c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/balcsida/graphnest/releases/download/v0.12.0/graphnest_0.12.0_linux_arm64"
      sha256 "d930dbfd4c172008936a211f3d8c9a44f45e3e9dea40548d13f4defaf8a61653"
    end

    on_intel do
      url "https://github.com/balcsida/graphnest/releases/download/v0.12.0/graphnest_0.12.0_linux_amd64"
      sha256 "811af54bba33ac4681b8e01c1e34b8b29c35185dd5d853d4dd99bd32dde81cfd"
    end
  end

  def install
    bin.install Dir["graphnest_*"].first => "graphnest"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/graphnest version")
  end
end
