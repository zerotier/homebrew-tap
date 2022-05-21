class Zeronsd < Formula
  @@version = "0.5.2"

  desc "Name service for ZeroTier Central"
  version @@version
  homepage "https://www.zerotier.com"
  url "https://github.com/zerotier/zeronsd.git",
    tag:      "v#{@@version}",
    revision: "3128f57fdb25b81d2e93d04059766736dcabaa5a"
  license "BSD-3-Clause"

  depends_on "pkg-config" => :build
  depends_on "rust" => :build
  depends_on "rustfmt" => :build
  depends_on "openssl"

  def install
    ENV["RUSTFMT"] = "rustfmt"
    system "cargo", "build", "--release", "--bin", "zeronsd"
    bin.install "target/release/zeronsd"
  end

  test do
    system "zeronsd", "help"
  end
end
