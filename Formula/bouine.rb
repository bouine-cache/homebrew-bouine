class Bouine < Formula
  desc "Cloud-native HTTP cache in Go — RFC 9111 compliant, zero-alloc hit path"
  homepage "https://github.com/bouine-cache/bouine"
  version "0.5.28"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/bouine-cache/bouine/releases/download/v#{version}/bouine-v#{version}-darwin-arm64"
      sha256 "6d0804306d17c71b30d99f3e6234caabe18b859735cfc6209473ecd2115349a3"
    end
    on_intel do
      url "https://github.com/bouine-cache/bouine/releases/download/v#{version}/bouine-v#{version}-darwin-amd64"
      sha256 "34614775c54911bcffa995c262695f5398bbd81852e9f8ec308dacb73fafcca5"
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
