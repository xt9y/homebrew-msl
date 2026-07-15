class Msld < Formula
  desc "Guest daemon for msl (macOS Subsystem for Linux)"
  homepage "https://github.com/xt9y/msl"
  url "https://github.com/xt9y/msl/archive/refs/tags/v1.1.5.tar.gz"
  sha256 "9c3aa2a03507c5a84cbd4a0296a55566ec27a736e8ae8cc689ed04b6f737a152"
  license "MIT"

  depends_on "filosottile/musl-cross/musl-cross" => "with-aarch64"
  depends_on :macos

  def install
    system "aarch64-linux-musl-gcc", "-static", "-Os", "-s", "-o", "msld", "Guest/msld.c"
    bin.install "msld"
  end

  def post_install
    chmod 0755, bin/"msld"
  end

  test do
    assert_predicate bin/"msld", :exist?
  end
end