import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Networking
import qs.components
import qs.config
import qs.services


Row {
    id: root
    // --- Network ---

    // if wifi is on and disconnected then repeat "checkConnectivity" every 2 seconds
    // Timer {
    //     id: wifiRecheck
    //     interval: 2000
    //     running: true
    //     repeat: true
    //     onTriggered: Networking.checkConnectivity()
    // }

    property var wifiDevice: Networking.devices.values.find(d => d.type === DeviceType.Wifi)
    property var active: wifiDevice ? wifiDevice.networks.values.find(n => n.connected) : null

    // readonly property bool ethernetConnected: active.some(dev => dev.networks === undefined && dev.connected)
    readonly property color iconColor: (active) ? Theme.white1 : Theme.yellow

    function getIcon() {
        if (active) {
            const s = active.signalStrength ?? 0;
            if (s >= 0.8) return "󰤨";
            if (s >= 0.6) return "󰤥";
            if (s >= 0.4) return "󰤢";
            if (s > 0.2) return "󰤟";
            return "󰤯";
        }
        return "󰤮";
        if (ethernetConnected) return "󰈀";
    }

    function getClicked() {
        openWindow.running = true;
    }

    Process {
        id: openWindow
        running: false
        command: [ "nmgui" ]
        stdout: StdioCollector {
            onStreamFinished: console.log(`line read: ${this.text}`)
        }
    }

    Icon {}
}