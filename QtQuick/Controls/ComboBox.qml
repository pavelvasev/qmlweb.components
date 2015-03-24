import QtQuick 2.3
import QtQuick.Controls 1.2

Item {
  height: 30
  width: 200

  id: self

  property var model: ['value1','value2','value3', 'value4']

  property int    currentIndex: 0
  property string currentText:  model[currentIndex]
  property int    count:        model.length

  Component.onCompleted: {
    init();
  }

  function handleSelectItem(e){
    currentIndex = parseInt(e.target?e.target.value:currentIndex);
  }

  function init() {
    var count = model.length;
    self.dom.style.pointerEvents = "auto";
    currentIndex = (currentIndex >= model.length)?0:currentIndex;

    var str = '';
    for(var i = 0; i < count; i++) {
      str += '<option value="'+i+'" '+(i==currentIndex?'selected':'')+'> '+model[i]+'</option>';
    }
    self.dom.innerHTML = '<select>'+str+'</select>';

    var item = self.dom.firstChild;
    item.style.width = width + 'px';

    item.addEventListener('change', handleSelectItem, false);
  }

  onCurrentIndexChanged: {
    var item = self.dom.firstChild;
    if (currentIndex <= count) {
        item.children[currentIndex].selected = true;
      } else {
        currentIndex = 0
      }
  }

  onModelChanged: {
    init();
  }
}

