class Graphnest < Formula
  desc "Import CodeGraph indexes into GraphNest and sign in with OAuth"
  homepage "https://github.com/balcsida/graphnest"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/balcsida/graphnest/releases/download/v0.13.0/graphnest_0.13.0_darwin_arm64"
      sha256 "3e88df6099f05009f35c97c12a43bad3cb48dba5fa0a8ce9e9e24bdd9cae8dee"
    end

    on_intel do
      url "https://github.com/balcsida/graphnest/releases/download/v0.13.0/graphnest_0.13.0_darwin_amd64"
      sha256 "b2512d562d3d2bd9d439b683d69a02c1605270e2f61af3619b0d14dc36389e83"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/balcsida/graphnest/releases/download/v0.13.0/graphnest_0.13.0_linux_arm64"
      sha256 "7966df17c73f7dc530ad386f715c922095b58ba603bcbc1852472d82e6ff056f"
    end

    on_intel do
      url "https://github.com/balcsida/graphnest/releases/download/v0.13.0/graphnest_0.13.0_linux_amd64"
      sha256 "6536580e5887ba8d3c8b9d11598f0f293089d5ddaec5c2b7879bedf295b0aa08"
    end
  end

  def install
    bin.install Dir["graphnest_*"].first => "graphnest"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/graphnest version")
  end
end
