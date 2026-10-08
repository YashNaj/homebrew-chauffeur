class Chauffeur < Formula
  desc "Let a coding agent drive the iOS Simulator, with every action verified"
  homepage "https://github.com/YashNaj/chauffeur"
  url "https://github.com/YashNaj/chauffeur.git", tag: "v0.1.0", revision: "89a459fa8eb72ecbe46969af7456ab53ffdd95d1"
  license "Apache-2.0"

  depends_on xcode: ["26.0", :build]
  depends_on arch: :arm64
  depends_on :macos

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/chauffeur"
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/chauffeur --version")
  end
end
