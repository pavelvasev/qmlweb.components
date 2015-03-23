import QtQuick 2.1
import QtQuick.Controls 1.2

Item {
    width: 500
    height: 500

    Column {
        x:5
        y:5
        width: 200
        spacing:5

        FileSelect {
          id: fs
          onFileChanged: console.log("selected file=",file.name);
        }

        Row {
          spacing:5
          ComboBox {
            id: select
            model: ['bla','bla2','bla3', 'bla4', 'bla5', 'bla6', 'bla7']
            currentIndex: 0
            }

          Text {
            text: "selected ="+select.currentIndex + ' ' + select.currentText
          }
        }
        
        Button {
            id: btn3
            text: "newModel"
            onClicked: select.model = ['olo','olo2','olo3', 'olo5']
        }

        Button {
            id: btn4
            text: "change currentIndex"
            onClicked: select.currentIndex = 3
        }

        Button {
            id: btn
            text: "some text"
            onClicked: btn.text = "12345"
        }

        Button {
            id: btn2
            text: "some text 2"
            onClicked: btn2.text = "12345!"
        }

        CheckBox {
            text: "Click me.."
            width: 200
            onCheckedChanged: text = "thank you! checked="+checked;
        }
        
        Row {
          spacing:10
          Slider {
            id: sla
            value: 0.3
          }
          Text {
            text: "value ="+sla.value
          }
        }

    }
}
