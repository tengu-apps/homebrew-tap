class Tengu < Formula
  desc "Self-hosted PaaS for deploying web applications via git push"
  homepage "https://tengu.to"
  version "0.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tengu-apps/homebrew-tap/releases/download/tengu-v#{version}/tengu-macos-arm64"
      sha256 "efc051d28a6b7fff49f257363c73c4f9e253338b516bc156322573a9e3906228"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tengu-apps/homebrew-tap/releases/download/tengu-v#{version}/tengu-linux-arm64"
      sha256 "225a6ef1d75b214319413fe5af8b8cfb19297da02ef11bd6fd19776efa774caa"
    end

    on_intel do
      url "https://github.com/tengu-apps/homebrew-tap/releases/download/tengu-v#{version}/tengu-linux-amd64"
      sha256 "f60e085bcde8ec56183c0ae1315e4711ae2500c8aecfcc8fba7584a511c955a2"
    end
  end

  def install
    binary_name = "tengu-macos-arm64"
    if OS.linux?
      binary_name = Hardware::CPU.arm? ? "tengu-linux-arm64" : "tengu-linux-amd64"
    end
    bin.install binary_name => "tengu"
  end

  test do
    assert_match "tengu", shell_output("#{bin}/tengu --version")
  end
end
