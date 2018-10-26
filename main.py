#!/usr/bin/python3.6
import os
import sys

from PySide2.QtCore import Property, QUrl
from PySide2.QtQuick import QQuickItem
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine, qmlRegisterType

# from PySide2.QtWebEngine import QtWebEngine


BASE_DIR = os.path.dirname(os.path.abspath(__file__))


class BackEnd(QQuickItem):

    def __init__(self, parent=None):
        QQuickItem.__init__(self, parent)
        self._name = "john"

    def getName(self):
        return self._name

    def setName(self, value):
        self._name = value

    name = Property(str, getName, setName)


def main():
    app = QGuiApplication(sys.argv)

    # QtWebEngine.initialize()

    qmlRegisterType(BackEnd, 'io.qml.locals', 1, 0, 'BackEnd')

    engine = QQmlApplicationEngine()

    context = engine.rootContext()

    myVar = {
        "A": 18,
        "B": {
            "C": 74
        }
    }

    context.setContextProperty("myVar", myVar)

    qml_file = os.path.join(BASE_DIR, 'view.qml')
    engine.load(QUrl.fromLocalFile(qml_file))

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())


if __name__ == '__main__':
    main()
