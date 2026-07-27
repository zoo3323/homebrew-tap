class Ezet < Formula
  desc "Pick and attach remote tmux sessions over SSH and Eternal Terminal"
  homepage "https://github.com/zoo3323/ezet"
  url "https://github.com/zoo3323/ezet/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "eb6299d6e744ab057a47dd5f8af4df37e8d0ff57e57e2bed6d8bdfa53bf38696"
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
