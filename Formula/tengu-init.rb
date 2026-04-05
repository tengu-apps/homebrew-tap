class TenguInit < Formula
  desc "Provision Tengu PaaS servers via SSH"
  homepage "https://github.com/tengu-apps/tengu-init"
  version "0.3.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tengu-apps/tengu-init/releases/download/v#{version}/tengu-init-apple-silicon"
      sha256 "663ebd8e44f33eae4ff718e03a5903f2261ea82bf17201115b6d1226b6f6469d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tengu-apps/tengu-init/releases/download/v#{version}/tengu-init-linux-arm64"
      sha256 "afaf9372faf2e311397ad0f8a01db716e0c13bb6060f9d7bfad8577029b2cb35"
    end

    on_intel do
      url "https://github.com/tengu-apps/tengu-init/releases/download/v#{version}/tengu-init-linux-amd64"
      sha256 "472128f633c053682771edd307360ee91e137dc889f274de1a51ee1146a3a15f"
    end
  end

  def install
    binary = Dir["tengu-init-*"].first || "tengu-init"
    bin.install binary => "tengu-init"
  end

  test do
    assert_match "tengu-init", shell_output("#{bin}/tengu-init --version")
  end
end
