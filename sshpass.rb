require 'formula'
 
class Sshpass < Formula
  url 'http://downloads.sourceforge.net/project/sshpass/sshpass/1.05/sshpass-1.05.tar.gz'
  homepage 'http://sshpass.sourceforge.net/'
  sha1 '6dafec86dd74315913417829542f4023545c8fd7'
 
  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
    "--prefix=#{prefix}"
    system "make install"
  end
 
  def test
    system "sshpass"
  end
end
