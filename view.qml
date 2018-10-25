import QtQuick 2.9
import QtQuick.Controls 2.2
import QtWebView 1.1

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("My Qml Window")

     WebView {
        id: webView
        anchors.fill: parent
        url: "https://www.youtube.com/"
    }
}
