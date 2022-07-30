class GitInitGithubrepo < Formula
  desc "Create git repository structure for GitHub style"
  homepage "https://github.com/vigo/git-init-githubrepo"
  url "https://github.com/vigo/git-init-githubrepo/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "42cee4980f5aee5eab18cd478d2eeb89a320bc57516cf36ecae6d2e7c858554b"
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
      assert_equal "0.3.1", stdout.read.strip
    end
  end
end
