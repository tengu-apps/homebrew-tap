class Tengu < Formula
  desc "Self-hosted PaaS for deploying web applications via git push"
  homepage "https://tengu.to"
  version "0.2.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tengu-apps/homebrew-tap/releases/download/tengu-v#{version}/tengu-macos-arm64"
      sha256 "535a85cf2c14675370c8f45abad9c32236735257e73982f32a59b0a963ba5b80"
    end

    on_intel do
      url "https://github.com/tengu-apps/homebrew-tap/releases/download/tengu-v#{version}/tengu-macos-intel"
      sha256 "58db1d5afc193cc6e937a24d68bf3f84418f40ea299d03b9c77ea5e7bf3c9bed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tengu-apps/homebrew-tap/releases/download/tengu-v#{version}/tengu-linux-arm64"
      sha256 "2ea37a3316414e63a338aadf6948cc7572d9d33fc4516fba7a4aebdab3899cad"
    end

    on_intel do
      url "https://github.com/tengu-apps/homebrew-tap/releases/download/tengu-v#{version}/tengu-linux-amd64"
      sha256 "abbe876f4bf3dd6250db7af2c81c0dc60c0ee38fbf290aa3446421290beb311b"
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
