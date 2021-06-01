class Zeronsd < Formula
  @@version = "0.1.5"

  desc "Name service for ZeroTier Central"
  version @@version
  homepage "https://www.zerotier.com"
  url "https://github.com/zerotier/zeronsd.git",
    tag:      "v#{@@version}",
    revision: "0dff075fee775f20a76efb189c370576a1182a55"
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
