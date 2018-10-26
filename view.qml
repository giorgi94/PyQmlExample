import QtQuick 2.9
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.0
import io.qml.locals 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("My Qml Window")

    BackEnd {
        id: backend
    }

    ToolBar {
        RowLayout {
            anchors.fill: parent
            ToolButton {
                text: qsTr("Open")
                onClicked: {
                    console.log(myVar.B.C, backend.name)
                }
            }
            ToolButton {
                text: qsTr("Save")
                onClicked: {
                    backend.name = "Alex"
                }
            }
        }
    }

    FileDialog {
        id: fileDialog
        title: "Please choose a file"
        onAccepted: {
            addressField.insert(0, fileDialog.fileUrls)
        }
        onRejected: {
            console.log("Canceled")
        }
    }


    Rectangle {
        id: box
        x: 10
        height: 40
        width: parent.width - 2*this.x
        border.width: 1
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10

        RowLayout {
            spacing: 2

            height: parent.height - 10
            width: parent.width - 10

            anchors.centerIn: parent

            TextField {
                id: addressField
                Layout.fillHeight: true
                Layout.alignment: Qt.AlignLeft
                Layout.fillWidth: true
            }

            Button {
                id: openBtn
                text: "Open Source"
                Layout.fillHeight: true
                Layout.alignment: Qt.AlignRight
                onClicked: {
                    fileDialog.open()
                }
            }
        }
    }


}
