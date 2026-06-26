class ClaudeCommander < Formula
  desc "High-performance terminal UI for managing Claude coding sessions"
  homepage "https://github.com/sizeak/claude-commander"
  url "https://github.com/sizeak/claude-commander/archive/refs/tags/v0.20.0.tar.gz"
  sha256 "7cbd638dccd195170995d7ee713c03b642cb157918c8d11956e0dbede07f67d8"
  license "MIT"
  head "https://github.com/sizeak/claude-commander.git", branch: "main"

  depends_on "rust" => :build

  depends_on "tmux"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-commander --version")
  end
end
