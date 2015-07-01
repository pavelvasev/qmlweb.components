http://doc.qt.io/qt-5/qml-qtqml-binding.html

Item {
  property string property
  property var    target 
  property var    value 
  property bool   when: true

  onValueChanged: transfer_value()
  onTargetChanged: transfer_value()
  onPropertyChanged: transfer_value()

  function transfer_value() {
    if (!when) return;
    if (!target || !property) return;
    target[property] = value;
  }
}