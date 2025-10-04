class Insightctl < Formula
  desc "Railguard CLI"
  homepage "https://github.com/RailguardAI/railguard-mvp"
  version "1.0.3"

  on_macos do
    on_arm do
      url "https://github.com/RailguardAI/railguard-mvp/releases/download/v1.0.3/insightctl-darwin-arm64"
      sha256 "97a65b6fd3f75f01b0702febeacf06c39368a93e378931c85f29f5c9d2ed02a0"
    end
    on_intel do
      url "https://github.com/RailguardAI/railguard-mvp/releases/download/v1.0.3/insightctl-darwin-amd64"
      sha256 "df686e7a918360a5971727b019ebae8a1e9acfa377d36bf57add0788230c0643"
    end
  end

  on_linux do
    url "https://github.com/RailguardAI/railguard-mvp/releases/download/v1.0.3/insightctl-linux-amd64"
    sha256 "908a72332a24c8de921dea682c5c7a6e79e65283b721b8a7c5006b2e6ffb7f83"
  end

  def install
    target = if OS.mac? && Hardware::CPU.arm?
      "insightctl-darwin-arm64"
    elsif OS.mac? && Hardware::CPU.intel?
      "insightctl-darwin-amd64"
    else
      "insightctl-linux-amd64"
    end
    bin.install target => "insightctl"
  end

  test do
    assert_match "insightctl", shell_output("#{bin}/insightctl --help")
  end
end
