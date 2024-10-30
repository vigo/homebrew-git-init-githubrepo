class GitInitGithubrepo < Formula
  desc "Create git repository structure for GitHub style"
  homepage "https://github.com/vigo/git-init-githubrepo"
  url "https://github.com/vigo/git-init-githubrepo/archive/refs/tags/v0.3.3.tar.gz"
  sha256 "69d7946af5010b7ed3ddb9cd38fc82ef5e23818908dae724a5a5927d26731d68"
  license "MIT"

  bottle do
    root_url "https://github.com/vigo/homebrew-git-init-githubrepo/releases/download/git-init-githubrepo-0.3.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "c648b255308fbe6bab524619715f2a7866a1f653b5c233485208cc2639ea7929"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args, "./cmd"
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
