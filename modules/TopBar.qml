import QtQuick
import Quickshell
import Quickshell.Hyprland
import Quickshell.Wayland
import qs.services
import qs.config

Variants {
    id: root

    model: Quickshell.screens

    delegate: PanelWindow {
        id: topBar

        required property var modelData
        // --- Fullscreen Detection Logic ---
        readonly property HyprlandMonitor monitor: Hyprland.monitorFor(screen)

        screen: modelData
        // --- Layer Shell Configuration ---
        WlrLayershell.layer: WlrLayer.Overlay
        WlrLayershell.namespace: "quickshell-topbar"
        visible: !FullscreenState.isFullscreen(monitor)
        color: '#cc000000'
        implicitHeight: Layout.topBarHeight

        // --- Geometry & Positioning ---
        anchors {
            top: true
            left: true
            right: true
        }

        // --- Core Modules ---
        Workspaces {
            id: workspaceModule

            targetMonitor: modelData.name

            anchors {
                left: parent.left
                leftMargin: Layout.barMargin
                verticalCenter: parent.verticalCenter
            }

        }

        Clock {
            id: clockModule

            anchors.centerIn: parent
        }

        // SystemTray {
        //     id: statusModule

        //     windowHandle: mainBar

        //     anchors {
        //         right: commandCenterModule.left
        //         rightMargin: Layout.barMargin
        //         verticalCenter: parent.verticalCenter
        //     }

        // }

        System {
            id: systemModule

            anchors {
                right: parent.right
                rightMargin: Layout.barMargin
                verticalCenter: parent.verticalCenter
            }

        }

    }

}
