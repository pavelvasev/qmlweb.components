import "../.."

Rectangle {

  color: "lightgrey"
  
  property var sources: ["MainTest.qml","GroupboxesTest.qml","DialogTest.qml","LoaderTest.qml","TabviewsTest.qml","BindingTest.qml","test_qmlweb_1.qml","test_qmlweb_2.qml"]
  
  TabView {
    id: tabs
    anchors.fill: parent
    anchors.margins: 10

    Repeater {
      model: sources.length
      Tab {
        title: source
        source: sources[index]
      }
    }

  }

  ParamUrlHashing {
    target: tabs
    property: "currentIndex"
    name: "tabindex"
    timeout: 100
  }
}