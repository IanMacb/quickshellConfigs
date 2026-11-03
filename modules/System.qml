import QtQuick
import Quickshell
import qs.config

Item {
    id: root

    Row {
        id: iconsRow
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        spacing: 18

        Volume {}

        Brightness {}

        Bluetooth {}

        Network {}

        Battery {}
    }
}