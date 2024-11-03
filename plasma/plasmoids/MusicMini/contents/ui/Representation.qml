/*
 *  SPDX-FileCopyrightText: zayronxio
 *  SPDX-License-Identifier: GPL-3.0-or-later
 */
import QtQuick 2.4
import QtQuick.Layouts 1.1
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.private.mpris as Mpris
import Qt5Compat.GraphicalEffects
import org.kde.kirigami as Kirigami
import org.kde.ksvg 1.0 as KSvg
//import QtQuick.Controls 2.15

Item {
    id: main
    property int menuPos: Plasmoid.configuration.displayPosition

    onVisibleChanged: {
        root.visible = !root.visible
    }

    InfoMusic {
        id: infoMusic
    }

    KSvg.FrameSvgItem {
        id : mediaSvg

        visible: false

        imagePath: "icons/media.svg"
    }

    KSvg.FrameSvgItem {
        id : backgroundSvg

        visible: false

        imagePath: "dialogs/background"
    }

    Mpris.Mpris2Model {
        id: mpris2Model
    }

    function next() {
        mpris2Model.currentPlayer.Next()
    }
    function playPause() {
        mpris2Model.currentPlayer.PlayPause()
    }
    function prev() {
        mpris2Model.currentPlayer.Previous()
    }
    Plasmoid.status: root.visible ? PlasmaCore.Types.RequiresAttentionStatus : PlasmaCore.Types.PassiveStatus

    PlasmaCore.Dialog {
        id: root

        objectName: "popupWindow"
        flags: Qt.WindowStaysOnTopHint
        location: PlasmaCore.Types.Floating
        hideOnWindowDeactivate: true

        onVisibleChanged: {
            if (visible) {
                var pos = popupPosition(width, height);
                x = pos.x;
                y = pos.y;
                timer.start(); // Iniciar el temporizador cuando se muestra la ventana
                heightAnimation.start(); // Iniciar la animación cuando se muestra la ventana
            } else {
                timer.stop(); // Detener el temporizador cuando se oculta la ventana
                heightAnimation.stop(); // Detener la animación cuando se oculta la ventana
            }
        }

        onHeightChanged: {
            var pos = popupPosition(width, height);
            x = pos.x;
            y = pos.y;
        }

        onWidthChanged: {
            var pos = popupPosition(width, height);
            x = pos.x;
            y = pos.y;
        }

        function toggle() {
            main.visible = !main.visible;
        }

        function popupPosition(width, height) {
            var screenAvail = wrapper.availableScreenRect;
            var screen = wrapper.screenGeometry;
            var panelH = screen.height - screenAvail.height;
            var panelW = screen.width - screenAvail.width;
            var horizMidPoint = screen.x + (screen.width / 2);
            var vertMidPoint = screen.y + (screen.height / 2);
            var appletTopLeft = parent.mapToGlobal(0, 0);

            function calculatePosition(x, y) {
                return Qt.point(x, y);
            }

            if (menuPos === 0) {
                switch (plasmoid.location) {
                    case PlasmaCore.Types.BottomEdge:
                        var x = appletTopLeft.x < screen.width - width ? appletTopLeft.x : screen.width - width - 8;
                        var y = screen.height - height - panelH - Kirigami.Units.gridUnit / 2;
                        return calculatePosition(x, y);

                    case PlasmaCore.Types.TopEdge:
                        x = appletTopLeft.x < screen.width - width ? appletTopLeft.x + panelW - Kirigami.Units.gridUnit / 3 : screen.width - width;
                        y = panelH + Kirigami.Units.gridUnit / 2;
                        return calculatePosition(x, y);

                    case PlasmaCore.Types.LeftEdge:
                        x = appletTopLeft.x + panelW + Kirigami.Units.gridUnit / 2;
                        y = appletTopLeft.y < screen.height - height ? appletTopLeft.y : appletTopLeft.y - height + iconUser.height / 2;
                        return calculatePosition(x, y);

                    case PlasmaCore.Types.RightEdge:
                        x = appletTopLeft.x - width - Kirigami.Units.gridUnit / 2;
                        y = appletTopLeft.y < screen.height - height ? appletTopLeft.y : screen.height - height - Kirigami.Units.gridUnit / 5;
                        return calculatePosition(x, y);

                    default:
                        return;
                }
            } else if (menuPos === 2) {
                x = horizMidPoint - width / 2;
                y = screen.height - height - panelH - Kirigami.Units.gridUnit / 2;
                return calculatePosition(x, y);
            } else if (menuPos === 1) {
                x = horizMidPoint - width / 2;
                y = vertMidPoint - height / 2;
                return calculatePosition(x, y);
            }
        }

        FocusScope {
            id: rootItem
            Layout.minimumWidth:  230
            Layout.maximumWidth:  minimumWidth
            Layout.minimumHeight: 390
            Layout.maximumHeight: minimumHeight
            focus: true

            Item {
                id: backgroundPlasmoid
                width: parent.width + backgroundSvg.margins.left + backgroundSvg.margins.right
                height: parent.height + backgroundSvg.margins.top + backgroundSvg.margins.bottom
                visible: false
                KSvg.FrameSvgItem {
                    imagePath: "dialogs/background"
                    clip: true
                    width: parent.width
                    height: parent.height
                }
            }
            Rectangle {
                id: gradientPlasmoid
                width: backgroundPlasmoid.width
                height: backgroundPlasmoid.height
                y:  - backgroundSvg.margins.top
                x: - backgroundSvg.margins.left
                opacity: 0.3
                layer.enabled: true
                layer.effect: OpacityMask {
                    maskSource: backgroundPlasmoid
                }
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#00ffffff" }
                    GradientStop { position: 1.0; color: infoMusic.predominantColor }
                }

                // Animación para ajustar la opacidad en función del volumen
                Behavior on opacity {
                    NumberAnimation {
                        duration: 100
                        easing.type: Easing.InOutQuad
                    }
                }

            }
            Item {
                id: cover
                width: 140
                height: width
                anchors.left: parent.left
                anchors.leftMargin: (parent.width - width)/2
                anchors.top: parent.top
                anchors.topMargin: 30
                visible: infoMusic.albumUrl ? true : false
                Rectangle {
                    id: maskAlbum
                    width: 140
                    height: width
                    radius: height/2
                }

                DropShadow {
                    anchors.fill: maskAlbum
                    horizontalOffset: 4
                    verticalOffset: 4
                    radius: 20
                    samples: 17
                    color: "#80000000"
                    source: maskAlbum
                }
                Image {
                    id: coverImage
                    width: 140
                    height: 140
                    source: infoMusic.albumUrl

                    anchors.centerIn: parent
                    onSourceChanged: {
                        if (!source) {
                            source = "./defaultImage.png"; // Imagen por defecto si no hay fuente
                        }
                    }
                    layer.enabled: true
                    layer.effect: OpacityMask {
                        maskSource: maskAlbum
                    }
                }
                Rectangle {
                    id: shadown
                    width: 140
                    height: width
                    radius: height/2
                    color: "transparent"
                    border.width: 1
                    border.color: Kirigami.Theme.textColor
                    opacity: 0.5
                }

            }

            Column {
                id: info
                width: parent.width
                height: trackId.implicitHeight + artistId.implicitHeight
                anchors.top: cover.bottom
                anchors.topMargin: 15
                Text {
                    id: trackId
                    width: parent.width
                    height: parent.height - artistId.implicitHeight
                    text: infoMusic.track
                    color: Kirigami.Theme.textColor
                    font.pixelSize: 14
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                }
                Text {
                    id: artistId
                    width: parent.width
                    height: parent.height - trackId.implicitHeight
                    text: infoMusic.artist
                    horizontalAlignment: Text.AlignHCenter
                    color: Kirigami.Theme.textColor
                    font.pixelSize: 12
                    opacity: 0.8
                }
            }
            SpectrumBars {
                id: bar
                height: 60
                anchors.horizontalCenter: parent.horizontalCenter
                //anchors.left: parent.left
                //anchors.leftMargin: (parent.width - bar.implicitWidth)/2
                anchors.top: info.bottom
                anchors.topMargin: 15
                colorBars: Kirigami.Theme.textColor
            }

            Timer {
                interval: 6000
                running: true
                repeat: true
                onTriggered: {

                    mpris2Model.currentPlayer?.updatePosition()
                }
            }
            Rectangle {
                id: progressBar
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: bar.bottom
                anchors.topMargin: 25
                width: 150
                height: 4
                color: Kirigami.Theme.textColor
                radius: height/2
                opacity: 0.3
            }
            Rectangle {
                id: progressIndicator
                anchors.verticalCenter: progressBar.verticalCenter
                anchors.left: progressBar.left
                width: progressBar.width * (mpris2Model.currentPlayer?.position/mpris2Model.currentPlayer?.length)
                height: progressBar.height
                color: Kirigami.Theme.textColor
                radius: progressBar.radius
                opacity: 1
            }

            Item {
                id: controls
                width: parent.width
                height: 32
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
                Row {
                    width: 116
                    height: 32
                    spacing: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    Kirigami.Icon {
                        id: prevplay
                        width: 22
                        height: width
                        source: "media-skip-backward"
                        roundToIconSize: false
                        anchors.verticalCenter: parent.verticalCenter
                        color: Kirigami.Theme.textColor
                        MouseArea {
                            anchors.fill: parent
                            onClicked: prev()
                        }
                    }
                    Kirigami.Icon {
                        id: iconplay
                        width: 32
                        height: width
                        source: infoMusic.isPlaying ? "media-playback-pause" : "media-playback-start"
                        roundToIconSize: false
                        anchors.verticalCenter: parent.verticalCenter
                        color: Kirigami.Theme.textColor
                        MouseArea {
                            anchors.fill: parent
                            onClicked: playPause()
                        }
                    }
                    Kirigami.Icon {
                        id: nextplay
                        width: 22
                        height: width
                        source: "media-skip-forward"
                        roundToIconSize: false
                        anchors.verticalCenter: parent.verticalCenter
                        color: Kirigami.Theme.textColor
                        MouseArea {
                            anchors.fill: parent
                            onClicked:  next()
                        }
                    }
                }
            }
        }
    }
}
