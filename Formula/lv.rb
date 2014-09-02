require "formula"

class Lv < Formula
  homepage "http://www.ff.iij4u.or.jp/~nrt/lv/"
  url "http://www.ff.iij4u.or.jp/~nrt/freeware/lv451.tar.gz"
  version "4.51"
  sha1 "1a70299c27aa317a436976a557853858db4dcb5f"

  bottle do
    sha1 "077f8feee1b78425a38f1775cfa0bba5b5334569" => :mavericks
    sha1 "08a9356422f94eddb2d767ab167048fb291cede7" => :mountain_lion
    sha1 "4bc23132a51ab1fb35ec2af15473d1d928c9475d" => :lion
  end

  def patches
    DATA
  end

  def install
    cd "build" do
      system "../src/configure", "--prefix=#{prefix}"
      system "make"
      bin.install "lv"
      bin.install_symlink "lv" => "lgrep"
    end

    man1.install "lv.1"
    (lib+"lv").install "lv.hlp"
  end
end

__END__
--- a/src/stream.c  2012-01-01 00:00:00.000000000 +0000
+++ b/src/stream.c  2012-01-01 00:00:00.000000000 +0000
@@ -41,7 +41,7 @@
 #include <begin.h>
 #include "stream.h"

-private byte *gz_filter = "zcat";
+private byte *gz_filter = "gzcat";
 private byte *bz2_filter = "bzcat";

 private stream_t *StreamAlloc()
