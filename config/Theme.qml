pragma Singleton
import QtQuick
import Quickshell

Singleton {
    property string grey000:   "#030910"
    property string grey00:    "#14161a"
    property string grey0:     "#2e3440"
    property string grey1:     "#3b4252"
    property string grey2:     "#434c5e"
    property string grey3:     "#4c566a"
    property string white1:    "#d8dee9"
    property string white2:    "#e5e9f0"
    property string white3:    "#eceff4"
    property string blue1:     "#8fbcbb"
    property string blue2:     "#88c0d0"
    property string blue3:     "#81a1c1"
    property string blue4:     "#5e81ac"
    property string red:       "#bf616a"
    property string orange:    "#d08770"
    property string yellow:    "#ebcb8b"
    property string green:     "#a3be8c"
    property string purple:    "#b48ead"

    property font font: ({
                family: "Iosevka Nerd Font Propo",
                pointSize: 16,
                weight: Font.Medium
            })
}