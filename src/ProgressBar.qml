//import QtQuick 2.3
//import QtQuick.Controls 1.2

//http://doc.qt.io/qt-5/qml-qtquick-controls-progressbar.html
//https://developer.mozilla.org/ru/docs/Web/HTML/Element/progress
Item {
  width: 80
  height: 15

  id: progress

  property real value: 0
  property real maximumValue :1
  property real minimumValue :0
  property bool indeterminate: false
  
  // internal
  property var htmlTagName: "progress"
  
  onValueChanged: {
    if (!indeterminate)
      progress.dom.value = value;
    else
      progress.dom.value = undefined;
  }     
  
  onIndeterminateChanged: {
    if (!indeterminate)
      progress.dom.value = value;
    else
      progress.dom.value = undefined;
  }     
      
  
  onMaximumValueChanged: {
    progress.dom.max = maximumValue;
  }

}
