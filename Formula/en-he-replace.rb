class EnHeReplace < Formula
  desc "Replace English text with Hebrew equivalents on macOS"
  homepage "https://github.com/esharf/en-he-replace"
  url "https://github.com/esharf/en-he-replace/releases/download/v0.0.6/en-he-replace-macos.zip"
  sha256 "64111d9ef29c5479eb9f073c493f6bb80017e5fd1a939f54ff4902a58f695460"
  version "0.0.6"

  def install
    bin.install "en-he-replace"
    pkgshare.install "en<->he.workflow"
  end

  def caveats
    <<~EOS
      To enable the included Automator service, copy the workflow to your Services folder:

        cp -R "#{pkgshare}/en<->he.workflow" "~/Library/Services/"

      After copying, the service will be available in the Services menu.
    EOS
  end
end
