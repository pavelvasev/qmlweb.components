import QtQuick 2.1
import QtQuick.Controls 1.2

Embed {
  height: 30
  width: 200

  id: self

  property real maximumValue: 1
  property real minimumValue: 0
  property real value: 0
  property bool indeterminate: true

  property bool flag: true

  Component.onCompleted: {
    init();
  }

  function init() {	
  	var html;
  	if (indeterminate) {
  			html = "<progress max='1'>indeterminate</progress>";
  		} else {
			html = "<progress value='"+value+"' max='"
					+maximumValue+"'> "+100*value/maximumValue+"% </progress>";
  		}
	self.dom.innerHTML = html;
  }

  onIndeterminateChanged: {
  	init();
  }

  onMinimumValueChanged: {
  	minimumValue = maximumValue >= minimumValue?minimumValue:maximumValue;
  	value = value >= minimumValue?value:minimumValue;
  }

  onMaximumValueChanged: {
  	maximumValue = (maximumValue >= minimumValue)?maximumValue:minimumValue;
  	
  	if (value <= maximumValue) {
  			init();
  		} else {
  			value = maximumValue;
  		}
  }

  onValueChanged: {
  	value = (value <= maximumValue)?(value >= minimumValue?value:minimumValue):maximumValue;
  	init();
  }
}

