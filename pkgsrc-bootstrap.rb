require 'formula'

class PkgsrcBootstrap < Formula
  homepage 'http://www.pkgsrc.org'
  url 'http://ftp.netbsd.org/pub/pkgsrc/stable/pkgsrc-2016Q2.tar.bz2'
  version '2016Q2'
  sha256 '2eb6ace0e083abc4c6202722bdf8e9add9bb1b9f76b6f845da390ca8fc15e7a7'

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
