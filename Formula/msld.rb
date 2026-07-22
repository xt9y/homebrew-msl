class Msld < Formula
  desc "Guest daemon for msl (macOS Subsystem for Linux)"
  homepage "https://github.com/xt9y/msl"
  url "https://github.com/xt9y/msl/archive/refs/tags/v0.7.24.tar.gz"
  sha256 "e0be912ba62ca2deae9928fedc341bafffb2795be8bd621ee38fd982bfab1121"
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
