class GitInitGithubrepo < Formula
  desc "Create git repository structure for GitHub style"
  homepage "https://github.com/vigo/git-init-githubrepo"
  url "https://github.com/vigo/git-init-githubrepo/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "78a7f1f25d8b9a0b36374218c6221cceea04b6e5da50bf20e65de9af3be8d95d"
  license "MIT"

  bottle do
    root_url "https://github.com/vigo/homebrew-git-init-githubrepo/releases/download/git-init-githubrepo-0.3.2"
    sha256 cellar: :any_skip_relocation, monterey:     "6bf2333845661c65a5d9065c615dfd2a08e707a0b280772661741bdf1a1a134e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5b9251d2e8b761abe83b10f41bcf3a51be99156eef17d7772a8929a555a31b09"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
    generate_completions_from_executable(
      bin/"git-init-githubrepo",
      "--bash-completion",
      "completions",
      shells: [:bash],
    )
  end

  test do
    require "open3"
    Open3.popen3("#{bin}/git-init-githubrepo", "--version") do |stdin, stdout, _|
      stdin.close
      assert_equal "0.3.2", stdout.read.strip
    end
  end
end
