class Bouine < Formula
  desc "Cloud-native HTTP cache in Go — RFC 9111 compliant, zero-alloc hit path"
  homepage "https://github.com/bouine-cache/bouine"
  version "0.5.16"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/bouine-cache/bouine/releases/download/v#{version}/bouine-v#{version}-darwin-arm64"
      sha256 "712e2966e8891dc80635ead3df5756ea15654c915b0759a9c688d4392c951bab"
    end
    on_intel do
      url "https://github.com/bouine-cache/bouine/releases/download/v#{version}/bouine-v#{version}-darwin-amd64"
      sha256 "f8f53176d5d8f804cce39ffaad33ae091eff466b5bd4607d751f7edc7ad9ef96"
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
