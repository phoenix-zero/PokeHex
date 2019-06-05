import QtQuick 2.12
import QtQuick.Controls 2.5
import Pokemon.api.menuFetch 1.0

ListView {
    width: parent.width
    id: pokeview
    model: JSON.parse(countFetch.data).count
    spacing: 50

    MenuFetch {
        id: countFetch
        data: ""
        onDataChanged: {
            parent.model = JSON.parse(fetch.data).count
        }
    }
    function openPokeInfo(id)
    {
        popupLoader.setSource("qrc:/qml/details.qml",{"pokeID":`${id}`})
        popupLoader.active = true
        popupLoader.item.open()
    }
    Loader{
        id: popupLoader
        active: false
        source: "qrc:/qml/details.qml"
        onLoaded: item.open()
    }

    delegate: ItemDelegate {
        MouseArea{
            anchors.fill: parent
            onClicked: openPokeInfo(index+1)
        }

        anchors.horizontalCenter: parent.horizontalCenter
        MenuFetch {
            id: menuFetch
            onDataChanged: {
                var mData = JSON.parse(menuFetch.data);
                pokemage.source = mData.sprites.front_default
                pokex.text = "\n\n"+mData.forms[0].name+`(${index+1})`
            }
            data: "" + (index+1)
        }

        Row {
            anchors.centerIn: parent
            Image {
                id: pokemage
                source: "/"
            }
            Text {
                id: pokex
                text: ""
                color: "white"
            }
        }
    }
}
