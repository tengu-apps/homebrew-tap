class Tengu < Formula
  desc "Self-hosted PaaS for deploying web applications via git push"
  homepage "https://tengu.to"
  version "0.2.13"
  license "MIT"

  on_linux do
    on_arm do
      url "https://github.com/tengu-apps/homebrew-tap/releases/download/tengu-v#{version}/tengu-linux-arm64"
      sha256 "15c660780b59d9cffda4ecc783008667d766c78f95b4cbef87d2b261ea6d7882"
    end

    on_intel do
      url "https://github.com/tengu-apps/homebrew-tap/releases/download/tengu-v#{version}/tengu-linux-amd64"
      sha256 "ec354cdeb894ffbc6bb4690627bda1a246a05fa2f13e05ee3bd16824bc570479"
    end
  end

  def install
    binary_name = if OS.linux?
      Hardware::CPU.arm? ? "tengu-linux-arm64" : "tengu-linux-amd64"
    end
    bin.install binary_name => "tengu"
  end

  test do
    assert_match "tengu", shell_output("#{bin}/tengu --version")
  end
end
