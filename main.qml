import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    ListModel {
        id: myModel

        ListElement {name: "Pranav"; colorFont: "red"; phone: "12345"}
        ListElement {name: "Shashank"; colorFont: "blue"; phone: "56789"}
        ListElement {name: "Rachit"; colorFont: "yellow"; phone: "14567"}
        ListElement {name: "Suhas"; colorFont: "green"; phone: "32456"}
        ListElement {name: "Ranga"; colorFont: "grey"; phone: "97654"}

        Component.onCompleted: {
            console.log("Object model created ...")
        }
    }

    Component {
        id: comp
        Rectangle {
            width: 100
            height: 10
            color: "red"

            Component.onCompleted: {
                console.log("Objects created : ", index)
            }

            Component.onDestruction: {
                console.log("Objects Destroyed : ", index)
            }
        }
    }

    Component {
        id: comp1
        Text {
            id: txt1
            width: 100
            height: 10
            color: colorFont
            text: name+"_"+index

            Component.onCompleted: {
                console.log("Objects created : ", index)
            }

            Component.onDestruction: {
                console.log("Objects Destroyed : ", index)
            }

            Text {
                id: txt2
                text: phone
                color: colorFont
                anchors.left: txt1.right
            }
        }
    }

    ListView {
        anchors.fill: parent
        spacing: 10
        model: myModel

        delegate: comp1
    }
}
