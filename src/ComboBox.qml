//import QtQuick 2.3
//import QtQuick.Controls 1.2

Item {
  height: 30
  // compute with based on content
  // but we have to used not currentText, but some average or max options text len
  //width: currentText ? currentText.length * 20 : 100
  width: 80

  id: self

  property var model: ['value1','value2','value3', 'value4']

  property int    currentIndex: 0
  property string currentText:  model[currentIndex]
  property int    count: 0 //model.length

  Component.onCompleted: {
    init();
  }

  function handleSelectItem(e){
    var index = parseInt(e.target?e.target.value:currentIndex);
    currentIndex = index;
  }

  function init() {
    self.dom.style.pointerEvents = "auto";

    count = model.length;
    currentIndex = (currentIndex >= count) ? count-1 : currentIndex;

    var str = '';
    var k = count;
    for(var i = 0; i < k; i++) {
      str += '<option value="'+i+'" '+(i==currentIndex?'selected':'')+'> '+model[i]+'</option>';
    }
    self.dom.innerHTML = '<select>'+str+'</select>';

    var item = self.dom.firstChild;
    item.style.width = width + 'px';

    item.addEventListener('change', handleSelectItem, false);
  }

  onCurrentIndexChanged: {
    var item = self.dom.firstChild;
    //debugger;
    if (item && currentIndex <= count) {
        //currentText = model[currentIndex]
        //debugger;
        if (item.children[currentIndex])
          item.children[currentIndex].selected = true;
      }
  }

  onModelChanged: {
    init();
  }
}

