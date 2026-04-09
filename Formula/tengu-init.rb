class TenguInit < Formula
  desc "Provision Tengu PaaS servers via SSH"
  homepage "https://github.com/tengu-apps/tengu-init"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tengu-apps/tengu-init/releases/download/v#{version}/tengu-init-apple-silicon"
      sha256 "14bbc1b586989ed49f9269887f8720bbe3959de6d5a976616195474440492fb3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tengu-apps/tengu-init/releases/download/v#{version}/tengu-init-linux-arm64"
      sha256 "01c68e3deac6a566ff15c5f8300dda9d0dc3ba9c4d76c8e3893a442fc22aa2e2"
    end

    on_intel do
      url "https://github.com/tengu-apps/tengu-init/releases/download/v#{version}/tengu-init-linux-amd64"
      sha256 "d3842b44be217dd6d20cc281676f5a0f05bbe7cedc366d8b8331d3df47abf891"
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
