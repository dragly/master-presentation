import QtQuick 2.0
Item {
    property alias source: image.source
    property real borderWidth: 2
    ShaderEffectSource {
        anchors.fill: parent
        hideSource: true
        sourceItem: item
    }
    Item {
        id: item
        anchors.fill: parent
        Rectangle {
            x: image.x + (image.width - image.paintedWidth) / 2 - borderWidth
            y: image.y + (image.height - image.paintedHeight) / 2 - borderWidth
            width: image.paintedWidth + borderWidth*2
            height: image.paintedHeight + borderWidth*2

            color: "#636363"
            z: -1
        }
        Image {
            id: image
            anchors {
                fill: parent
                margins: 12
            }
            fillMode: Image.PreserveAspectFit
        }
    }
}


