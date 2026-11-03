import QtQuick
import Quickshell
import qs.services
import qs.components
import qs.config

Row {
    id: root

    readonly property color iconColor: Theme.white1

    function getIcon() {
        const b = Brightness.percentage
        if (b >= 90) return "󰃠";
        if (b >= 10) return "󰃟";
        return "󰃞";
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