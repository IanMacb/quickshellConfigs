import QtQuick
import Quickshell
import Quickshell.Io
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
    readonly property real battChangeRate: Math.round(battery?.changeRate * 100) / 100

    readonly property var qtimeFull: QTime.setHMS(0,0,battery?.timeToFull)
    readonly property var qtimeEmpty: QTime.setHMS(0,0,battery?.timeToEmpty)
    // readonly property real battTimeToFull: Math.round(battery?.timeToFull / 60)
    readonly property string battTimeToFull: Math.floor(battery?.timeToFull / 3600) + "h:" + Math.round((battery?.timeToFull % 3600) / 60) + "m"
    // readonly property real battTimeToEmpty: Math.round(battery?.timeToEmpty / 60)
    readonly property string battTimeToEmpty: Math.floor(battery?.timeToEmpty / 3600) + "h:" + Math.round((battery?.timeToEmpty % 3600) / 60) + "m"

    readonly property color iconColor: batteryPct === 100 ? Theme.green : (batteryPct > 20 || batteryCharging || !batteryPresent) ? Theme.white1 : Theme.red
    readonly property bool hasPowerProfile: PowerProfiles.hasPerformanceProfile
    readonly property var powerProfile: PowerProfiles.profile
    readonly property color barColor: (powerProfile === 2 ) ? Theme.green : (powerProfile === 0 ? Theme.yellow : Theme.white1)

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

    function setPowerProfile(n) {
        PowerProfiles.profile = n
    }

    function getClicked() {
        popupLoader.item.visible = !popupLoader.item.visible
    }

    LazyLoader {
        id: popupLoader

        loading: true
        Panel {
            // visible: true
            id: batteryPanel
            property int panelWidth: batteryPanel.implicitWidth - 20
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onExited: setPanelTimer(true)
                onEntered: setPanelTimer(false)

                Column{
                    // Title
                    topPadding: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    // spacing: 0
                    Rectangle {
                        implicitWidth: panelWidth
                        implicitHeight: 30
                        color: Theme.grey00
                        Text {
                            anchors.left: parent.left
                            color: Theme.white1
                            font: Theme.font
                            text: "Battery"
                        }
                        Text {
                            anchors.right: parent.right
                            color: Theme.white1
                            font: Theme.font
                            text: batteryPct === 100 ? "Charged" : (batteryCharging ? "Charging" : "Discharging")
                        }
                    }

                    // Battery bar
                    Rectangle {
                        implicitWidth: panelWidth
                        implicitHeight: 30
                        color: Theme.grey00
                        Rectangle {
                            anchors.centerIn: parent
                            implicitHeight: 12
                            implicitWidth: panelWidth - 10
                            radius: 4
                            color: Theme.grey0
                            Rectangle {
                                implicitHeight: 12
                                implicitWidth: parent.implicitWidth * batteryPct / 100
                                radius: 4
                                color: batteryPct > 20 ? Theme.green : (batteryPct <= 20 ? Theme.yellow : Theme.red)
                            }
                        }
                    }
                    // Battery detailed info
                    Rectangle{
                        implicitHeight: 30
                        implicitWidth: panelWidth
                        color: Theme.grey000
                        Row {
                            anchors.centerIn: parent
                            spacing: 0
                            Repeater {
                                model: [batteryPct + "%", battChangeRate + "W", (batteryCharging ? battTimeToFull : battTimeToEmpty)]
                                Rectangle {
                                    required property var modelData
                                    implicitHeight: 30
                                    implicitWidth: panelWidth / 3
                                    color: "transparent"
                                    Text {
                                        anchors.centerIn: parent
                                        color: Theme.white1
                                        font: Theme.font
                                        text: modelData + " "
                                    }
                                }
                            }
                        }
                    }

                    Rectangle {
                        implicitHeight: 30
                        implicitWidth: panelWidth
                        color: "transparent"
                    }

                    // Power profiles
                    Text {
                        color: Theme.white1
                        font: Theme.font
                        text: "Power Profile"
                    }
                    Rectangle {
                        id: powerProfilesSlider
                        implicitHeight: 60
                        implicitWidth: panelWidth
                        radius: 4
                        color: Theme.grey000
                        Row {
                            anchors.centerIn: parent
                            spacing: 15
                            Repeater {
                                model: ["", "", ""]
                                Rectangle {
                                    required property int index
                                    required property string modelData
                                    implicitHeight: powerProfilesSlider.implicitHeight * 0.8
                                    implicitWidth: powerProfilesSlider.implicitWidth / 3 * 0.8
                                    radius : 4
                                    color: powerProfile === index ? Theme.blue3 : "transparent"
                                    Behavior on color { ColorAnimation { duration: 150 } }
                                    
                                    MouseArea {
                                        id: mouse       
                                        anchors.fill: parent
                                        hoverEnabled: true
                                        propagateComposedEvents: true
                                        cursorShape: Qt.PointingHandCursor
                                        onClicked: setPowerProfile(index)
                                    }
                                    Text {
                                        anchors.centerIn: parent
                                        color: Theme.white1
                                        font: Theme.font
                                        text: modelData
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }


    // Icon
    Rectangle {
        // padding: 0
        // spacing: -2
        implicitHeight: topBar.implicitHeight
        implicitWidth: 16
        color: "transparent"
        Icon {
            anchors.centerIn: parent
        }

        Rectangle {
            implicitHeight: 3
            implicitWidth: 20
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom

            color: barColor
        }
    }
}