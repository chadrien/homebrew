#!/usr/bin/env bash

tarballUrl=$(curl https://api.github.com/repos/tmuxinator/tmuxinator/releases/latest | grep tarball_url | awk '{print $2}' | sed -e 's/[",]//g')
curl -L ${tarballUrl} --output tmuxinator.tar.gz
sha256=$(sha256sum tmuxinator.tar.gz | awk '{print $1}')
rm tmuxinator.tar.gz

cat > $FORMULAS_DIR/tmuxinator.rb <<EOF
class Tmuxinator < Formula
  desc "Install Tmuxinator as Homebrew formulae"
  homepage "https://github.com/tmuxinator/tmuxinator"
  url "${tarballUrl}"
  sha256 "${sha256}"
  head "https://github.com/tmuxinator/tmuxinator.git"

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
EOF
