//
//  BLEDevice.swift
//  ConnectBT
//
//  Created by Sarah Jeong on 5/15/24.
//

import Foundation
import CoreBluetooth

struct BLEDevice: Identifiable {
    let id = UUID()
    let name: String
    let identifier: UUID
    let rssi: NSNumber
    var serviceUUIDs: [CBUUID] = []
    var characteristicUUIDs: [CBUUID] = []
}
