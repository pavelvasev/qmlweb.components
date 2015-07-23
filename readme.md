# QmlWeb Components

Subset of [QtQuick.Controls](http://doc.qt.io/qt-5/qtquickcontrols-index.html) and other useful things.

## Online demo

http://pavelvasev.github.io/qmlweb.run/?s=https%3A%2F%2Fgithub.com%2Fpavelvasev%2Fqmlweb.components%2Fblob%2Fmaster%2Fsrc%2Ftest%2FIndex.qml

## Demo and testing

I. Download qmlweb from special fork [https://github.com/pavelvasev/qmlweb](https://github.com/pavelvasev/qmlweb)
and put to sibling directory, e.g:
* qmlweb
* qmlweb.components

You need those special fork because it has addImportPath method and other enhancements.

II. Open [src/test/scene.html](src/test/scene.html)

## Adding new controls

1. Go to directory `src` and add some control. 
2. Create a test case of that control in src/test/Index.qml.

When choosing what to create at step 1, please note that QmlWeb [already has some](qmlweb_have.md) built-in implementations of some controls


