cask "lucent" do
  version "1.0.0-beta.2"
  sha256 intel: "d84dd3dcc9900fc8e62d8be59231774d9e88cbbef74b0e7934715b8058a63e74",
         arm:   "9a0fca94c1a4ee20ec10a0eb8dc967ab7f043461fe4d4a028cdca96db29f69a6"

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
