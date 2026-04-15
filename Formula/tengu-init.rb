class TenguInit < Formula
  desc "Provision Tengu PaaS servers via SSH"
  homepage "https://github.com/tengu-apps/tengu-init"
  version "0.5.7"
  license "MIT"

  on_linux do
    on_arm do
      url "https://github.com/tengu-apps/tengu-init/releases/download/v#{version}/tengu-init-linux-arm64"
      sha256 "ae6327977f44709adfdd711b7a414b5f8cd484c2f5673c85f257b7488bb003be"
    end

    on_intel do
      url "https://github.com/tengu-apps/tengu-init/releases/download/v#{version}/tengu-init-linux-amd64"
      sha256 "59906233cbaf44c571e0beb5366f4c721082f1d75dcec6ee790411da7646cce5"
    end
  end

  def install
    binary_name = if OS.linux?
      Hardware::CPU.arm? ? "tengu-init-linux-arm64" : "tengu-init-linux-amd64"
    end
    bin.install binary_name => "tengu-init"
  end

  test do
    assert_match "tengu-init", shell_output("#{bin}/tengu-init --version")
  end
end
