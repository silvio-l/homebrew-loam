# typed: false
# frozen_string_literal: true

# Homebrew formula for loam.dev.
#
# RENDERED AUTOMATICALLY by the release workflow in silvio-l/loam
# (.github/workflows/release.yml) and pushed into silvio-l/homebrew-loam.
# Do not edit the copy in the tap by hand — edit this template instead.
# Placeholders (0.1.0, __SHA_*__) are filled in at release time.
class Loam < Formula
  desc "Codebase intelligence & anti-AI-slop for Dart & Flutter"
  homepage "https://getloam.dev"
  version "0.1.0"
  license "MIT"

  # Apple Silicon only — Intel Macs install via `dart pub global activate loam`.
  on_macos do
    on_arm do
      url "https://github.com/silvio-l/loam/releases/download/v0.1.0/loam-macos-arm64.tar.gz"
      sha256 "60dfc92422d9e9062ca5f7036272f3d19a545e58f973e1f461fb1dc37e70aa7f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/silvio-l/loam/releases/download/v0.1.0/loam-linux-x86_64.tar.gz"
      sha256 "ce2bb6ce8492f24146cf94a0a3b8340139995b38dd31740f835285e01103a901"
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
