/*
SPDX-FileCopyrightText: zayronxio
SPDX-License-Identifier: GPL-3.0-or-later
*/
import QtQuick 2.12
import QtQuick.Layouts 1.15
import org.kde.plasma.plasmoid
import org.kde.plasma.core as PlasmaCore
import org.kde.kirigami as Kirigami

PlasmoidItem {
    id: root

    preferredRepresentation: fullRepresentation
    Plasmoid.backgroundHints: PlasmaCore.Types.ConfigurableBackground

    property string dayfulltext: Qt.formatDateTime(new Date(), "dddd")
    property string dayfullNum: Qt.formatDateTime(new Date(), "dd")
    property string mesfulltext: Qt.formatDateTime(new Date(), "MMMM")
    property bool desingone: Plasmoid.configuration.desingone

    FontLoader {
    id: notosansBold
    source: "../fonts/NotoSans-Bold.ttf"
    }

    FontLoader {
    id: notosans
    source: "../fonts/NotoSans-Regular.ttf"
    }

    fullRepresentation: ColumnLayout {
        id: base
        Layout.minimumWidth: 300
        Layout.minimumHeight: textDay.implicitWidth
        Layout.preferredWidth: Layout.minimumWidth
        Layout.preferredHeight: Layout.minimumHeight
        Grid {
            columns: 3
            width: base.width
            height: textDay.implicitWidth
            Item {
                width: base.width/3
                height: dayinNum.implicitHeight
                Text {
                    id: dayinNum
                    width: parent.width
                    height: parent.height
                    color: "white"
                    font.pixelSize: base.width*.3
                    text: dayfullNum
                }
            }
            Item {
                id: contentDay
                width: textDay.implicitHeight
                height: textDay.implicitWidth
                Text {
                    id: textDay
                    text: dayfulltext
                    width: parent.width
                    font.pixelSize: base.width*.15
                    color: "white"
                    rotation: 90
                    verticalAlignment: Text.AlignVCenter
                }
            }
            Item {
                width: base.width/3
                height: contentDay.height
                Row {
                    id: contentMont
                    width: firstCaracter.implicitWidth*3
                    height: firstCaracter.implicitHeight
                    anchors.bottom: parent.bottom
                    Text {
                        id: firstCaracter
                        text: mesfulltext[0]
                        font.pixelSize: textDay.height*.6
                        color: "white"
                    }
                    Text {
                        text: mesfulltext[1]
                        font.pixelSize: firstCaracter.font.pixelSize
                        color: "white"
                    }
                    Text {
                        text: mesfulltext[2]
                        font.pixelSize: firstCaracter.font.pixelSize
                        color: "white"
                    }
                }
            }
        }
    }
    Timer {
        id: timer
        interval: 8.64e+7-((new Date().getHours()*60*60*1000)+(new Date().getMinutes()*60*1000)+(new Date().getSeconds()*1000)+new Date().getMilliseconds())
        running: true
        repeat: true
        onTriggered: {
            dayfulltext = Qt.formatDateTime(new Date(), "dddd")
            dayfullNum = Qt.formatDateTime(new Date(), "dd")
            mesfulltext = Qt.formatDateTime(new Date(), "MMMM")
            timer.interval = 8.64e+7-((new Date().getHours()*60*60*1000)+(new Date().getMinutes()*60*1000)+(new Date().getSeconds()*1000)+new Date().getMilliseconds())
        }
    }
}
