class TenguInit < Formula
  desc "Provision Tengu PaaS servers via SSH"
  homepage "https://github.com/tengu-apps/tengu-init"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tengu-apps/tengu-init/releases/download/v#{version}/tengu-init-apple-silicon"
      sha256 "3da24db38a2a12eae799d0ff98af67740816771f398018b8621a020aa895fb93"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tengu-apps/tengu-init/releases/download/v#{version}/tengu-init-linux-arm64"
      sha256 "88c4c318a69607a6a1f287b305a20e620baa1fef65e813e541607e627f44a4ae"
    end

    on_intel do
      url "https://github.com/tengu-apps/tengu-init/releases/download/v#{version}/tengu-init-linux-amd64"
      sha256 "60eb13b76c1265ddfbef25938f5b5c4821162796204a4e2f50c9bee0f7451f09"
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
