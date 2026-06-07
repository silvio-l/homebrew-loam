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
  version "0.1.3"
  license "MIT"

  # Apple Silicon only — Intel Macs install via `dart pub global activate loam`.
  on_macos do
    on_arm do
      url "https://github.com/silvio-l/loam/releases/download/v0.1.3/loam-macos-arm64.tar.gz"
      sha256 "2837f89acbd99d435ba62d889d1b2bedbe56f531d4284c6acdcdecb14174385d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/silvio-l/loam/releases/download/v0.1.3/loam-linux-x86_64.tar.gz"
      sha256 "c11bcabae06654f5cebae8fd8dcde2b261209cf86030880ba0b534e620cdf7a0"
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
