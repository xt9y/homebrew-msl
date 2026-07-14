class Msl < Formula
  desc "macOS Subsystem for Linux — run Arch Linux on Apple's Virtualization.framework"
  homepage "https://github.com/xt9y/msl"
  url "https://github.com/xt9y/msl/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "9c76d8d74af1ff2e758203a6b20c069091539221b87385c941d75b23033ff4d2"
  license "MIT"

  depends_on :macos
  depends_on xcode: ["15.0", :build]

  def install
    system "make"
    bin.install "build/msl"
  end

  test do
    system "#{bin}/msl", "--version"
  end
end
