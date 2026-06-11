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
  version "0.1.6"
  license "MIT"

  # Apple Silicon only — Intel Macs install via `dart pub global activate loam`.
  on_macos do
    on_arm do
      url "https://github.com/silvio-l/loam/releases/download/v0.1.6/loam-macos-arm64.tar.gz"
      sha256 "ea0255005a2938cf60b05911678d0a9105d83e040cca47611478023fba5b9c9f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/silvio-l/loam/releases/download/v0.1.6/loam-linux-x86_64.tar.gz"
      sha256 "be094f4d749d2d2c21fe3155618656b8083f04cf945d77de00ee88205c70db69"
    end
  end

  def install
    bin.install "loam"
  end

  test do
    assert_match "loam", shell_output("#{bin}/loam --help")
  end

  livecheck do
    url :stable
    strategy :github_latest
  end
end
