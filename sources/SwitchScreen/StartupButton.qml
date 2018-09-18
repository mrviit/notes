import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Button {
    padding: 10
    anchors.margins: 55
    Layout.fillWidth: true
    font.pointSize: 30
    font.family: "Times New Roman"
    Layout.preferredHeight: 70
    opacity: .4
    palette {
        button: "black"
        buttonText: "white"
    }
    onHoveredChanged: this.palette.button = hovered ? "white" : "black"
}
