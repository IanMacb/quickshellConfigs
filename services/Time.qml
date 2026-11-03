pragma Singleton

import Quickshell
import QtQuick

/** Global time provider for shell components. */
Singleton {
    id: root

    // Formatted string
    readonly property string date: Qt.formatDateTime(clock.date, "dddd d MMM yyyy")
    readonly property string time: Qt.formatDateTime(clock.date, "h:mm:ss")
    readonly property string zone: Qt.formatDateTime(clock.date, "t")
    // Reactive clock source tracking seconds.
    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }
}
