class Libzt < Formula
  desc "Encrypted P2P socket networking library"
  homepage "https://www.zerotier.com"
  url "https://github.com/zerotier/libzt.git",
      tag:      "1.4.0",
      revision: "613c7e8f91cf83b993524a8f4ca9b883937331c2"
  license "BUSL-1.1"

  depends_on "cmake" => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "cmake", "--build", "."
    system "make", "install"
    prefix.install "LICENSE.txt" => "LICENSE"
  end

  test do
    (testpath/"test.cpp").write <<~EOS
      #include <ZeroTierSockets.h>
      int main()
      {
        return zts_bsd_socket(0,0,0) != -2;
      }
    EOS
    system ENV.cxx, "-v", "test.cpp", "-o", "test", "-L#{lib}", "-lzt"
    system "./test"
  end
end

