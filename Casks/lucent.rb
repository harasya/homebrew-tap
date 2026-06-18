cask "lucent" do
  version "1.0.0-beta.0"
  sha256 intel: "ed5d3e7da8365bee9e52188d7d53d173ae13ccbec63c9a0e7ef4017ec3a04593",
         arm:   "f2298f2461e5909656d7da279d1c8318a8c5110990c12eb920081a5fb085f047"

  on_intel do
    url "https://github.com/harasya/app-lucent/releases/download/v#{version}/Lucent-#{version}-mac.zip"
  end
  on_arm do
    url "https://github.com/harasya/app-lucent/releases/download/v#{version}/Lucent-#{version}-arm64-mac.zip"
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
