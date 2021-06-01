class Libzt < Formula
  desc "Encrypted P2P socket networking library"
  homepage "https://www.zerotier.com"
  url "https://github.com/zerotier/libzt.git",
      tag:      "1.6.0",
      revision: "3997bc9ed9eb7d2723c21ae119eb7aa3a93e0d8f"
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

