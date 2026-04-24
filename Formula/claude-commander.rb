class ClaudeCommander < Formula
  desc "High-performance terminal UI for managing Claude coding sessions"
  homepage "https://github.com/sizeak/claude-commander"
  url "https://github.com/sizeak/claude-commander/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "b4dff27c5daa75ac17bebebdd2982f7cfa3883c97eb95aa38db26f9ffc595a17"
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
