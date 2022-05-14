class Zeronsd < Formula
  @@version = "0.5.0"

  desc "Name service for ZeroTier Central"
  version @@version
  homepage "https://www.zerotier.com"
  url "https://github.com/zerotier/zeronsd.git",
    tag:      "v#{@@version}",
    revision: "44424b829742e102b656a2e311cff540baf19935"
  license "BSD-3-Clause"

  depends_on "pkg-config" => :build
  depends_on "rust"
  depends_on "openssl"

  def install
    system "cargo", "build", "--release", "--bin", "zeronsd"
    bin.install "target/release/zeronsd"
  end

  test do
    system "zeronsd", "help"
  end
end
