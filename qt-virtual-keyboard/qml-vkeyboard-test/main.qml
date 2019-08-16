import QtQuick 2.0
import QtQuick.Window 2.2
import "content"

Window {
    visible: true
    width: 800
    height: 480
    title: qsTr("Hello World")

    Flickable {
        id: flickable

        property real scrollMarginVertical: 20

        anchors.fill: parent
        contentWidth: content.width
        contentHeight: content.height
        interactive: contentHeight > height
        flickableDirection: Flickable.VerticalFlick
        children: ScrollBar {}

        MouseArea  {
            id: content

            width: flickable.width
            height: textEditors.height + 24

            onClicked: focus = true

            Column {
                id: textEditors
                spacing: 15
                x: 12; y: 12
                width: parent.width - 26

                Text {
                    color: "#565758"
                    text: "Tap fields to enter text"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 22
                }
                TextField {
                    width: parent.width
                    previewText: "One line field"
                    // enterKeyAction: EnterKeyAction.Next
                    onEnterKeyClicked: passwordField.focus = true
                }
                TextField {
                    id: passwordField

                    width: parent.width
                    echoMode: TextInput.Password
                    previewText: "Password field"
                    inputMethodHints: Qt.ImhNoAutoUppercase | Qt.ImhPreferLowercase | Qt.ImhSensitiveData | Qt.ImhNoPredictiveText
                    // enterKeyAction: EnterKeyAction.Next
                    onEnterKeyClicked: upperCaseField.focus = true
                }
                TextField {
                    id: upperCaseField

                    width: parent.width
                    previewText: "Upper case field"
                    inputMethodHints: Qt.ImhUppercaseOnly
                    // enterKeyAction: EnterKeyAction.Next
                    onEnterKeyClicked: lowerCaseField.focus = true
                }
                TextField {
                    id: lowerCaseField

                    width: parent.width
                    previewText: "Lower case field"
                    inputMethodHints: Qt.ImhLowercaseOnly
                    // enterKeyAction: EnterKeyAction.Next
                    onEnterKeyClicked: phoneNumberField.focus = true
                }
                TextField {
                    id: phoneNumberField

                    validator: RegExpValidator { regExp: /^[0-9\+\-\#\*\ ]{6,}$/ }
                    width: parent.width
                    previewText: "Phone number field"
                    inputMethodHints: Qt.ImhDialableCharactersOnly
                    // enterKeyAction: EnterKeyAction.Next
                    onEnterKeyClicked: formattedNumberField.focus = true
                }
                TextField {
                    id: formattedNumberField

                    width: parent.width
                    previewText: "Formatted number field"
                    inputMethodHints: Qt.ImhFormattedNumbersOnly
                    // enterKeyAction: EnterKeyAction.Next
                    onEnterKeyClicked: digitsField.focus = true
                }
                TextField {
                    id: digitsField

                    width: parent.width
                    previewText: "Digits only field"
                    inputMethodHints: Qt.ImhDigitsOnly
                    // enterKeyAction: EnterKeyAction.Next
                    onEnterKeyClicked: textArea.focus = true
                }
                TextArea {
                    id: textArea

                    width: parent.width
                    previewText: "Multiple lines field"
                    height: Math.max(206, implicitHeight)
                }
            }
        }
    }
}
