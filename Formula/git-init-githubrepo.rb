class GitInitGithubrepo < Formula
  desc "Create git repository structure for GitHub style"
  homepage "https://github.com/vigo/git-init-githubrepo"
  url "https://github.com/vigo/git-init-githubrepo/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "f36ca92347cacfb5e1106258428fdaa63a94d9f0daa11c8364b88a81a550499e"
  license "MIT"

  bottle do
    root_url "https://github.com/vigo/homebrew-git-init-githubrepo/releases/download/git-init-githubrepo-0.4.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "322fa19a99db9e700d9c86284018ef618b41bd33be12098c692358a07dd056cf"
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
      assert_equal "0.4.1", stdout.read.strip
    end
  end
end
