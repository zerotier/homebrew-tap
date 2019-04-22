class Libzt < Formula
  desc "ZeroTier (libzt): An encrypted P2P networking layer for applications"
  homepage "https://www.zerotier.com"
  head "https://github.com/zerotier/libzt.git", :branch => "experimental"

  revision 1
  version "1.2.0"
  depends_on "make" => :build
  depends_on "cmake" => :build

  def install
    system "make", "update"
    system "cmake", ".", *std_cmake_args
    system "cmake", "--build", "."
    system "make", "install"
  end

  test do
    system "false"
  end
end
