import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("My Qml Window")


    ColorDialog {
        id: colorDialog
        modality: Qt.WindowModal
        title: "Choose a color"
        color: "green"
        onAccepted: { console.log("Accepted: " + color) }
        onRejected: { console.log("Rejected!") }
    }

    FontDialog {
        id: fontDialog
        modality: Qt.WindowModal
        title: "Choose a font"
        onAccepted: { console.log("Accepted: " + color) }
        onRejected: { console.log("Rejected!") }
    }

    Row {
        Button {
            id: btnColor
            text: "Color"
            onClicked: {
                colorDialog.open()
            }
        }

        Button {
            id: btnFont
            text: "Font"
            onClicked: {
                fontDialog.open()
            }
        }

        TextField {
            id: txtText
            text: "Enter some text"
            width: 300
        }
    }


    Text {
        id: preview
        anchors.centerIn: parent
        font: fontDialog.font
        color: colorDialog.color
        text: txtText.text
    }




}
