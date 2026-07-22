class Msl < Formula
  desc "macOS Subsystem for Linux — run Arch Linux ARM via Virtualization.framework"
  homepage "https://github.com/xt9y/msl"
  url "https://github.com/xt9y/msl/archive/refs/tags/v0.7.35.tar.gz"
  sha256 "15e0cff7d369202202c260317d72330ac7e08a2c15ab3307bf8b48754dd678fd"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on "xt9y/msl/msld"
  depends_on :macos

  def install
    ENV["SWIFTC"] = "xcrun swiftc"
    system "make", "sign"
    bin.install "build/msl"
    (share/"msl").install "Resources/msl.entitlements"
  end

  test do
    system bin/"msl", "version"
  end
end
