//
//  BLEScannerViewModel.swift
//  ConnectBT
//
//  Created by Sarah Jeong on 5/15/24.
//

import Foundation
import CoreBluetooth

class BLEScannerViewModel: NSObject, ObservableObject, CBCentralManagerDelegate {
    private var centralManager: CBCentralManager!
    @Published var devices = [BLEDevice]()
    @Published var isScanning = false

    override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }

    func startScanning() {
        devices.removeAll()
        isScanning = true
        centralManager.scanForPeripherals(withServices: nil, options: nil)
    }

    func stopScanning() {
        isScanning = false
        centralManager.stopScan()
    }

    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            startScanning()
        } else {
            print("Bluetooth is not available.")
        }
    }

    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String: Any], rssi RSSI: NSNumber) {
        let deviceName = peripheral.name ?? "Unknown"
        let newDevice = BLEDevice(name: deviceName, identifier: peripheral.identifier, rssi: RSSI)
        if !devices.contains(where: { $0.identifier == peripheral.identifier }) {
            devices.append(newDevice)
        }
    }
}
