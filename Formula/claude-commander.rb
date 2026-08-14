class ClaudeCommander < Formula
  desc "High-performance terminal UI for managing Claude coding sessions"
  homepage "https://github.com/sizeak/claude-commander"
  url "https://github.com/sizeak/claude-commander/archive/refs/tags/v0.34.0.tar.gz"
  sha256 "12560128cc74277e5df7a524e232120b26cb2ae7de98dc98f5ba6eb0151043cc"
  license "MIT"
  head "https://github.com/sizeak/claude-commander.git", branch: "main"

  depends_on "rust" => :build

  depends_on "tmux"

  def install
    # The repo root is a virtual manifest (a `[workspace]` with no `[package]`)
    # as of v0.24.0, so the default `path: "."` no longer resolves. Point at the
    # crate that actually produces the binary.
    system "cargo", "install", *std_cargo_args(path: "crates/claude-commander")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-commander --version")
  end
end
