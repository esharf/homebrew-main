class EnHeReplace < Formula
  desc "Replace English text with Hebrew equivalents on macOS"
  homepage "https://github.com/esharf/en-he-replace"
  url "https://github.com/esharf/en-he-replace/releases/download/v0.0.8/en-he-replace-macos.zip"
  sha256 "6f1a317eab33207c56e6a0e33fe8ce36d749d09616e7ea154f025c074ee030cb"
  version "0.0.8"

  def install
    bin.install "en-he-replace"
    pkgshare.install "resources/en<->he.workflow"
  end

  def post_install
    services_dir = File.expand_path("~/Library/Services")
    mkdir_p services_dir unless Dir.exist?(services_dir)
    cp_r pkgshare/"resources/en<->he.workflow", services_dir
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