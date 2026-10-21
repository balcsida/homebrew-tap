class TeamsCli < Formula
  desc "Microsoft Teams CLI for AI agents and automation (fork with --redirect-uri)"
  homepage "https://github.com/balcsida/ms-teams-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/balcsida/ms-teams-cli/releases/download/v0.11.0-pre.1/teams-v0.11.0-pre.1-aarch64-apple-darwin.tar.gz"
      sha256 "b5ad7dbce1b180a5d6dbeba3f8ba10ab93f8a9dadb16fb049cde8b2b2b16d130"
    end

    on_intel do
      url "https://github.com/balcsida/ms-teams-cli/releases/download/v0.11.0-pre.1/teams-v0.11.0-pre.1-x86_64-apple-darwin.tar.gz"
      sha256 "a7cb76e36c5bc548d58e858ca0d20842ec84814dd91f711033984b8cc851e194"
    end
  end

  def install
    bin.install "bin/teams"
    man1.install "share/man/man1/teams.1"
    man5.install "share/man/man5/teams-config.5"
    man7.install Dir["share/man/man7/*.7"]
    doc.install Dir["share/doc/teams/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/teams --version")
    assert_match "Microsoft Teams CLI", shell_output("#{bin}/teams --help")
  end
end
