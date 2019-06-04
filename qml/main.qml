import QtQuick 2.12
import QtQuick.Controls 2.5
import Pokemon.api.menuFetch 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("PokeDex")

    MenuFetch {
        id: countFetch
        data: ""
        onDataChanged: pokeview.setModel = JSON.parse(fetch.data).count
    }

    ScrollView {
        anchors.fill: parent

        ListView {
            width: parent.width
            id: pokeview
            model: JSON.parse(countFetch.data).count
            spacing: 50
            delegate: ItemDelegate {
                MenuFetch {
                    id: menuFetch
                    onDataChanged: {
                        var mData = JSON.parse(menuFetch.data);
                        pokemage.source = mData.sprites.front_default
                        pokex.text = "\n\n"+mData.forms[0].name
                    }
                    data: "" + (index+1)
                }

                Row {
                    Image {
                        id: pokemage
                        source: "/"
                    }
                    Text {
                        id: pokex
                        text: ""
                    }
                }
            }
        }
    }
}
