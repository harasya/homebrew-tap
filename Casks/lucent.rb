cask "lucent" do
  version "1.0.0-beta.4"
  sha256 intel: "4e802d429b367ad31f466e54d70672371ec151fe9a8c4e2e809e377f0f382a65",
         arm:   "9e555d97718a39751c2a2f000e95f597c31bf1c7e371f8718a640a34454d17b0"

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
