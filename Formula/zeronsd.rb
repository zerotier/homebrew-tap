class Zeronsd < Formula
  @@version = "0.2.6"

  desc "Name service for ZeroTier Central"
  version @@version
  homepage "https://www.zerotier.com"
  url "https://github.com/zerotier/zeronsd.git",
    tag:      "v#{@@version}",
    revision: "f6bd9b52be2f3d36a2a99ecd40a7526eb4fb93c3"
  license "BSD-3-Clause"

  depends_on "pkg-config" => :build
  depends_on "rust" => :build
  depends_on "openssl"

  def install
    system "cargo", "build", "--release", "--bin", "zeronsd"
    bin.install "target/release/zeronsd"
  end

  test do
    system "zeronsd", "help"
  end
end
