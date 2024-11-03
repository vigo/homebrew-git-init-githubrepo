class GitInitGithubrepo < Formula
  desc "Create git repository structure for GitHub style"
  homepage "https://github.com/vigo/git-init-githubrepo"
  url "https://github.com/vigo/git-init-githubrepo/archive/refs/tags/v0.3.6.tar.gz"
  sha256 "80542bddc092913a739d3e2c77b77378f56229ecd7ac186055203ff2c21df20e"
  license "MIT"

  bottle do
    root_url "https://github.com/vigo/homebrew-git-init-githubrepo/releases/download/git-init-githubrepo-0.3.6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5a5dd19851f2f7922f2d4fb05f19c6e4030c53e321e1b94e650f491b13103015"
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
      assert_equal "0.3.6", stdout.read.strip
    end
  end
end
