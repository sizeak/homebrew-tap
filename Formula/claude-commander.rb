class ClaudeCommander < Formula
  desc "High-performance terminal UI for managing Claude coding sessions"
  homepage "https://github.com/sizeak/claude-commander"
  url "https://github.com/sizeak/claude-commander/archive/refs/tags/v0.35.0.tar.gz"
  sha256 "4391ef32e64cfd33edbdf247dfcd121d04ac7dc76a2c012e8d8874f095af2500"
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
