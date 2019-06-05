import QtQuick 2.12
import QtQuick.Controls 2.5
import "qrc:/qml"

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("PokeDex")


    ScrollView {
        anchors.fill: parent
        Pokelist{
        }
    }

}
