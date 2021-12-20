//
//  SectionModel.swift
//  HW 12
//
//  Created by Ольга on 20.12.2021.
//

import UIKit

struct Section {
    let title: String
    let options: [SettingType]
}

enum SettingType {
    case staticCell(type: SettingOptions)
    case switchCell(type: SettingSwitchOptions)
    case notificationCell(type: NotificationSettingOptions)
}
