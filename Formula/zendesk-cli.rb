class ZendeskCli < Formula
  desc "Unofficial command-line client for the Zendesk API"
  homepage "https://github.com/balcsida/zendesk-rs"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/balcsida/zendesk-rs/releases/download/v0.7.0/zendesk-aarch64-apple-darwin.tar.gz"
      sha256 "4ac0c8e9bb8e00b3e960fc87e68925f3a4a3d0bbde824c3aade899844639ee4d"
    end

    on_intel do
      url "https://github.com/balcsida/zendesk-rs/releases/download/v0.7.0/zendesk-x86_64-apple-darwin.tar.gz"
      sha256 "b4064f4cc3a1709d75623b78ba1513c422f3bff55939b7c2b7b29048c0c67b89"
    end
  end

  def install
    bin.install "zendesk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zendesk --version")
  end
end
