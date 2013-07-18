require 'formula'

class Libimobiledevice < Formula
  homepage 'http://www.libimobiledevice.org/'
  url 'https://github.com/libimobiledevice/libimobiledevice/archive/7eae52efbb2c43af2bd2a16fbc858610bfdbaeff.tar.gz'
  sha1 '63116ccc91b7a3d555d2b3efdf89f7e2cd942ed4'
  version '1.1.16'

  head 'http://cgit.sukimashita.com/libimobiledevice.git'

  depends_on 'pkg-config' => :build
  depends_on 'libtasn1'
  depends_on 'libplist'
  depends_on 'usbmuxd'
  depends_on 'gnutls'
  depends_on 'libgcrypt'

  def install
    ENV.append_to_cflags "-std=gnu89" if ENV.compiler == :clang

    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          # As long as libplist builds without Cython
                          # bindings, libimobiledevice must as well.
                          "--without-cython"
    system "make install"
  end
end