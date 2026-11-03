import QtQuick
import Quickshell
import qs.config

Text {
    id: icon

    signal clicked
    text: getIcon()
    color: iconColor
    font: Theme.font
    anchors.verticalCenter: parent.verticalCenter


    Behavior on color { ColorAnimation { duration: 150 } }
    Behavior on scale { NumberAnimation { duration: 50 } }


    scale: mouse.pressed ? 1.2 : 1.0
    
    MouseArea {
        id: mouse
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: getClicked()
    }
}