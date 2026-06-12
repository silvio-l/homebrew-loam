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
  version "0.1.8"
  license "MIT"

  # Apple Silicon only — Intel Macs install via `dart pub global activate loam`.
  on_macos do
    on_arm do
      url "https://github.com/silvio-l/loam/releases/download/v0.1.8/loam-macos-arm64.tar.gz"
      sha256 "f2fd591fcd1e7c8b74db6d4fc8fa33177f9e8661f40b3a2a088e01a343578c34"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/silvio-l/loam/releases/download/v0.1.8/loam-linux-x86_64.tar.gz"
      sha256 "63404532aa38beb31e62babaf153890e03bf006bed70f2c4695dac37c0eb8801"
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
