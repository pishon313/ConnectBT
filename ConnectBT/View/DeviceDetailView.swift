//
//  DeviceDetailView.swift
//  ConnectBT
//
//  Created by Sarah Jeong on 5/15/24.
//
import SwiftUI

struct DeviceDetailView: View {
    var device: BLEDevice

    var body: some View {
        
        VStack {
            Text(device.name)
                .font(.largeTitle)
                .padding()
            
            Divider()
                .frame(height: 3.5)
                .background(Color.gray)


            
            ScrollView {
                
                Text("UUID: \(device.identifier.uuidString)")
                    .font(.footnote)
                    .padding()
                
                Text("RSSI: \(device.rssi)")
                    .font(.subheadline)
                    .padding()
                
                Text("Service UUIDs: \(device.serviceUUIDs)")
                    .font(.headline)
                    .padding(.top)
                
                ForEach(device.serviceUUIDs, id: \.self) { uuid in
                    Text(uuid.uuidString)
                        .font(.footnote)
                        .padding(.bottom, 1)
                }
                
                Text("Characteristic UUIDs: \(device.characteristicUUIDs)")
                    .font(.headline)
                    .padding(.top)
                
                ForEach(device.characteristicUUIDs, id: \.self) { uuid in
                    Text(uuid.uuidString)
                        .font(.footnote)
                        .padding(.bottom, 1)
                }
                
                Spacer()
            }

        }
        .navigationBarTitle(device.name, displayMode: .inline)
        
    }
}
