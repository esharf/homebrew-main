class EnHeReplace < Formula
  desc "Replace English text with Hebrew equivalents on macOS"
  homepage "https://github.com/esharf/en-he-replace"
  url "https://github.com/esharf/en-he-replace/releases/download/v0.0.10/en-he-replace-macos.zip"
  sha256 "fd23001efa14ba40e7892953b20f4f3c110abf192f0f334df0cbf832b395087b"
  version "0.0.10"

  def install
    bin.install "en-he-replace"
    libexec.install "resources"
  end

  def post_install
    services_dir = File.expand_path("~/Library/Services")
    mkdir_p services_dir unless Dir.exist?(services_dir)
    cp_r libexec/"resources/en<->he.workflow", services_dir
  end

  def caveats
    <<~EOS
      To uninstall completely, run:

        rm -rf ~/Library/Services/en\\<-\\>he.workflow

      Then refresh Services if needed:
        killall -u "$USER" pbs
    EOS
  end
end