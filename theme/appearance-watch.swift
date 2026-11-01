// Runs `<theme script> sync` whenever macOS switches between light and dark mode.
// Built and started as a LaunchAgent by `theme install-watcher`.
import Foundation

let script = CommandLine.arguments[1]

DistributedNotificationCenter.default().addObserver(
    forName: Notification.Name("AppleInterfaceThemeChangedNotification"), object: nil, queue: .main
) { _ in
    // the new appearance reaches `defaults` a moment after the notification
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        let sync = Process()
        sync.executableURL = URL(fileURLWithPath: script)
        sync.arguments = ["sync"]
        try? sync.run()
    }
}

RunLoop.main.run()
