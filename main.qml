import QtQuick 2.2
import QtQuick.Controls 1.1
import Qt.labs.folderlistmodel 2.1
import QFileWriter 1.0

ApplicationWindow {
    visible: true
    width: 320
    height: 480
    title: qsTr("Hello World")
    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
    }

    QFileWriter{
        id: fileWriter
        content: ""
    }

    FolderListModel {
        id: folderModel
        nameFilters: ["*.jpg"]
        folder: "images/"
    }

    Item{
        id:fileHelper
        property int position: 0
        function nextFile(){
            fileHelper.position++
            principalImage.source = folderModel.get(fileHelper.position, "fileURL")
            if(fileHelper.position >= folderModel.count - 1)
            {
                fileWriter.writeFile()
            }
        }
    }

    Image {
        id: principalImage
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width * 0.70
        height: parent.height * 0.80
        source: "images/ColorTest1.png"
    }

    Rectangle {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: parent.width * 0.50
        height: parent.height * 0.1
        border.color: "#000000"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                            fileHelper.nextFile()
                       }
        }
        Text{
            anchors.centerIn: parent;
            text: qsTr("No")
        }
    }

    Rectangle {
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        width: parent.width * 0.50
        height: parent.height * 0.1
        border.color: "#000000"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                            fileWriter.content += folderModel.get(fileHelper.position, "fileName") + "\n"
                            fileHelper.nextFile()
                       }
        }
        Text{
            anchors.centerIn: parent;
            text: qsTr("Yes")
        }
    }
}
