import QtQuick 2.1
import QtQuick.Controls 1.2

Item {
    width: 500
    height: 500

    Column {
        x:5
        y:5
        width: parent.width
        spacing: 5

        GroupBox { 
          title: "RadioButton test"

          Row {
            RadioButton {
              text: "First choice"
            }
            RadioButton {
              text: "The long Second choice"
            }
            RadioButton {
              text: "Third choice"
            }            
          }
        }

        GroupBox {
            title: "GroupBox test"
            width: parent.width
            id: gbox

            Column {
                spacing:3

                Button {
                    width: 200
                    text: "Click to change groupbox title"
                    onClicked: gbox.title = gbox.title + " 1";
                }

                Text {
                    text: "Some text. We check how GroupBox uses column height."
                }
            }//column

        }


        GroupBox {
            title: "FileSelect test"

            FileSelect {
                id: fs
                onFileChanged: console.log("selected file=",file.name);
            }
        }


        GroupBox {
            title: "ComboBox test"

            Column {
                spacing: 5

                Row {
                    spacing:5
                    ComboBox {
                        id: select
                        model: ['bla','bla2','bla3', 'bla4', 'bla5', 'bla6', 'bla7']
                        currentIndex: 0
                    }

                    Text {
                        text: "currentIndex="+select.currentIndex + ' currentText=' + select.currentText
                    }
                }

                Button {
                    id: btn3
                    text: "newModel"
                    onClicked: select.model = ['olo','olo2','olo3', 'olo5']
                }

                Button {
                    id: btn4
                    text: "change currentIndex to 3"
                    width: 150
                    onClicked: select.currentIndex = 3
                }

            } // column

        } // groupbox for combo test

        GroupBox {
            title: "Buttons test"
            Row {
                spacing: 3

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
            } // row
        } // groupbox buttontest


        GroupBox {
            title: "Checkbox test"
            /*
            Rectangle {
                width: 120
                height: 30
                color: "red"
            }*/
            CheckBox {
                text: "Click me.."
                width: 200
                onCheckedChanged: text = "thank you! checked="+checked;
            }
        }

        GroupBox {
            title: "Slider test"

            Row {
                spacing:10
                Slider {
                    id: sla
                    value: 0.3
                }
                Text {
                    text: "value ="+sla.value
                }
            } // row for slider
    } // groupbox


}
}
