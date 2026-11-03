import QtQuick
import Quickshell

PopupWindow {
    id: root

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

        color: "gray"
    }

}