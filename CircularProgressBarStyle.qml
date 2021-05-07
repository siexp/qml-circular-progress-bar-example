import QtQuick 2.15
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.15

// https://doc.qt.io/qt-5/qtquick-controls-qmlmodule.html
// Warning: The Qt Quick Controls 1 module is deprecated since Qt 5.12. Use the latest Qt Quick Controls module instead.
ProgressBarStyle
{
   panel : Rectangle
   {
      color: "transparent"
      implicitWidth: 80
      implicitHeight: implicitWidth

      Rectangle
      {
         id: outerRing
         anchors.fill: parent
         radius: Math.max(width, height) / 2
         color: "transparent"
         border {
             color: "black"
             width: 8
         }
      }

      Rectangle
      {
         id: innerRing
         anchors {
            fill: parent
            margins: (outerRing.border.width - border.width) / 2
         }
         radius: outerRing.radius
         color: "transparent"
         border {
             color: "black"
             width: 4
         }

         ConicalGradient
         {
            source: innerRing
            anchors.fill: parent
            gradient: Gradient
            {
               GradientStop { position: 0.00; color: "green" }
               GradientStop { position: control.value; color: "green" }
               GradientStop { position: control.value + 0.01; color: "transparent" }
               GradientStop { position: 1.00; color: "transparent" }
            }
         }
      }
   }
}