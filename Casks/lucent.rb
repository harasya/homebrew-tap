cask "lucent" do
  version "1.0.0-beta.2"
  sha256 intel: "1630268577f0617c39bc36b0e8b35ed25b7d047104e55504954548f1eeb573eb",
         arm:   "becd09e5e0f43f12e58ca8d55c58e07387380f3f8edc7736ddd48b4deb4b4d53"

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
