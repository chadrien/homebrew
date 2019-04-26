class Tmuxinator < Formula
  desc "Install Tmuxinator as Homebrew formulae"
  homepage "https://github.com/tmuxinator/tmuxinator"
  url "https://api.github.com/repos/tmuxinator/tmuxinator/tarball/v0.16.0"
  sha256 "92e26f25d821f1530e12c8b10d1f83616bf8e37b49b3d327f80cba27ebcb572f"
  head "https://github.com/tmuxinator/tmuxinator.git"

  depends_on "ruby"

  bottle :unneeded

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "build", "tmuxinator.gemspec"
    system "gem", "install", "tmuxinator-#{version}.gem"
    bin.install libexec/"bin/tmuxinator"
    bin.env_script_all_files(libexec/"bin", :GEM_HOME => ENV["GEM_HOME"])
  end

  test do
    system "#{bin}/tmuxinator", "help"
  end
end
