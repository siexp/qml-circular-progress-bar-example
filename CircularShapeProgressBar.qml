import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15

ProgressBar {
    id: control

    background: Rectangle {
        radius: control.width / 2
        color: "black"
    }

    contentItem: Shape {
        anchors.fill: parent

        // multisample, decide based on your scene settings
        layer {
            enabled: true
            samples: 8
        }

        ShapePath {
            id: progress
            fillColor: "transparent"
            strokeColor: "green"
            strokeWidth: 20
            // https://doc.qt.io/qt-5/qml-qtquick-shapes-shapepath.html#capStyle-prop
            capStyle: ShapePath.RoundCap

            PathAngleArc {
                centerX: control.width / 2
                centerY: control.height / 2
                radiusX: (control.width - progress.strokeWidth) / 2
                radiusY: (control.height - progress.strokeWidth) / 2

                startAngle: -90
                sweepAngle: 360 * control.value
            }
        }
    }
}