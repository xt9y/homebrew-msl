class Msl < Formula
  desc "macOS Subsystem for Linux — run Arch Linux ARM via Virtualization.framework"
  homepage "https://github.com/xt9y/msl"
  url "https://github.com/xt9y/msl/archive/refs/tags/v.tar.gz"
  sha256 "31c0335770b6677f2d041102a6f984604e591a3dbdb35e4a1f73f58102f30ccc"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on :macos

  def install
    system "make"
    bin.install "build/msl"
  end

  test do
    system bin/"msl", "--version"
  end
end
