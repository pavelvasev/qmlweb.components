import QtQuick 2.1
import QtQuick.Controls 1.2

Item {
    width: 500
    height: 600

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
            title: "ProgressBar test"

            Column {
                spacing: 5
                Row {
                    ProgressBar {
                        id: progress
                        maximumValue: 2
                        indeterminate: true
                        value: 1.6
                    }

                    Text {
                        text: "value="+progress.value +
                              ", indeterminate=" + progress.indeterminate +
                              ", percent=" + 100*progress.value/progress.maximumValue + "%"
                    }
                }
                Row {
                    spacing: 5
                    Button {
                        id: btn5
                        width: 160
                        text: "set 0.9 and determinate"
                        onClicked: progress.value = 0.9, progress.indeterminate = false
                    }

                    Button {
                        id: btn7
                        width: 160
                        text: "maximumValue"
                        onClicked: progress.maximumValue = 1
                    }
                }
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
                        model: ['item1','item2','item3', 'item4', 'item5', 'item6', 'item7']
                        currentIndex: 0
                    }

                    Text {
                        text: "currentIndex="+select.currentIndex + ' currentText=' + select.currentText
                    }
                }

                Button {
                    id: btn3
                    text: "newModel"
                    onClicked: select.model = ['option1', 'option2', 'option3', 'option4']
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
