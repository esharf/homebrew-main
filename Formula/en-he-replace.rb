class EnHeReplace < Formula
  desc "Replace English text with Hebrew equivalents on macOS"
  homepage "https://github.com/esharf/en-he-replace"
  url "https://github.com/esharf/en-he-replace/releases/download/v0.0.7/en-he-replace-macos.zip"
  sha256 "228015d31299083b4633f3f97ce1ded0e96c189993ca40f3d0a69901e20e3057"
  version "0.0.7"

  def install
    bin.install "en-he-replace"
    pkgshare.install "resources/en<->he.workflow"
  end

  def caveats
    <<~EOS
      To enable the included Automator service, copy the workflow to your Services folder:

        cp -R "#{pkgshare}/resources/en<->he.workflow" "~/Library/Services/"

      After copying, the service will be available in the Services menu.
    EOS
  end
end
