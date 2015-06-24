import QtQuick 2.2
import QtQuick.Controls 1.1
import Qt.labs.folderlistmodel 2.1
import QFileWriter 1.0

ApplicationWindow {
    visible: true
    width: 320
    height: 480
    title: qsTr("Hello World")

    QFileWriter{
        id: fileWriter
        content: ""
    }

    FolderListModel {
        id: folderModel
        nameFilters: ["*.png"]
        folder: "file:///sdcard/tmp/"
    }

    Item{
        id:atualFile
        property int position: 0
    }

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
    }

    Image {
        id: principalImage
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width * 0.70
        height: parent.height * 0.80
        source: "file:///sdcard/tmp/ColorTest1.png"
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
                            atualFile.position++
                            principalImage.source = folderModel.get(atualFile.position, "fileURL")
                            if(atualFile.position >= folderModel.count - 1)
                            {
                                fileWriter.writeFile()
                            }
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
                            fileWriter.content += folderModel.get(atualFile.position, "fileName") + "\n"
                            atualFile.position++
                            principalImage.source = folderModel.get(atualFile.position, "fileURL")
                            if(atualFile.position >= folderModel.count - 1)
                            {
                                fileWriter.writeFile()
                            }
                       }
        }
        Text{
            anchors.centerIn: parent;
            text: qsTr("Yes")
        }
    }
}
