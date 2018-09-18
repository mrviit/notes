import QtQuick 2.4
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3

Window {
    id: menuScreen
    visible: true
    visibility: Window.FullScreen
//    modality: Qt.ApplicationModal
    color: "green"
//    flags: Qt.WindowStaysOnTopHint
//    flags: Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint //Qt.Tool

    ColumnLayout {
        spacing: 20
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.margins: 33
        width: .3 * parent.width

        StartupButton {
            text: "Exit"
            onClicked: {
//                root.raise();
                root.requestActivate()
//                root.showFullScreen()
//                root.opacity = 1;
//                root.active()
//                root.flags(Qt.WindowStaysOnTopHint)

//                menuScreen.opacity = 0;
                menuScreen.hide()
            }
        }
    }
}
