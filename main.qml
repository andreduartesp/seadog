import QtQuick 2.2
import QtQuick.Controls 1.1
import Qt.labs.folderlistmodel 2.1

ApplicationWindow {
    visible: true
    width: 320
    height: 480
    title: qsTr("Hello World")


    Connections {
        target: fileWriter
        onChangeFile: {
            principalImage.source = folderModel.get(fileWriter.atualFile, "fileURL")
            if(fileWriter.atualFile >= folderModel.count - 1)
            {
                noButton.visible = false
                yesButton.visible = false
                sendMailButton.visible = true
            }
            else
            {
                noButton.visible = true
                yesButton.visible = true
                sendMailButton.visible = false
            }
        }
    }

    FolderListModel {
        id: folderModel
        nameFilters: ["*.jpg"]
        folder: "images/"
    }

    Image {
        id: principalImage
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width * 0.70
        height: parent.height * 0.80
        source: "images/" + ('000' + (fileWriter.atualFile)).substr(-3) + ".jpg"
    }

    Rectangle {
        id: noButton
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: parent.width * 0.5
        height: parent.height * 0.1
        border.color: "#000000"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                            fileWriter.addVote("No");
                       }
        }
        Text{
            anchors.centerIn: parent;
            text: qsTr("No")
        }
    }

    Rectangle {
        id: yesButton
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        width: parent.width * 0.5
        height: parent.height * 0.1
        border.color: "#000000"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                            fileWriter.addVote("Yes");
                       }
        }
        Text{
            anchors.centerIn: parent;
            text: qsTr("Yes")
        }
    }

    Rectangle {
        id: sendMailButton
        visible: false
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        width: parent.width * 1
        height: parent.height * 0.1
        border.color: "#000000"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                            fileWriter.sendEmail();
                       }
        }
        Text{
            anchors.centerIn: parent;
            text: qsTr("Send Result")
        }
    }

    Image {
        anchors.top: parent.top
        anchors.left: parent.left
        width: parent.width * 0.15
        height: parent.height * 0.1
        MouseArea {
            anchors.fill: parent
            onClicked: {
                            fileWriter.backFile()
                       }
        }
        source: "images/back-icon.png"
    }
}
