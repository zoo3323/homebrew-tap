class Ezet < Formula
  desc "Interactive CLI to pick and attach remote tmux sessions over SSH/Eternal Terminal"
  homepage "https://github.com/zoo3323/ezet"
  url "https://github.com/zoo3323/ezet/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "c90664bff5d205930a6dc50d56cbc599882a63a18ec4a76da3dc7d14d8d00fbf"
  license "MIT"
  head "https://github.com/zoo3323/ezet.git", branch: "main"

  def install
    bin.install "bin/ezet"
  end

  def caveats
    <<~EOS
      Optional: install Eternal Terminal for automatic reconnection.
        brew install eternal-terminal

      Check your setup:
        ezet --doctor
    EOS
  end

  test do
    assert_match "ezet #{version}", shell_output("#{bin}/ezet --version")
    assert_match "compatibility check", shell_output("#{bin}/ezet --doctor", 1)
  end
end
