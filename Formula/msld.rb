class Msld < Formula
  desc "Guest daemon for msl (macOS Subsystem for Linux)"
  homepage "https://github.com/xt9y/msl"
  url "https://github.com/xt9y/msl/archive/refs/tags/v1.7.15.tar.gz"
  sha256 "94825741f990dab2abc4d0e0d9624a60cee77e2b39fbb37dc5cf9cb3e40e8328"
  license "MIT"

  depends_on "zig"
  depends_on :macos

  def install
    system "zig", "cc", "-target", "aarch64-linux-musl", "-static", "-Os", "-s", "-o", "msld", "Guest/msld.c"
    system "chmod", "+x", "msld"
    bin.install "msld"
  end

  test do
    assert_predicate bin/"msld", :exist?
  end
end
