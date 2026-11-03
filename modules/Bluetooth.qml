import QtQuick
import Quickshell
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

    Icon {}

    // Text {
    //     id: icon
    //     signal clicked
    //     text: getIcon()
    //     color: iconColor
    //     font.pixelSize: 20
    //     anchors.verticalCenter: parent.verticalCenter
    //     Behavior on color { ColorAnimation { duration: 150 } }
    //     Behavior on scale { NumberAnimation { duration: 50 } }
    //     scale: mouse.pressed ? 1.2 : 1.0
    //     MouseArea {
    //         id: mouse
    //         anchors.fill: parent
    //         hoverEnabled: true
    //         cursorShape: Qt.PointingHandCursor
    //         onClicked: icon.clicked()
    //     }
    // }
}