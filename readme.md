# QmlWeb Components

Subset of [QtQuick.Controls](http://doc.qt.io/qt-5/qtquickcontrols-index.html) and other stuff.

## Demo and testing

I. Download qmlweb from special fork [https://github.com/pavelvasev/qmlweb](https://github.com/pavelvasev/qmlweb)
and put to sibling directory, e.g:
* qmlweb
* qmlweb.components

You need those special fork because it has addImportPath method.

II. Open [test/viewer.html](test/viewer.html)

## Adding new controls

1. Go to directory QtQuick/Controls and add some control. 
2. Create a test call of that control in test/test.qml.

When choosing what to create at step 1, please note that QmlWeb [already has some](qmlweb_have.md) built-in implementations of some controls


