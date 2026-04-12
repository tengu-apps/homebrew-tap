class Tengu < Formula
  desc "Self-hosted PaaS for deploying web applications via git push"
  homepage "https://tengu.to"
  version "0.2.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tengu-apps/homebrew-tap/releases/download/tengu-v#{version}/tengu-macos-arm64"
      sha256 "5d7ff03320057ced80eed277eebd6675648c278c1c412b912487b6cf97c4989d"
    end

    on_intel do
      url "https://github.com/tengu-apps/homebrew-tap/releases/download/tengu-v#{version}/tengu-macos-intel"
      sha256 "dea58dd29f530124a8df1cbb3e4e13467bddd364d2f7cca69b380794383f0d9f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tengu-apps/homebrew-tap/releases/download/tengu-v#{version}/tengu-linux-arm64"
      sha256 "d1af259119eed2fa9cb90138bcd78f29630e16f6667cfcc4e8e58c60cee1e36b"
    end

    on_intel do
      url "https://github.com/tengu-apps/homebrew-tap/releases/download/tengu-v#{version}/tengu-linux-amd64"
      sha256 "863c5c77131235f21d772d6d52a066915c12eeba1797506104947ebea5654144"
    end
  end

  def install
    binary_name = if OS.mac?
      Hardware::CPU.arm? ? "tengu-macos-arm64" : "tengu-macos-intel"
    elsif OS.linux?
      Hardware::CPU.arm? ? "tengu-linux-arm64" : "tengu-linux-amd64"
    end
    bin.install binary_name => "tengu"
  end

  test do
    assert_match "tengu", shell_output("#{bin}/tengu --version")
  end
end
