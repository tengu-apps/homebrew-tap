class TenguInit < Formula
  desc "Provision Tengu PaaS servers via SSH"
  homepage "https://github.com/tengu-apps/tengu-init"
  version "0.5.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tengu-apps/tengu-init/releases/download/v#{version}/tengu-init-apple-silicon"
      sha256 "f1350692a833bbe5eea9fa18612c6891d350ba50b919a1bd8a36827a77f907cc"
    end

    on_intel do
      url "https://github.com/tengu-apps/tengu-init/releases/download/v#{version}/tengu-init-macos-intel"
      sha256 "2f2600a97a807e5af04b0c434c3579fd10c96e5afee7033ee114b71a4b4fb9b8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tengu-apps/tengu-init/releases/download/v#{version}/tengu-init-linux-arm64"
      sha256 "cecd2f99ac503cff3e1690035ded2b0d5660cbc594e034632aa13886d67f88ed"
    end

    on_intel do
      url "https://github.com/tengu-apps/tengu-init/releases/download/v#{version}/tengu-init-linux-amd64"
      sha256 "42018659e615b8a9d04fa42eaca257c45a531b07fe4200113f927095d2fa00e2"
    end
  end

  def install
    binary_name = if OS.mac?
      Hardware::CPU.arm? ? "tengu-init-apple-silicon" : "tengu-init-macos-intel"
    elsif OS.linux?
      Hardware::CPU.arm? ? "tengu-init-linux-arm64" : "tengu-init-linux-amd64"
    end
    bin.install binary_name => "tengu-init"
  end

  test do
    assert_match "tengu-init", shell_output("#{bin}/tengu-init --version")
  end
end
