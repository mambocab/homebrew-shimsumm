class Shimsumm < Formula
  desc "Transparent output filtering for LLM-managed shells"
  homepage "https://github.com/OWNER/shimsumm"
  head "https://github.com/OWNER/shimsumm.git", branch: "main"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/shimsumm"
    generate_completions_from_executable(bin/"shimsumm", "completion")
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/shimsumm", 1)
  end
end
