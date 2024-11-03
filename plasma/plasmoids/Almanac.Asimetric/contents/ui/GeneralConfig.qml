import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.11
import org.kde.plasma.core 2.0 as PlasmaCore

Item {
    id: configRoot

    signal configurationChanged
    property alias cfg_desingone: desingone.checked

    ColumnLayout {
        spacing: units.smallSpacing * 2
        RowLayout{
            CheckBox {
            id: desingone
            text: i18n('alternative design')
            Layout.columnSpan: 2
            }

        }
}

}
