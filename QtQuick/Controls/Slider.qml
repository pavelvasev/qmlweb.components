import QtQuick 2.3
import QtQuick.Controls 1.2

// http://doc.qt.io/qt-5/qml-qtquick-controls-slider.html
Item {
  width: 110
  height: 30

  id: slider

  property real value: 0
  property real maximumValue :1
  property real minimumValue :0
  property real stepSize :0.1
  
  property var updateValueWhileDragging : true
  
  // internal
  property var htmlNode

  onMaximumValueChanged: {
    if (htmlNode)
      htmlNode.max = maximumValue;
  }

  onMinimumValueChanged: {
    if (htmlNode)
      htmlNode.min = minimumValue;
  }  

  Component.onCompleted: {
      if (typeof(value)==="undefined") value = minimumValue;
      
      slider.dom.style.pointerEvents = "auto";
      
      slider.dom.innerHTML = '<input type="range">';
      var r = slider.dom.firstChild;

      r.min = minimumValue;
      r.max = maximumValue;
      r.step = stepSize;
      r.value = value;
      r.style.width = slider.width + "px";

      htmlNode = r;
      
      var changeHandler = function(e) {
        slider.value = parseFloat( e.target.value );
      };

      r.onchange = changeHandler;

      if (updateValueWhileDragging)
        r.oninput = changeHandler;
  } // onCompleted

  onValueChanged: htmlNode.value = slider.value;
 
}
