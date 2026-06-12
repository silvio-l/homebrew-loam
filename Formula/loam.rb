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
  version "0.1.9"
  license "MIT"

  # Apple Silicon only — Intel Macs install via `dart pub global activate loam`.
  on_macos do
    on_arm do
      url "https://github.com/silvio-l/loam/releases/download/v0.1.9/loam-macos-arm64.tar.gz"
      sha256 "b5c20a0aa4c3576215823bfd2720fa1adee20708aef992ee7024590e9e06e280"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/silvio-l/loam/releases/download/v0.1.9/loam-linux-x86_64.tar.gz"
      sha256 "29eae64343e9fddcaa2aa35b1e889aafca9b1cedd0206bc722da0c30ff2b3e9d"
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
