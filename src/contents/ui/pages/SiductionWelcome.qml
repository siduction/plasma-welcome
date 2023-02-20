/*
 *  SPDX-FileCopyrightText: 2021 Felipe Kinoshita <kinofhek@gmail.com>
 *  SPDX-FileCopyrightText: 2022 Nate Graham <nate@kde.org>
 *
 *  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only OR LicenseRef-KDE-Accepted-GPL
 */

import QtQuick 2.15
import QtQuick.Controls 2.15 as QQC2
import QtQuick.Layouts 1.15
import org.kde.kirigami 2.15 as Kirigami
import org.kde.plasma.welcome 1.0

GenericPage {
    heading: i18nc("@title", "Welcome to siduction!")
    description: xi18nc("@info:usagetip", "Siduction is an operating system based on the Linux kernel and the GNU project. In addition, there are applications and libraries from Debian.The name siduction is a play on two words. The word sid, which is the codename of Debian Unstable, and seduction in the sense of seduce. ")

    topContent: [
        Kirigami.UrlButton {
            id: link
            Layout.topMargin: Kirigami.Units.largeSpacing
            text: i18nc("@action:button", "Learn more about siduction")
            url: "https://siduction.org"
        }
    ]

    Image {
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -Kirigami.Units.gridUnit * 4
        width: Kirigami.Units.gridUnit * 16
        height: Kirigami.Units.gridUnit * 16
        source: "logo-siduction.png"
        fillMode: Image.PreserveAspectFit

        QQC2.Label {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.bottom
            width: Math.round(parent.width * 0.75)
            text: i18nc("@info", "Welcome to the siduction community!")
            wrapMode: Text.Wrap
            horizontalAlignment: Text.AlignHCenter
        }

        HoverHandler {
            id: hoverhandler
            cursorShape: Qt.PointingHandCursor
        }
        TapHandler {
            onTapped: Qt.openUrlExternally(link.url)
        }
        QQC2.ToolTip {
            visible: hoverhandler.hovered
            text: i18nc("@action:button clicking on this takes the user to a web page", "Visit %1", link.url)
        }
    }
}
