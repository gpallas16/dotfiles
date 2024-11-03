/*
 *  SPDX-FileCopyrightText: zayronxio
 *  SPDX-License-Identifier: GPL-3.0-or-later
 */
import QtQuick 2.15
import org.kde.plasma.private.volume


Item {
    width: bar.implicitWidth
    height: 45
    property var sink: PreferredDevice.sink
    property color colorBars: "white"
    property bool active: true
    property int numberBar: 9

    VolumeMonitor {
        id: volumeMonitor
        target: sink
    }
    onActiveChanged: {
        bar.visible = active
    }
    Row {
        id: bar
        height: parent.height
        spacing: bar.widths * .6
        width: parent.width
        visible: active
        anchors.centerIn: parent
        anchors.left: parent.left
        anchors.leftMargin: (parent.width)/2
        //anchors.top: parent.top
        //anchors.topMargin: height/3
        property int widths: parent.height > 32 ? parent.height*.1 : parent.height*.14
        property var heights: [height * 0.17, height * 0.33, height * 0.36, height * 0.62, height, height * 0.62, height * 0.36, height * 0.33, height * 0.17]

        property var heights5: [height * 0.33, height * 0.50, height, height * 0.50, height * 0.33]

        function generateRectangles() {
            if (numberBar === 9) {
                for (let i = 0; i < heights.length; i++) {
                    createRectangle(i, heights[i]);
                }
            } else {
                for (let i = 0; i < heights5.length; i++) {
                    createRectangle(i, heights5[i]);
                }
            }

        }

        onHeightChanged: {
            bar.heights = [height * 0.17, height * 0.33, height * 0.36, height * 0.62, height, height * 0.62, height * 0.36, height * 0.33, height * 0.17]
            bar.heights5 = [height * 0.33, height * 0.50, height, height * 0.50, height * 0.33]
        }

        Component.onCompleted: {
            generateRectangles();
        }

        function createRectangle(index, initialHeight) {
            var rect = Qt.createQmlObject('import QtQuick 2.15; Rectangle { \
            id: rect' + index + '; \
            width: bar.widths; \
            radius: width/2; \
            anchors.verticalCenter: parent.verticalCenter; \
            color: colorBars; \
            height: width; \
            property real oneHeight: ' + initialHeight + '; \
            SequentialAnimation { \
            id: heightAnimation' + index + '; \
            running: true; \
            loops: Animation.Infinite; \
            PropertyAnimation { \
            target: parent; \
            property: "height"; \
            to: initialHeight; \
            duration: 100; \
            easing.type: Easing.InOutQuad; \
        } \
        } \
        Timer { \
        id: timer' + index + '; \
        interval: 100; \
        running: true; \
        repeat: true; \
        onTriggered: { \
        parent.oneHeight = Math.random() * (volumeMonitor.volume * 30) + (' + initialHeight + ') * volumeMonitor.volume + 8; \
        parent.height = parent.oneHeight; \
        } \
        } \
        }', bar);
            rect.anchors.verticalCenter = parent.verticalCenter;
            rect.anchors.horizontalCenterOffset = (index - (heights.length - 1) / 2) * 10;
        }
    }

}
