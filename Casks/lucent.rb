cask "lucent" do
  version "1.0.0-beta.3"
  sha256 intel: "b9979f1c5d6e78f64c0d23bdf87aa0e6b02591c2f53aee42cd4a538419cef79b",
         arm:   "093f7fb6264b36d7241149c8dcce64df07d8d894c8592eefb3f834fdfe734ce5"

  on_intel do
    url "https://github.com/harasya/homebrew-tap/releases/download/v#{version}/Lucent-#{version}-mac.zip"
  end
  on_arm do
    url "https://github.com/harasya/homebrew-tap/releases/download/v#{version}/Lucent-#{version}-arm64-mac.zip"
  end

  name "Lucent"
  desc "Zero-Touch Development Environment Manager"
  homepage "https://github.com/harasya/app-lucent"

  app "Lucent.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/Lucent.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/lucent",
    "~/Library/Preferences/com.lucent.app.plist",
    "~/Library/Saved Application State/com.lucent.app.savedState",
  ]
end
