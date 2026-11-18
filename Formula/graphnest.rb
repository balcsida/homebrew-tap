class Graphnest < Formula
  desc "Import CodeGraph indexes into GraphNest and sign in with OAuth"
  homepage "https://github.com/balcsida/graphnest"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/balcsida/graphnest/releases/download/v0.15.0/graphnest_0.15.0_darwin_arm64"
      sha256 "6868eb7ad17c51888c16479410013ce674f7c888fa733584de0466641118cca0"
    end

    on_intel do
      url "https://github.com/balcsida/graphnest/releases/download/v0.15.0/graphnest_0.15.0_darwin_amd64"
      sha256 "08d551f7ecd1c36317f90cd5116b7b605affb9411011aff7080cc8c9768b495b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/balcsida/graphnest/releases/download/v0.15.0/graphnest_0.15.0_linux_arm64"
      sha256 "c20a6f6a72ca38c3cec713ed0493fd2d16dd7736af91d48ca043b41ca34daee5"
    end

    on_intel do
      url "https://github.com/balcsida/graphnest/releases/download/v0.15.0/graphnest_0.15.0_linux_amd64"
      sha256 "b518a4c68de2117fd7f481a4496806f6820973a5f70c5aead73a4c6a0a0e2853"
    end
  end

  def install
    bin.install Dir["graphnest_*"].first => "graphnest"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/graphnest version")
  end
end
