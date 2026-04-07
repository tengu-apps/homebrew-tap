class TenguInit < Formula
  desc "Provision Tengu PaaS servers via SSH"
  homepage "https://github.com/tengu-apps/tengu-init"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tengu-apps/tengu-init/releases/download/v#{version}/tengu-init-apple-silicon"
      sha256 "38a1a6da4f442fb0423c30e1a4faa20341741597734c8cc0163828bf7524c038"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tengu-apps/tengu-init/releases/download/v#{version}/tengu-init-linux-arm64"
      sha256 "81e9ab961921c539110dcd2fd8c1a0c8074bf502d4592c3af0e94bb72698d7bc"
    end

    on_intel do
      url "https://github.com/tengu-apps/tengu-init/releases/download/v#{version}/tengu-init-linux-amd64"
      sha256 "78d01508e32048f0d9f8f95981e66b0ed85573d4dda730821a7f587c8b748720"
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
