class GitInitGithubrepo < Formula
  desc "Create git repository structure for GitHub style"
  homepage "https://github.com/vigo/git-init-githubrepo"
  url "https://github.com/vigo/git-init-githubrepo/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "b09fc4d72092ed7b2688887fcce62048199de0856854d88c0c99a6e79b139e4e"
  license "MIT"

  bottle do
    root_url "https://github.com/vigo/homebrew-git-init-githubrepo/releases/download/git-init-githubrepo-0.4.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e4c7ba3e2d0cf086fff73fee9b21a052d2e52fd2ddad14299fc2540e4c37017e"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args, "./cmd/git-init-githubrepo"
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
      assert_equal "0.4.0", stdout.read.strip
    end
  end
end
