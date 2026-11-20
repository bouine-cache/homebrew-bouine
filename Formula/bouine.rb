class Bouine < Formula
  desc "Cloud-native HTTP cache in Go — RFC 9111 compliant, zero-alloc hit path"
  homepage "https://github.com/bouine-cache/bouine"
  version "0.6.7"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/bouine-cache/bouine/releases/download/v#{version}/bouine-v#{version}-darwin-arm64"
      sha256 "e8c12f22d84aaf7d5b9f97c3b4b7abd76f1b6e313cf152757b5dd77a74880433"
    end
    on_intel do
      url "https://github.com/bouine-cache/bouine/releases/download/v#{version}/bouine-v#{version}-darwin-amd64"
      sha256 "f758931281bd79fcc73c693016c32c9f9e32916fa7d822f62b92387f21c3aa60"
    end
  end

  def install
    on_arm do
      bin.install "bouine-v#{version}-darwin-arm64" => "bouine"
    end
    on_intel do
      bin.install "bouine-v#{version}-darwin-amd64" => "bouine"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bouine version")
  end
end
