class Libzt < Formula
  desc "ZeroTier (libzt): An encrypted P2P networking layer for applications"
  homepage "https://www.zerotier.com"
  
  depends_on "make" => :build
  depends_on "cmake" => :build

  stable do
    version "1.3.0"
    url "https://github.com/zerotier/libzt.git", :branch => "master", :revision => "3d1159882117278fcb5fabb623bd62175b6c7e6c"
  end

  head do
    url "https://github.com/zerotier/libzt.git"
  end

  devel do
    version "1.3.1"
    url "https://github.com/zerotier/libzt.git", :branch => "dev"
  end

  def install
    system "make", "update"
    system "cmake", ".", *std_cmake_args
    system "cmake", "--build", "."
    system "make", "install"
    system "cp", "LICENSE.GPL-3", "#{prefix}/LICENSE"
  end

  def caveats
    <<~EOS
      Visit https://my.zerotier.com to create virtual networks and authorize devices.
      Visit https://www.zerotier.com/manual.shtml to learn more about how ZeroTier works.
      Visit https://github.com/zerotier/ZeroTierOne/tree/master/controller to learn how to run your own network controller (advanced).
    EOS
  end

  test do
    system "false"
  end
end
