class Bouine < Formula
  desc "Cloud-native HTTP cache in Go — RFC 9111 compliant, zero-alloc hit path"
  homepage "https://github.com/bouine-cache/bouine"
  version "0.5.6"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/bouine-cache/bouine/releases/download/v#{version}/bouine-v#{version}-darwin-arm64"
      sha256 "90b10a39153ed2a345e92b7c0bce8abe935f83b3b4c8793237b6bfa641441e2b"
    end
    on_intel do
      url "https://github.com/bouine-cache/bouine/releases/download/v#{version}/bouine-v#{version}-darwin-amd64"
      sha256 "f026af53f8f5e56f81aaa168038161438cb1a8b9e091dab29dd1a4add25cdbf1"
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
