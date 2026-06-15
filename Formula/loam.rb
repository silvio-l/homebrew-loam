# typed: false
# frozen_string_literal: true

# Homebrew formula for loam.dev.
#
# RENDERED AUTOMATICALLY by the release workflow in silvio-l/loam
# (.github/workflows/release.yml) and pushed into silvio-l/homebrew-loam.
# Do not edit the copy in the tap by hand — edit this template instead.
# The version and per-arch checksums are filled in at release time.
class Loam < Formula
  desc "Codebase intelligence & anti-AI-slop for Dart & Flutter"
  homepage "https://getloam.dev"
  version "0.1.11"
  license "MIT"

  # Apple Silicon only — Intel Macs install via `dart pub global activate loam`.
  on_macos do
    on_arm do
      url "https://github.com/silvio-l/loam/releases/download/v0.1.11/loam-macos-arm64.tar.gz"
      sha256 "de4fe75ab3a834f10255190e368fcf532b69c8a2369ce07a6b2a6ca69081621d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/silvio-l/loam/releases/download/v0.1.11/loam-linux-x86_64.tar.gz"
      sha256 "225d48cb68c192ee73f42a9057b5daaa99a4056d439d549a980145ec94f9e52f"
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
