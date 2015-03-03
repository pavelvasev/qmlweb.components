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
          spacing:5
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
