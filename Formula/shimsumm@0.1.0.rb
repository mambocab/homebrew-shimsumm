class ShimsummAT010 < Formula
  desc "Transparent output filtering for LLM-managed shells"
  homepage "https://github.com/mambocab/shimsumm"
  url "https://github.com/mambocab/shimsumm/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "842190b27c9ef21c88de14ec696591717a8a764e52075d8516f8918dbc4e397d"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w", output: bin/"shimsumm"), "./cmd/shimsumm"
    generate_completions_from_executable(bin/"shimsumm", "completion")
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/shimsumm", 1)
  end
end
