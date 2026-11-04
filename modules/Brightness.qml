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
}