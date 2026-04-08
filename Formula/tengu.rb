class Tengu < Formula
  desc "Self-hosted PaaS for deploying web applications via git push"
  homepage "https://tengu.to"
  version "0.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tengu-apps/homebrew-tap/releases/download/tengu-v#{version}/tengu-macos-arm64"
      sha256 "d9aa4d58d8be332cf450f740b2af5e5ec0115cc3105f6234fafe42234ba14005"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tengu-apps/homebrew-tap/releases/download/tengu-v#{version}/tengu-linux-arm64"
      sha256 "1dce3a0575cf253a16b1251fc318ae26ea7cd538e236c43bbbf7fba03a5fc145"
    end

    on_intel do
      url "https://github.com/tengu-apps/homebrew-tap/releases/download/tengu-v#{version}/tengu-linux-amd64"
      sha256 "0f83f28731cb9d3c690bd9d590cd8216b3abe8218621920251d5bf3c75646e50"
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
