require "formula"

class Helios < Formula
  homepage "https://github.com/spotify/helios"
  url "https://oss.sonatype.org/service/local/repositories/releases/content/com/spotify/helios-tools/0.8.97/helios-tools-0.8.97-shaded.jar"
  sha1 "6a5bb3b5e019ca5adb672f185eb7451ce30cfe30"
  version "0.8.97"

  depends_on :java => "1.7"

  def install
    libexec.install "helios-tools-0.8.97-shaded.jar"
    bin.write_jar_script libexec/"helios-tools-0.8.97-shaded.jar", "helios", "-XX:+TieredCompilation -XX:TieredStopAtLevel=1 -Xverify:none"
  end

  test do
    system "#{bin}/helios", "--version"
  end
end
