import QtQuick
import Quickshell
import qs.config

Text {
    id: icon

    // signal clicked
    text: getIcon()
    color: iconColor
    font: Theme.font
    // anchors.verticalCenter: parent.verticalCenter


    Behavior on color { ColorAnimation { duration: 150 } }
    Behavior on scale { NumberAnimation { duration: 50 } }


    scale: mouse.pressed ? 1.2 : 1.0
    
    MouseArea {
        id: mouse
        anchors.centerIn: parent
        implicitHeight: topBar.implicitHeight
        implicitWidth: parent.implicitWidth + 10
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: getClicked()
    }
}