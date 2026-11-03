import QtQuick
// import qs.bar.widgets.calendar
import qs.services
import qs.config

Item {
    // implicitWidth: visualPill.implicitWidth
    // implicitHeight: visualPill.implicitHeight
    // Rectangle {
    //     // Use standard UI opacity overlays instead of jumping to primary_container
    //     // color: {
    //     //     if (calendarWidget.visible)
    //     //         // 12% overlay for an active/toggled state
    //     //         return Qt.tint(Theme.surface_container, Qt.rgba(Theme.on_surface.r, Theme.on_surface.g, Theme.on_surface.b, 0.12));
    //     //     if (pillMouse.containsMouse)
    //     //         // 8% overlay for a subtle hover state
    //     //         return Qt.tint(Theme.surface_container, Qt.rgba(Theme.on_surface.r, Theme.on_surface.g, Theme.on_surface.b, 0.08));
    //     id: visualPill
    //     anchors.centerIn: parent
    //     implicitWidth: timeLabel.implicitWidth + 32
    //     implicitHeight: timeLabel.implicitHeight + 16
    //     radius: 2
    //     //     return Theme.surface_container; // Base state
    //     // }
    //     color: "transparent"
    //     // Tamed: Only scales down slightly when physically clicked
    //     scale: pillMouse.pressed ? 0.95 : 1
    //     MouseArea {
    //         id: pillMouse
    //         anchors.fill: parent
    //         hoverEnabled: true
    //         cursorShape: Qt.PointingHandCursor
    //         onClicked: calendarWidget.visible = !calendarWidget.visible
    //     }

    id: root

    Row {
        anchors.centerIn: parent
        spacing: 10

        Text {
            id: dateLabel

            text: Time.date
            color: Theme.blue4
            font: Theme.font
        }

        Text {
            id: timeLabel

            text: Time.time
            color: Theme.blue2
            font: Theme.font
        }

        Text {
            id: zoneLabel

            text: Time.zone
            color: Theme.green
            font: Theme.font
        }

    }

    // CalendarWidget {
    //     id: calendarWidget

    //     visible: false
    // }

}
