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
  version "0.1.2"
  license "MIT"

  # Apple Silicon only — Intel Macs install via `dart pub global activate loam`.
  on_macos do
    on_arm do
      url "https://github.com/silvio-l/loam/releases/download/v0.1.2/loam-macos-arm64.tar.gz"
      sha256 "6dc606c552111bdbf8311f59769c42379f5cb29085fd46c6853e44719d6bc9cb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/silvio-l/loam/releases/download/v0.1.2/loam-linux-x86_64.tar.gz"
      sha256 "53ded4c77662a6ef368ee2ac1f04bd13d411699b63b650cc49e4be2d27e88bbf"
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
