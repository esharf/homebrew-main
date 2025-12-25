class EnHeReplace < Formula
  desc "Replace English text with Hebrew equivalents on macOS"
  homepage "https://github.com/esharf/en-he-replace"
  url "https://github.com/esharf/en-he-replace/releases/download/v0.0.12/en-he-replace-macos.zip"
  sha256 "979ff608c6307fdc6d918a432340706d2106ae683588a19cbd6acfb8eb2a8892"
  version "0.0.12"

  def install
    bin.install "en-he-replace"
    pkgshare.install "resources"
  end

  def caveats
    <<~EOS
      This formula installs the en-he-replace macOS Service.
      To enable it, copy the workflow to your Services folder:
        cp -R #{pkgshare}/en-he-replace.workflow ~/Library/Services/

      To uninstall completely, run:

        rm -rf ~/Library/Services/en\\<-\\>he.workflow

      Then refresh Services if needed:
        killall -u "$USER" pbs
    EOS
  end
end