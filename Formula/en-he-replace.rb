class EnHeReplace < Formula
  desc "Replace English text with Hebrew equivalents on macOS"
  homepage "https://github.com/esharf/en-he-replace"
  url "https://github.com/esharf/en-he-replace/releases/download/v0.0.11/en-he-replace-macos.zip"
  sha256 "b85998a4c211a8a434ff1dea6a6966c655dff37919bf052ce52f65459a0f16f9"
  version "0.0.11"

  def install
    bin.install "en-he-replace"
    libexec.install "resources"
  end

def post_install
  user_home = ENV["HOME"]
  services_dir = File.join(user_home, "Library/Services")
  workflow_src = libexec/"resources/en<->he.workflow"
  workflow_dst = File.join(services_dir, "en<->he.workflow")

  mkdir_p services_dir
  rm_rf workflow_dst
  cp_r workflow_src, workflow_dst
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