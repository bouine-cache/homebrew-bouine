class Bouine < Formula
  desc "Cloud-native HTTP cache in Go — RFC 9111 compliant, zero-alloc hit path"
  homepage "https://github.com/bouine-cache/bouine"
  version "0.5.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/bouine-cache/bouine/releases/download/v#{version}/bouine-v#{version}-darwin-arm64"
      sha256 "b6123ab28c1cb2bdcb424265e1c0c76c79425613c3d2941b2f665d2cba810e0a"
    end
    on_intel do
      url "https://github.com/bouine-cache/bouine/releases/download/v#{version}/bouine-v#{version}-darwin-amd64"
      sha256 "2cf97a9eea8107e65595692f25d230c6bac1bc2068fc15a3133551ed44ea309b"
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
