//
//  BLEScannerViewModel.swift
//  ConnectBT
//
//  Created by Sarah Jeong on 5/15/24.
//

import Foundation
import CoreBluetooth

class BLEScannerViewModel: NSObject, ObservableObject, CBCentralManagerDelegate, CBPeripheralDelegate {
    private var centralManager: CBCentralManager!
    @Published var devices = [BLEDevice]()
    @Published var isScanning = false
    private var peripherals = [UUID: CBPeripheral]()

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
        var device = BLEDevice(name: deviceName, identifier: peripheral.identifier, rssi: RSSI)
        if !devices.contains(where: { $0.identifier == peripheral.identifier }) {
            devices.append(device)
        }
        peripherals[peripheral.identifier] = peripheral
        peripheral.delegate = self
        centralManager.connect(peripheral, options: nil)
        
        print("이거?: \(device.serviceUUIDs)")
    }

    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        peripheral.discoverServices(nil)
    }

    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        guard let services = peripheral.services else { return }
        for service in services {
            peripheral.discoverCharacteristics(nil, for: service)
            print("serviceUUID: \(service.uuid.uuidString)")
        }
        
        if (peripheral.services != nil) {
            print("")
        }

        if let index = devices.firstIndex(where: { $0.identifier == peripheral.identifier }) {
            devices[index].serviceUUIDs = services.map { $0.uuid }
        }
    }

    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        guard let characteristics = service.characteristics else { return }

        if let index = devices.firstIndex(where: { $0.identifier == peripheral.identifier }) {
            devices[index].characteristicUUIDs.append(contentsOf: characteristics.map { $0.uuid })
        }
    }
}
