import QtQuick 2.12
import QtQuick.Controls 2.5
import Pokemon.api.menuFetch 1.0

ApplicationWindow {
    property int pokeID: 0
    visible: true
    width: 640
    height: 480
    title: qsTr("PokeDetail")

    MenuFetch{
        id: detailFetch
        data: ""+pokeID
        onDataChanged: {
            textbox.text = JSON.parse(data).toString()
        }
    }

    Text {
        id: textbox
        text: ""
    }
}
