class Zeronsd < Formula
  @@version = "0.4.0"

  desc "Name service for ZeroTier Central"
  version @@version
  homepage "https://www.zerotier.com"
  url "https://github.com/zerotier/zeronsd.git",
    tag:      "v#{@@version}",
    revision: "8d66068caf10d5471719203577610704f116577a"
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
