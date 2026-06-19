cask "lucent" do
  version "1.0.0-beta.6"
  sha256 intel: "e1ff53a7258a776fa109f294ab9b4fc46150576b77d7f569a3b095332522e4f8",
         arm:   "8a69ffa15b354e0793bab267624b7b0696f4e8b35e1e438f74116700522cc39b"

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
