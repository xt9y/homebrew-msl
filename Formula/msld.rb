class Msld < Formula
  desc "Guest daemon for msl (macOS Subsystem for Linux)"
  homepage "https://github.com/xt9y/msl"
  url "https://github.com/xt9y/msl/archive/refs/tags/v0.7.25.tar.gz"
  sha256 "a66d1228c257808f4001992aaaa44e02d7ac73643bb7290bdaf1ae0de9d883f6"
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
