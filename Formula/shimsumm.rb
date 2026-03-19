class Shimsumm < Formula
  desc "Transparent output filtering for LLM-managed shells"
  homepage "https://github.com/mambocab/shimsumm"
  url "https://github.com/mambocab/shimsumm/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "22d2565884bb3ebc68811c4abe9efece2fd310b848dddea3875df97aa0dfbe8b"
  license "MIT"
  head "https://github.com/mambocab/shimsumm.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/shimsumm"
    generate_completions_from_executable(bin/"shimsumm", "completion")
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/shimsumm", 1)
  end
end
