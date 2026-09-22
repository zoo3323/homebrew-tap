class Ezet < Formula
  desc "Pick and attach remote tmux sessions over SSH and Eternal Terminal"
  homepage "https://github.com/zoo3323/ezet"
  url "https://github.com/zoo3323/ezet/archive/refs/tags/v1.0.5.tar.gz"
  sha256 "fa7395ed03c67c5d91120ce7b238fd258195132bdf36390afaf725e94783a937"
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
