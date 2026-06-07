# typed: false
# frozen_string_literal: true

# Homebrew formula for loam.dev.
#
# RENDERED AUTOMATICALLY by the release workflow in silvio-l/loam
# (.github/workflows/release.yml) and pushed into silvio-l/homebrew-loam.
# Do not edit the copy in the tap by hand — edit this template instead.
# Placeholders (0.1.1, __SHA_*__) are filled in at release time.
class Loam < Formula
  desc "Codebase intelligence & anti-AI-slop for Dart & Flutter"
  homepage "https://getloam.dev"
  version "0.1.1"
  license "MIT"

  # Apple Silicon only — Intel Macs install via `dart pub global activate loam`.
  on_macos do
    on_arm do
      url "https://github.com/silvio-l/loam/releases/download/v0.1.1/loam-macos-arm64.tar.gz"
      sha256 "c1d42d1ccd3eb7615db9dc07ca8246a669d70abdb9403c046139ffd5e767aae6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/silvio-l/loam/releases/download/v0.1.1/loam-linux-x86_64.tar.gz"
      sha256 "58bf5e40734dad8c5f0027de99157f33f41de3b63c99022db770c7cf12b395de"
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
