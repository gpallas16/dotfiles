/*
 *    SPDX-FileCopyrightText: zayronxio
 *    SPDX-License-Identifier: GPL-3.0-or-later
 */
import QtQuick 2.12
import QtQuick.Layouts 1.12
import Qt5Compat.GraphicalEffects
import org.kde.plasma.plasmoid
import org.kde.kirigami as Kirigami

PlasmoidItem {
    id: root

    property color widgetColor: Plasmoid.configuration.customColor
    property color centerColor: Kirigami.Theme.highlightColor
    property var percentageMinutes: new Date().getMinutes()/60
    property var percentageHours: new Date().getHours()/12
    property var percentageSeconds: new Date().getSeconds()/60

    preferredRepresentation: fullRepresentation
    Plasmoid.backgroundHints: "NoBackground"

    FontLoader {
        id: avant
        source: "../fonts/ITC Avant Garde Std Bk.otf"
    }

    Item {
        width: root.width > root.height*4.5 ? root.height*4.5 : root.width
        height: root.width/4.5

        Item {
            id: textClock
            width: cl.implicitWidth + height + ck.implicitWidth
            height: parent.height
            opacity: Plasmoid.configuration.opacity
            Text {
                id: cl
                text: "CL"
                width: parent.width - parent.height - ck.implicitWidth
                height: parent.height
                color: widgetColor
                leftPadding: - parent.height * .05
                topPadding: parent.height * .06
                font.pixelSize: parent.height*1.30
                font.family: avant.name
                verticalAlignment: Text.AlignVCenter
            }
            Text {
                id: ck
                text: "CK"
                width: parent.width - parent.height - cl.implicitWidth
                height: parent.height
                color: widgetColor
                anchors.left: parent.left
                topPadding: parent.height * .06
                anchors.leftMargin: cl.implicitWidth + parent.height + parent.height * .1
                font.pixelSize: parent.height*1.30
                font.family: avant.name
                verticalAlignment: Text.AlignVCenter
            }

        }



        Canvas {
            id: canvas
            width: height
            height: parent.height + 1
            anchors.left: parent.left
            anchors.leftMargin: textClock.width *.36
            onPaint: {
                var ctx = getContext("2d");
                ctx.clearRect(0, 0, width, height); // Limpiar el canvas

                var now = new Date();
                var minutes = now.getMinutes();
                var percentage = minutes / 60;

                // Ajustar el radio del arco para que se ajuste al tamaño del canvas
                var radius = Math.min(width, height) / 2 - 1; // Radio del semicírculo
                var centerX = width / 2;
                var centerY = height / 2;

                // Calcular el ángulo para el semicírculo
                var startAngle = -Math.PI / 2;
                var endAngle = startAngle + percentageMinutes * Math.PI * 2;

                ctx.beginPath();
                ctx.arc(centerX, centerY, radius, startAngle, endAngle, false);
                ctx.lineWidth = 2;
                ctx.strokeStyle = widgetColor;
                ctx.stroke();
            }
        }
        Rectangle {
            id: manecillaMinuto
            width: canvas.height*.55 - height/2
            height: 2
            color: widgetColor
            anchors.left: canvas.left
            anchors.leftMargin: canvas.width/2 - height/2
            anchors.top: canvas.top
            anchors.topMargin: canvas.height / 2 - height/2
            radius: 1  // Suaviza los bordes
            antialiasing: true // Activar antialiasing en el element
            transform: Rotation {
                id: rotacionMinuto
                angle: percentageMinutes*360 + 270
                origin.x: 0
                origin.y: 0

            }
        }
        Rectangle {
            id: manecillahours
            width: (canvas.height*.5) - height/2
            height: 5
            color: widgetColor
            anchors.left: canvas.left
            anchors.leftMargin: canvas.width/2 - height/2
            anchors.top: canvas.top
            anchors.topMargin: canvas.height / 2 - height/2
            radius: 1  // Suaviza los bordes
            antialiasing: true // Activar antialiasing en el element
            transform: Rotation {
                id: rotacionHours
                angle: percentageHours*360 + 270
                origin.x: 0
                origin.y: 0

            }
        }
        Rectangle {
            id: manecillaSeconds
            width: canvas.height*.83 - height/2
            height: 2
            color: centerColor
            anchors.left: canvas.left
            anchors.leftMargin: canvas.width/2 - height/2
            anchors.top: canvas.top
            anchors.topMargin: canvas.height / 2 - height/2
            radius: 1  // Suaviza los bordes
            antialiasing: true // Activar antialiasing en el element
            transform: Rotation {
                id: rotacionSeconds
                angle: percentageSeconds*360 + 270
                origin.x: 0
                origin.y: 0

            }
        }
        Rectangle {
            id: centerManecilla
            width: canvas.height *.1
            height: width
            radius: height/2
            color: centerColor
            anchors.centerIn: canvas
        }
        Timer {
            id: timer
            interval: 1000
            running: true
            repeat: true
            onTriggered: {
                canvas.requestPaint()
                percentageMinutes = new Date().getMinutes()/60
                percentageHours = new Date().getHours()/12
                percentageSeconds = new Date().getSeconds()/60
            }
        }
        onHeightChanged: canvas.requestPaint()
        onWidthChanged: canvas.requestPaint()
    }
}
