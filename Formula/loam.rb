# typed: false
# frozen_string_literal: true

# Homebrew formula for loam.dev.
#
# RENDERED by tool/release-local.sh in silvio-l/loam
# (run locally at release time) and pushed into silvio-l/homebrew-loam.
# Do not edit the copy in the tap by hand — edit this template instead.
# The version and per-arch checksums are filled in at release time.
class Loam < Formula
  desc "Codebase intelligence & anti-AI-slop for Dart & Flutter"
  homepage "https://getloam.dev"
  version "0.1.16"
  license "MIT"

  # Apple Silicon only — Intel Macs install via `dart pub global activate loam`.
  on_macos do
    on_arm do
      url "https://github.com/silvio-l/loam/releases/download/v0.1.16/loam-macos-arm64.tar.gz"
      sha256 "db7d5d7fc1a1193bd6be71c13473cc7f78e00804d671c5e09dcc16b1369fd1ac"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/silvio-l/loam/releases/download/v0.1.16/loam-linux-x86_64.tar.gz"
      sha256 "d68c340449bb1704b6c6993c6ee6ad80c3623b042ff983d67cc0a7ea4f6f4bf0"
    end
  end

  def install
    bin.install "loam"
  end

  test do
    # Assert the *version*, not just the name: a stale or mis-rendered formula
    # whose binary reports a different baked-in version than the formula claims
    # must fail `brew test`. `loam --version` prints `loam <version>` on line 1.
    assert_match "loam #{version}", shell_output("#{bin}/loam --version")
  end

  livecheck do
    url :stable
    strategy :github_latest
  end
end
