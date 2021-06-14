class GitInitGithubrepo < Formula
  desc "Create git repository for GitHub style"
  homepage "https://github.com/vigo/git-init-githubrepo"
  url "https://github.com/vigo/git-init-githubrepo/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "19b7fff21d9a7e26ba661fe6eb5ed92a0451694f13144ace4a76baf8fbd020f0"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
    (bash_completion/"git-init-githubrepo").write `#{bin}/git-init-githubrepo --bash-completion`
  end

  test do
    require "open3"
    Open3.popen3("#{bin}/git-init-githubrepo", "--version") do |stdin, stdout, _|
      stdin.close
      assert_equal "0.2.0", stdout.read.strip
    end
  end
end
