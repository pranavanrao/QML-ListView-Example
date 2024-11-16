import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    ListModel {
        id: myModel

        ListElement {name: "Pranav"; phone: "12345"}
        ListElement {name: "Shashank"; phone: "56789"}
        ListElement {name: "Rachit"; phone: "14567"}
        ListElement {name: "Suhas"; phone: "32456"}
        ListElement {name: "Ranga"; phone: "97654"}

        Component.onCompleted: {
            console.log("Object model created ...")
        }
    }

    ListView {
        anchors.fill: parent
        spacing: 10
        model: myModel

        delegate: c1
    }

    Component {
        id: c1
        Rectangle {
            width: 200
            height: 60
            color: "blue"

            Row {
                spacing: 10

                anchors.verticalCenter: parent.verticalCenter

                Text {
                    id: txt1
                    width: 100
                    height: 10
                    text: name+"_"+index
                }

                Text {
                    id: txt2
                    text: phone
                }
            }

            Component.onCompleted: {
                console.log("Objects created : ", index)
            }

            Component.onDestruction: {
                console.log("Objects Destroyed : ", index)
            }
        }
    }
}
