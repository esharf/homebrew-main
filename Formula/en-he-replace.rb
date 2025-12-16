class EnHeReplace < Formula
  desc "Replace English text with Hebrew equivalents on macOS"
  homepage "https://github.com/esharf/en-he-replace"
  url "https://github.com/esharf/en-he-replace/releases/download/v0.0.9/en-he-replace-macos.zip"
  sha256 "d6b40c0888575276fe08b1e863c8d3ced12f2f76d8a68a81a29463625de77041"
  version "0.0.9"

  def install
    bin.install "en-he-replace"
    libexec.install "resources/en<->he.workflow"
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