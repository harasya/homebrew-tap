cask "lucent" do
  version "1.0.0-beta.0"
  sha256 intel: "8bc73710bae008d1034f52e68d0e48ebe72454f5ae8a1f80dd719b1da39d3b26",
         arm:   "80a8ec023690402cbfa04b1f09b720762cbc16f3ad17c49518f25901cb0ff7da"

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
