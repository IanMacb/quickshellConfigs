import QtQuick
import Quickshell
import Quickshell.Io
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
                }}}}
    Icon {}
}