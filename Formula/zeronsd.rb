class Zeronsd < Formula
  @@version = "0.4.2"

  desc "Name service for ZeroTier Central"
  version @@version
  homepage "https://www.zerotier.com"
  url "https://github.com/zerotier/zeronsd.git",
    tag:      "v#{@@version}",
    revision: "670d0c0f1dd22b425fa2622f69aecb03eebda8b9"
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
