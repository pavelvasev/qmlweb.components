import QtQuick 2.3
import QtQuick.Controls 1.2

Item {
  height: 30
  width: 200

  id: self

  property var model: ['value1','value2','value3', 'value4']

  // internal
  property var htmlNode
  property int currentIndex: 0
  property string currentText: model[currentIndex]
  property int count: model.length

  Component.onCompleted: {
    init();
  }

  function handleFileSelect(e){
    var index = parseInt(e.target?e.target.value:currentIndex);
    currentIndex = index;
    currentText = e.target[index].innerText;
  }

  function init() {
    self.dom.style.pointerEvents = "auto";
    count = model.length;
    currentIndex = (currentIndex >= count)?0:currentIndex;
    currentText = model[currentIndex];


    var str = '';
    for(var i = 0; i < count; i++) {
      str += '<option value="'+i+'" '+(i==currentIndex?'selected':'')+'> '+model[i]+'</option>';
    }
    self.dom.innerHTML = '<select>'+str+'</select>';

    var item = self.dom.firstChild;
    item.style.width = width + 'px';

    item.addEventListener('change', handleFileSelect, false);
  }

  onCurrentIndexChanged: {
    var item = self.dom.firstChild;
    if (currentIndex <= count) {
        currentText = model[currentIndex]
        item.children[currentIndex].selected = true;
      }
  }

  onModelChanged: {
    init();
  }
}

