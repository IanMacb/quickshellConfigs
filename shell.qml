//@ pragma IconTheme Papirus
//@ pragma UseQApplication

import Quickshell
import QtQuick
import qs.modules

// import qs.services

/** Main shell entry point; manages surface orchestration. */
ShellRoot {
    id: root

    TopBar {
        id: topBar
    }
}
