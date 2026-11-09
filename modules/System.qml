import QtQuick
import Quickshell
import qs.config

Item {
    id: systemControl

    Row {
        id: iconsRow
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        spacing: 14

        Volume {}

        Brightness {}

        Bluetooth {}

        Network {}

        Battery {}
    }
}