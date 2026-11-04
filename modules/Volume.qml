import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Services.Pipewire
import qs.components
import qs.config

Row {
    id: root

    // --- Volume ---
    readonly property var activeSink: Pipewire.defaultAudioSink
    readonly property bool isMuted: activeSink?.audio?.muted ?? true
    readonly property real volumeLevel: activeSink?.audio?.volume ?? 0.0
    readonly property color iconColor: isMuted ? Theme.yellow : Theme.white1

    PwObjectTracker {
        objects: root.activeSink ? [root.activeSink] : []
    }

    function getIcon() {
        if (isMuted) return "";
        if (volumeLevel >= 0.66) return "";
        if (volumeLevel >= 0.33) return "";
        if (volumeLevel > 0 ) return "";
        return "";
    }

    // LazyLoader {
    //     id: popupLoader

    //     loading: true        
    //     Panel {}
    // }

    function getClicked() {
        // icon.clicked();
        // popupLoader.item.visible = !popupLoader.item.visible
        openWindow.running = true;
    }

    Process {
        id: openWindow
        running: false
        command: [ "pwvucontrol" ]
        stdout: StdioCollector {
            onStreamFinished: console.log(`line read: ${this.text}`)
        }
    }

    Icon {
        id: icon
    }
}