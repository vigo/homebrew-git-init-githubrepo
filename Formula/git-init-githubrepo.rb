class GitInitGithubrepo < Formula
  desc "Create git repository structure for GitHub style"
  homepage "https://github.com/vigo/git-init-githubrepo"
  url "https://github.com/vigo/git-init-githubrepo/archive/refs/tags/v0.3.3.tar.gz"
  sha256 "69d7946af5010b7ed3ddb9cd38fc82ef5e23818908dae724a5a5927d26731d68"
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
      assert_equal "0.3.3", stdout.read.strip
    end
  end
end
