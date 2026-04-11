class Tengu < Formula
  desc "Self-hosted PaaS for deploying web applications via git push"
  homepage "https://tengu.to"
  version "0.2.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tengu-apps/homebrew-tap/releases/download/tengu-v#{version}/tengu-macos-arm64"
      sha256 "be8733b844a9f6d2347010c127c76ed4c23e5864b0cc7ab28821e0821ac7ff7b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tengu-apps/homebrew-tap/releases/download/tengu-v#{version}/tengu-linux-arm64"
      sha256 "412b84604884c3985375efc538002df38557be53b27ba4e59435bc87f49e3f2d"
    end

    on_intel do
      url "https://github.com/tengu-apps/homebrew-tap/releases/download/tengu-v#{version}/tengu-linux-amd64"
      sha256 "fda9a7870e4d9133fc7e30b1b71f2e07887000f2f026c18f95094bfc07700d40"
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
