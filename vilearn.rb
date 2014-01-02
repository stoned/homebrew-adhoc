require 'formula'

class VilearnHttpDownloadStrategy < CurlDownloadStrategy
  def stage
    safe_system "gzcat #{@tarball_path} | sed '1,/^wes$/d' | sh"
    chdir
  end

  def ext
    ".shar.Z"
  end
end

class Vilearn < Formula
  homepage 'no-homepage'
  url 'http://ftp.NetBSD.org/pub/pkgsrc/distfiles/vilearn-1.0.shar.Z',
      :using => VilearnHttpDownloadStrategy
  version '1.0'
  sha1 '08aed424df46f30c93c604f3dc79d2affe1ec70e'

  def install
    inreplace "vilearn.sh", ':TUTORIALS:', "#{prefix}/share/vilearn"
    inreplace "vilearn.sh", /echo(\s+)-n(\s+)/, '/bin/echo\1-n\2'
    inreplace "vilearn.man", ':SEC:', '1'
    bin.install "vilearn.sh" => 'vilearn'
    man1.install "vilearn.man" => 'vilearn.1'
    (share/'vilearn').install Dir['[123456789]*']
  end
end
