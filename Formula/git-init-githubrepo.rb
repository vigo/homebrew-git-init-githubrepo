class GitInitGithubrepo < Formula
  desc "Create git repository for GitHub style"
  homepage "https://github.com/vigo/git-init-githubrepo"
  url "https://github.com/vigo/git-init-githubrepo/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "19b7fff21d9a7e26ba661fe6eb5ed92a0451694f13144ace4a76baf8fbd020f0"
  license "MIT"

  bottle do
    root_url "https://github.com/vigo/homebrew-git-init-githubrepo/releases/download/git-init-githubrepo-0.2.0"
    sha256 cellar: :any_skip_relocation, catalina:     "e93666f044c83267a35f097264da46ac4a69175e5a0e70cfc2b6e3e4cac76b9b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fc657235d34a214ba9a1674f7f294b8dd5d1c4fb6d07d509613abe786e4b8529"
  end

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
