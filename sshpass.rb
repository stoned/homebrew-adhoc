require 'formula'
 
class Sshpass < Formula
  url 'http://downloads.sourceforge.net/project/sshpass/sshpass/1.05/sshpass-1.05.tar.gz'
  homepage 'http://sshpass.sourceforge.net/'
  sha256 'c3f78752a68a0c3f62efb3332cceea0c8a1f04f7cf6b46e00ec0c3000bc8483e'
 
  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
    "--prefix=#{prefix}"
    system "make install"
  end
 
  def test
    system "sshpass"
  end
end
