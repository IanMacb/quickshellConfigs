import QtQuick
import QtQuick.Effects
import Quickshell
import Quickshell.Hyprland
import Quickshell.Widgets
import qs.config

Item {
    id: root

    property string targetMonitor: ""

    // Animation state.
    property bool windowVisible: true
    property bool isLoaded: false
    readonly property bool allowAnimations: isLoaded && windowVisible

    // readonly property int animDurationShort: 150
    // readonly property int dotHeight: 6
    // readonly property int spacingAmount: 8

    readonly property var sortedWorkspaces: {
        var ws = Hyprland.workspaces.values;
        return ws.filter(w => w.id >= 1 && w.monitor?.name === root.targetMonitor).sort((a, b) => a.id - b.id);
    }

    // The monitor object for this bar instance — the authoritative source for
    // "what workspace is current here", rather than scanning workspace flags.
    readonly property var currentMonitor: {
        var mons = Hyprland.monitors.values;
        for (var m = 0; m < mons.length; m++) {
            if (mons[m].name === root.targetMonitor)
                return mons[m];
        }
        return null;
    }

    // Active workspace on this monitor, read directly from the monitor object.
    readonly property var focusedWorkspace: currentMonitor ? currentMonitor.activeWorkspace : null

    Component.onCompleted: {
        Hyprland.refreshToplevels();
        Hyprland.refreshWorkspaces();
        Hyprland.refreshMonitors();
        Qt.callLater(() => {
            root.isLoaded = true;
        });
    }

    Connections {
        target: Hyprland
        function onRawEvent(event) {
            if (event.name === "openwindow" || event.name === "closewindow" || event.name === "movewindow") {
                Hyprland.refreshToplevels();
                Hyprland.refreshWorkspaces();
            } else if (event.name === "workspace" || event.name === "workspacev2"
                       || event.name === "focusedmon" || event.name === "focusedmonv2"
                       || event.name === "moveworkspace" || event.name === "moveworkspacev2") {
                Hyprland.refreshWorkspaces();
                Hyprland.refreshMonitors();
            }
        }
    }

    Row {
        id: mainLayout

        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left

        spacing: 8

        Repeater {

            model: currentMonitor.name === "DP-1" ? Math.max(5, sortedWorkspaces[sortedWorkspaces.length - 1].id) : 
                  (currentMonitor.name === "DP-2" ? Math.max(5, sortedWorkspaces[sortedWorkspaces.length - 1].id - 10) : 
                   null)

            Rectangle {
                // required property int index
                property var monitorCorrectinonFactor: currentMonitor.name === "DP-2" ? 10 : 0
                property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1 + monitorCorrectinonFactor)
                property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1 + monitorCorrectinonFactor)
                width: isActive ? 25 : 8
                height: 8
                radius: 99
                color: isActive ? Theme.white3 : (ws ? Theme.white1 : Theme.grey3)
                MouseArea {
                    anchors.centerIn: parent
                    height: parent.height + 20
                    width: parent.width + 4
                    onClicked: ws.activate()
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                }

                Behavior on width {
                    enabled: root.allowAnimations
                    NumberAnimation {
                        duration: 280
                        easing.type: Easing.OutBack
                        easing.overshoot: 1.5
                    }
                }
                Behavior on color {
                    enabled: root.allowAnimations
                    ColorAnimation {
                        duration: 150
                    }
                }
            }
        }
    }
}
