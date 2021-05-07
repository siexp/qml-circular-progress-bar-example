import QtQuick 2.15
import QtQuick.Controls 2.15

ProgressBar {
    id: control

    background: Rectangle {
        radius: control.width / 2
        color: "black"
    }

    onValueChanged: canvas.requestPaint()

    // draws two arcs (portion of a circle)
    // fills the circle with a lighter secondary color
    // when pressed
    contentItem: Canvas {
        id: canvas
        antialiasing: true

        property int strokeWidth: 10

        onPaint: {
            var ctx = getContext("2d");
            ctx.save();

            ctx.clearRect(0, 0, canvas.width, canvas.height);

            // First, thinner arc
            // From angle to 2*PI

            ctx.beginPath();
            ctx.lineWidth = strokeWidth;
            ctx.strokeStyle = "green";
            ctx.arc(control.width / 2,
                    control.height / 2,
                    Math.min(canvas.width - strokeWidth, canvas.height - strokeWidth) / 2,
                    -Math.PI / 2,
                    control.value * 2 * Math.PI - Math.PI / 2);
            ctx.stroke();
            ctx.restore();
        }
    }
}