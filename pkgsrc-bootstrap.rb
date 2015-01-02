require 'formula'

class PkgsrcBootstrap < Formula
  homepage 'http://www.pkgsrc.org'
  url 'http://ftp.netbsd.org/pub/pkgsrc/stable/pkgsrc-2014Q4.tar.bz2'
  version '2014Q4'
  sha1 '43877bd74974609ef3c4a184246e2e52575412db'

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
