class Tengu < Formula
  desc "Self-hosted PaaS for deploying web applications via git push"
  homepage "https://tengu.to"
  version "0.2.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tengu-apps/homebrew-tap/releases/download/tengu-v#{version}/tengu-macos-arm64"
      sha256 "fb21c4951852acfd151800de3cba48fc83de53285d5a4a0080c3faa935078437"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tengu-apps/homebrew-tap/releases/download/tengu-v#{version}/tengu-linux-arm64"
      sha256 "e46a26c17ad332f5e03e52b519723c00a0e83aac83fcfe0b3471f4d595b444f0"
    end

    on_intel do
      url "https://github.com/tengu-apps/homebrew-tap/releases/download/tengu-v#{version}/tengu-linux-amd64"
      sha256 "d37153bcc915e92e25c786145aa2b684da2ff26214c409819044f7cee7b37e2a"
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
