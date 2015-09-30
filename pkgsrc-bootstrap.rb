require 'formula'

class PkgsrcBootstrap < Formula
  homepage 'http://www.pkgsrc.org'
  url 'http://ftp.netbsd.org/pub/pkgsrc/stable/pkgsrc-2015Q3.tar.bz2'
  version '2015Q3'
  sha1 'e4715dff314afd4b325b783857a2d7c82bb46263'

  def install
    ENV.deparallelize

    args = %W[--prefix=#{prefix} --pkgdbdir=#{prefix}/.db]
    args << "--sysconfdir=#{etc}"
    args << "--varbase=#{var}"
    args << "--unprivileged"
    args << "--abi=64"

    # XXX Assume XCode 5. on Mountain Lion
    if MacOS.version >= :mountain_lion
      ENV['CC'] = 'clang'
      args << "--compiler=clang"
    end

    cd 'bootstrap'
    system "./bootstrap", *args

  end

end
