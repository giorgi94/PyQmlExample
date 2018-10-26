import QtQuick 2.9
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.0
import io.qml.locals 1.0

import QtMultimedia 5.8

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("My Qml Window")

    property var file_location: ""

    BackEnd {
        id: backend
    }

    ToolBar {
        id: toolBar
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

            if(addressField.selectionEnd != 0) {
                addressField.remove(0, addressField.selectionEnd)
            }

            file_location = fileDialog.fileUrls

            addressField.insert(0, file_location)



            console.log("location: ", file_location)
        }
        onRejected: {
            console.log("Canceled")
        }
    }



    Rectangle {
        y: toolBar.height + 10
        width: parent.width
        height: 200
        border.width: 1

        Video {
            id: video

            anchors.fill: parent

            source: "file:///home/gio/Videos/video.mp4"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    video.play()
                }
            }

            focus: true
            Keys.onSpacePressed: video.playbackState == MediaPlayer.PlayingState ? video.pause() : video.play()
            Keys.onLeftPressed: video.seek(video.position - 5000)
            Keys.onRightPressed: video.seek(video.position + 5000)
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
