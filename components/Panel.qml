import QtQuick
import Quickshell
import qs.config

PopupWindow {
    id: root

    function closePanel() {
        root.visible = false
    }

    function setPanelTimer(b) {
        closeTimer.running = b
    }

    Timer {
        id: closeTimer
        interval: 1200
        repeat: false
        running: false
        onTriggered: closePanel()
    }

    anchor.window: topBar
    anchor.rect.x: 1920 - 8 - implicitWidth
    anchor.rect.y: topBar.implicitHeight + 8
    implicitWidth: 300
    implicitHeight: 400
    visible: false

    color: "transparent"
    Rectangle {
        id: panel

        anchors.fill: parent
        implicitWidth: parent.implicitWidth
        implicitHeight: parent.implicitHeight
        radius: 4

        color: Theme.grey00
    }
}