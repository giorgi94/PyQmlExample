#!/usr/bin/python3.6
import os
import sys
from OpenGL import GL
from PySide2.QtCore import QUrl
from PySide2.QtQuick import QQuickView
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
# from PySide2.QtWebEngine import QtWebEngine


BASE_DIR = os.path.dirname(os.path.abspath(__file__))


def main():
    app = QGuiApplication(sys.argv)

    # QtWebEngine.initialize()

    engine = QQmlApplicationEngine()

    # context = engine.rootContext()
    # context.setContextProperty("con", bridge)

    qml_file = os.path.join(BASE_DIR, 'view.qml')
    engine.load(QUrl.fromLocalFile(qml_file))

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())


if __name__ == '__main__':
    main()
