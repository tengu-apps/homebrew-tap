class Tengu < Formula
  desc "Self-hosted PaaS for deploying web applications via git push"
  homepage "https://tengu.to"
  version "0.2.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tengu-apps/homebrew-tap/releases/download/tengu-v#{version}/tengu-macos-arm64"
      sha256 "9641f61f44b181ccf20b6a9c709deeed841a74b04aeea5c5e06ef3b7e72a5d69"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tengu-apps/homebrew-tap/releases/download/tengu-v#{version}/tengu-linux-arm64"
      sha256 "45ad90ffeb91079714fb3868140639d62b5786e95bf2a99070250ab589799934"
    end

    on_intel do
      url "https://github.com/tengu-apps/homebrew-tap/releases/download/tengu-v#{version}/tengu-linux-amd64"
      sha256 "d58c908d3e83ca5164d2fea12dada442cae6e39ae51600eee2072849bf1a04ca"
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
