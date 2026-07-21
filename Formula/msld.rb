class Msld < Formula
  desc "Guest daemon for msl (macOS Subsystem for Linux)"
  homepage "https://github.com/xt9y/msl"
  url "https://github.com/xt9y/msl/archive/4e02a3e472495b947fcdb6068c83f8c92ee565e0.tar.gz"
  version "1.6.1"
  sha256 "3c65a7b33765bcc6ac69f5cf8f1498a6faf518ecde39960db3ed6123c728a95c"
  license "MIT"

  depends_on "zig"
  depends_on :macos

  def install
    system "zig", "cc", "-target", "aarch64-linux-musl", "-static", "-Os", "-s", "-o", "msld", "Guest/msld.c"
    bin.install "msld"
  end

  test do
    assert_predicate bin/"msld", :exist?
  end
end