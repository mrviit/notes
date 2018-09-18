import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3

Window {
    id: root
    visible: true
    visibility: Window.FullScreen
    color: "red"
//    flags: Qt.WindowStaysOnTopHint


    ColumnLayout {
        spacing: 20
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.margins: 33
        width: .3 * parent.width

        StartupButton {
            text: "Start"

            property var component : Qt.createComponent("qrc:/MenuScreen.qml");
            property var window /*: component.createObject(root)*/;
            Loader { id: pageLoader }
            onClicked: {
                if(!window) window = component.createObject(root)
//                var component = Qt.createComponent("qrc:/MenuScreen.qml")
//                console.log("Component Status:", component.status, component.errorString())
//                var window = component.createObject(root)
//                window.raise();
                window.requestActivate()
                window.showFullScreen()
//                window.opacity = 1;
//                window.active()
//                window.setVisible(true)
//                window.


//                root.opacity = 0;
//                root.hide()
//                root.lower()
//                root.show()
//                root.setVisible(false)
//                root.activeFocusItem
//                root.
            }
        }
        StartupButton {
            text: "Load"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    pageLoader.source = "MenuScreen.qml"
                    pageLoader.active = true;
                }
            }
        }
        StartupButton {
            text: "Grey"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    pageLoader.sourceComponent = greySquare
                }
            }
        }
    }

    Component {
        id: greySquare
        Window {
            color: "grey"
//            anchors.fill: parent
            visible: true
            visibility: Window.FullScreen
            ColumnLayout {
                spacing: 20
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.margins: 33
                width: .3 * parent.width

                StartupButton {
                    text: "Exit"
                    onClicked: {
                        root.requestActivate()
//                        greySquare.hide()
                    }
                }
            }
        }
    }
}
