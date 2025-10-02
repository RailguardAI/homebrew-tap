class Insightctl < Formula
  desc "Railguard CLI for security/compliance automation"
  homepage "https://railguard.ai"
  version "1.0.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/RailguardAI/railguard-mvp/releases/download/v1.0.0/insightctl-linux-amd64.tar.gz"
      sha256 "485a38e2bfbb59fa28e4ad43b169d0c3c2814771fed8240c876522927b2ca805"
    else
      url "https://github.com/RailguardAI/railguard-mvp/releases/download/v1.0.0/insightctl-linux-amd64.tar.gz"
      sha256 "485a38e2bfbb59fa28e4ad43b169d0c3c2814771fed8240c876522927b2ca805"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/RailguardAI/railguard-mvp/releases/download/v1.0.0/insightctl-linux-amd64.tar.gz"
      sha256 "485a38e2bfbb59fa28e4ad43b169d0c3c2814771fed8240c876522927b2ca805"
    else
      odie "No prebuilt binary available for this Linux architecture yet"
    end
  end

  def install
    # Expect tarball to contain a single 'insightctl-linux-amd64' binary
    bin.install "insightctl-linux-amd64" => "insightctl"
    generate_completions_from_executable(bin/"insightctl", "completion") rescue nil
  end

  test do
    assert_match "1.0.0", shell_output("#{bin}/insightctl version")
  end

  livecheck do
    url :homepage
    strategy :page_match
  end
end