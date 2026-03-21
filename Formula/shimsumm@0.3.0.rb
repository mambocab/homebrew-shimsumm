class ShimsummAT030 < Formula
  desc "Transparent output filtering for LLM-managed shells"
  homepage "https://github.com/mambocab/shimsumm"
  url "https://github.com/mambocab/shimsumm/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "de599e0ea507951f207cda2a1ebd69d6d71e5efbd6789325e6a1c374105e932d"
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
