class Ezet < Formula
  desc "Pick and attach remote tmux sessions over SSH and Eternal Terminal"
  homepage "https://github.com/zoo3323/ezet"
  url "https://github.com/zoo3323/ezet/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "1e6889408d5088388dc7c740cd7490439abeaee4de7aba942103151ed2f4d8ab"
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
