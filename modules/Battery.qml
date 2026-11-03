import QtQuick
import Quickshell
import Quickshell.Services.UPower
import qs.components
import qs.config

Row {
    id: root

    // --- Battery ---
    readonly property var battery: UPower.displayDevice
    readonly property bool batteryPresent: battery?.isLaptopBattery ?? false
    readonly property real batteryPct: (battery?.percentage ?? 0) * 100
    readonly property bool batteryCharging: battery?.state === UPowerDeviceState.Charging || battery?.state === UPowerDeviceState.PendingCharge
    readonly property color iconColor: (batteryPct < 20 && !batteryCharging) ? Theme.red : Theme.white1

    function getIcon() {
        if (batteryPct >= 99) return "󰁹";
        if (batteryPct >= 90) return "󰂂";
        if (batteryPct >= 80) return "󰂁";
        if (batteryPct >= 70) return "󰂀";
        if (batteryPct >= 60) return "󰁿";
        if (batteryPct >= 50) return "󰁾";
        if (batteryPct >= 40) return "󰁽";
        if (batteryPct >= 30) return "󰁼";
        if (batteryPct >= 20) return "󰁻";
        if (batteryPct >= 10) return "󰁺";
        return "󰂎";
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