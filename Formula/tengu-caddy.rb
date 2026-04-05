class TenguCaddy < Formula
  desc "Caddy web server with Cloudflare DNS plugin"
  homepage "https://github.com/tengu-apps/tengu-caddy"
  version "2.11.2-4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/tengu-apps/tengu-caddy/releases/download/v#{version}/tengu-caddy-macos-arm64"
      sha256 "c5b5db7db5cc0ba1399d43c433014c3d97f139056d240cc0cd63e10f9a5fcc39"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tengu-apps/tengu-caddy/releases/download/v#{version}/tengu-caddy-linux-arm64"
      sha256 "bbb6f80e6735a1aec2ca4101fc2e777ea3a41a24aef5264e90bf9a940c05f211"
    end

    on_intel do
      url "https://github.com/tengu-apps/tengu-caddy/releases/download/v#{version}/tengu-caddy-linux-amd64"
      sha256 "53f32265bfb05c9b2e2cfefe1dd4d54b2ea69a8eae7307688744d5248ea1bf2c"
    end
  end

  conflicts_with "caddy", because: "both install a caddy binary"

  def install
    binary = Dir["tengu-caddy-*"].first || "tengu-caddy"
    bin.install binary => "caddy"
  end

  test do
    assert_match "cloudflare", shell_output("#{bin}/caddy list-modules 2>&1")
  end
end
