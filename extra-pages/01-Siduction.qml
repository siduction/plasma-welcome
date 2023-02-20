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
import QtGraphicalEffects 1.15

import org.kde.welcome 1.0
import org.kde.plasma.welcome 1.0

GenericPage {
    heading: i18nc("@info:window", "Welcome to Siduction")
    description: i18nc("@info:usagetip", "It's the best distro in the world, until it explodes.")

    Kirigami.Icon {
        id: image
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -Kirigami.Units.gridUnit * 4
        width: Kirigami.Units.gridUnit * 8
        height: Kirigami.Units.gridUnit * 8
        source: "siduction"

        HoverHandler {
            id: hoverhandler
            cursorShape: Qt.PointingHandCursor
        }
        TapHandler {
            onTapped: showPassiveNotification(i18n("Why on earth would you click this!?"));
        }

        QQC2.ToolTip {
            visible: hoverhandler.hovered
            text: i18nc("@action:button", "Detonating the bomb in 3... 2... 1...")
        }

        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            horizontalOffset: 0
            verticalOffset: 1
            radius: 20
            samples: 20
            color: Qt.rgba(0, 0, 0, 0.2)
        }
    }

    Kirigami.Heading {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: image.bottom
        text: i18nc("@title the name of the 'System Exploder' app", "Someone set up us the bomb")
        wrapMode: Text.WordWrap
        level: 3
    }
}
