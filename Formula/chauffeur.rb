class Chauffeur < Formula
  desc "Let a coding agent drive the iOS Simulator, with every action verified"
  homepage "https://github.com/YashNaj/chauffeur"
  url "https://github.com/YashNaj/chauffeur.git", tag: "v0.2.0", revision: "5c0aba59a2268e9085c18e0f2d3f0d068bec86d0"
  license "Apache-2.0"

  depends_on xcode: ["26.0", :build]
  depends_on arch: :arm64
  depends_on :macos

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/chauffeur"
  end

  test do
    assert_match "0.2.0", shell_output("#{bin}/chauffeur --version")
  end
end
