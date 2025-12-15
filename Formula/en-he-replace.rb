class AwsUrlCopyTool < Formula
  desc "Auto-modify macOS clipboard for AWS URLs"
  homepage "https://github.com/esharf/en-he-replace"
  url "https://github.com/esharf/en-he-replace/releases/download/v0.0.5/en-he-replace-macos.zip"
  sha256 "250c0ab5c57d38507fbd5e92b3d90537cd1bdff2f7f9287ddd6a925d1d6a205d"
  version "0.0.5"

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
