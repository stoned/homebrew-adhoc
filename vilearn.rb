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
  sha256 '6c3662b1598bd830bc746fc42a2b28849ace2f69464231cbcf3b22ee4b8e3d2e'

  def install
    inreplace "vilearn.sh", ':TUTORIALS:', "#{prefix}/share/vilearn"
    inreplace "vilearn.sh", /echo(\s+)-n(\s+)/, '/bin/echo\1-n\2'
    inreplace "vilearn.man", ':SEC:', '1'
    bin.install "vilearn.sh" => 'vilearn'
    man1.install "vilearn.man" => 'vilearn.1'
    (share/'vilearn').install Dir['[123456789]*']
  end
end
