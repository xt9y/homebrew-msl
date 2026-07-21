class Msl < Formula
  desc "macOS Subsystem for Linux — run Arch Linux ARM via Virtualization.framework"
  homepage "https://github.com/xt9y/msl"
  url "https://github.com/xt9y/msl/archive/4e02a3e472495b947fcdb6068c83f8c92ee565e0.tar.gz"
  version "1.6.1"
  sha256 "3c65a7b33765bcc6ac69f5cf8f1498a6faf518ecde39960db3ed6123c728a95c"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on "xt9y/msl/msld"
  depends_on :macos

  def install
    ENV["SWIFTC"] = "xcrun swiftc"
    system "make", "sign"
    bin.install "build/msl"
  end

  test do
    system bin/"msl", "version"
  end
end