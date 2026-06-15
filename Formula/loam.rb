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
  version "0.1.12"
  license "MIT"

  # Apple Silicon only — Intel Macs install via `dart pub global activate loam`.
  on_macos do
    on_arm do
      url "https://github.com/silvio-l/loam/releases/download/v0.1.12/loam-macos-arm64.tar.gz"
      sha256 "6a53b70cab82e7ba9d64b33f2e3885264cdc87e59a96cf61cc77aa2e0b9d4a51"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/silvio-l/loam/releases/download/v0.1.12/loam-linux-x86_64.tar.gz"
      sha256 "76d93daff80d1ed42ea2cbec946d89d516c576b9e40b1f2f856bb171f09cbd06"
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
