import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Bluetooth
import qs.components
import qs.config

Row {
    id: root

    // --- Bluetooth ---
    readonly property var btAdapter: Bluetooth.defaultAdapter ?? (Bluetooth.adapters?.values?.[0] ?? null)
    readonly property bool btPowered: btAdapter?.enabled ?? false
    readonly property int btConnectedCount: (btAdapter?.devices?.values ?? []).filter(d => d.connected).length
    readonly property color iconColor: !btPowered ? Theme.white1 : (btConnectedCount > 0 ? Theme.white1 : Theme.white1)

    function getIcon() {
        if (!btPowered) return "󰂲";
        return btConnectedCount > 0 ? "󰂱" : "";
    }

    function getClicked() {
        openWindow.running = true;
    }

    Process {
        id: openWindow
        running: false
        command: [ "blueman-manager" ]
        stdout: StdioCollector {
            onStreamFinished: console.log(`line read: ${this.text}`)
        }
    }

    Icon {}
}