class TeamsNowPlaying < Formula
  desc "Show the playing Apple Music track as your Microsoft Teams status message"
  homepage "https://github.com/balcsida/teams-now-playing"
  url "https://github.com/balcsida/teams-now-playing/archive/b3779d6c57bf2beed739db580fe46884dc71a1a9.tar.gz"
  version "0.1.0"
  sha256 "c81ce294c29f0440616e28643fbd12e05b73e6bfc51c3138d4e4b8e80d2577c0"
  license "MIT"

  depends_on "jq"
  depends_on :macos

  def install
    bin.install "teams-now-playing"
  end

  service do
    run opt_bin/"teams-now-playing"
    run_type :interval
    interval 30
    error_log_path var/"log/teams-now-playing.log"
  end

  # The teams CLI is not a dependency: two taps ship a formula of that name.
  def caveats
    <<~EOS
      Needs an authenticated `teams` CLI on the PATH:
        brew install osodevops/tap/teams-cli && teams auth login

      Start it with:
        brew services start teams-now-playing

      The first time a track plays, macOS asks whether it may control Music. Allow it.
    EOS
  end

  test do
    # Running it would set a real Teams status, so only check that it parses.
    system "zsh", "-n", bin/"teams-now-playing"
  end
end
