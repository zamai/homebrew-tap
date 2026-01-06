cask "meetingrecorder" do
  version "0.3"
  sha256 "9e5657e0d7a31c9d8fa1bdacc0a20dfd8bfb2f8843705bb4d1adeff4df6f0d16"

  url "https://github.com/zamai/MeetingRecorder/releases/download/v#{version}/MeetingRecorder.zip"
  name "MeetingRecorder"
  desc "Record system audio and microphone simultaneously on macOS"
  homepage "https://github.com/zamai/MeetingRecorder"

  depends_on macos: ">= :sonoma"

  app "MeetingRecorder.app"

  # Remove quarantine attribute for unsigned app
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/MeetingRecorder.app"],
                   sudo: false
  end

  uninstall quit: "com.zamai.MeetingRecorder"

  zap trash: [
    "~/Library/Application Support/MeetingRecorder",
    "~/Library/Preferences/com.zamai.MeetingRecorder.plist",
  ]
end
