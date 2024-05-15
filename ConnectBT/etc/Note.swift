//
//  Note.swift
//  ConnectBT
//
//  Created by Sarah Jeong on 5/15/24.
//

import Foundation
/*
 //
 //  ContentView.swift
 //  ConnectBT
 //
 //  Created by tsis-Macbook Pro on 5/14/24.
 //

 import SwiftUI
 import CoreBluetooth

 struct ContentView: View {
  @StateObject var bluetoothManager = BluetoothManager() // this is Bluetooth manager

     var body: some View {
   VStack {
     Button(action: {
                 bluetoothManager.toggleBluetooth()
             }) {
         Text(bluetoothManager.isBluetoothEnabled ? "Turn Off Bluetooth" : "Turn On Bluetooth")
                     .padding()
        }
             
   Text("Bluetooth is \(bluetoothManager.isBluetoothEnabled ? "enabled" : "disabled")")
                 .padding()

 List(bluetoothManager.discoveredPeripherals, id: \.identifier) { peripheral in
                 Text(peripheral.name ?? "Unknown")
             }
         }
     }
 }

 class BLEManager: NSObject, ObservableObject, CBCentralManagerDelegate {
     var centralManager: CBCentralManager!
     @Published var devices = [CBPeripheral]()

     override init() {
         super.init()
         centralManager = CBCentralManager(delegate: self, queue: nil)
     }

     func startScanning() {
         devices.removeAll()
         centralManager.scanForPeripherals(withServices: nil, options: nil)
     }

     func centralManagerDidUpdateState(_ central: CBCentralManager) {
         if central.state == .poweredOn {
             startScanning()
         } else {
             print("Bluetooth is not available.")
         }
     }

     func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String: Any], rssi RSSI: NSNumber) {
         if !devices.contains(peripheral) {
             devices.append(peripheral)
         }
     }
 }

 //@main
 //struct BLEApp: App {
 //    var body: some Scene {
 //        WindowGroup {
 //            ContentView()
 //        }
 //    }
 //}



 #Preview {
     ContentView()
 }

 */
