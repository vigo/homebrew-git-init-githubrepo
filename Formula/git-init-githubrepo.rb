class GitInitGithubrepo < Formula
  desc "Create git repository structure for GitHub style"
  homepage "https://github.com/vigo/git-init-githubrepo"
  url "https://github.com/vigo/git-init-githubrepo/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "42cee4980f5aee5eab18cd478d2eeb89a320bc57516cf36ecae6d2e7c858554b"
  license "MIT"

  bottle do
    root_url "https://github.com/vigo/homebrew-git-init-githubrepo/releases/download/git-init-githubrepo-0.3.1"
    sha256 cellar: :any_skip_relocation, big_sur:      "6084b21add9e86c6626ca1d1c3225be93708cf6f1ab0b21853f3df9b9afc96f3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "75cc04650350a7a7ba43d047f31cae24ff05b5335790f96f1a0f8cb8c64c07cc"
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
