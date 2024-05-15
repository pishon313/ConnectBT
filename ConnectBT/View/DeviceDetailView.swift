//
//  DeviceDetailView.swift
//  ConnectBT
//
//  Created by Sarah Jeong on 5/15/24.
//

import Foundation
import SwiftUI

struct DeviceDetailView: View {
    var device: BLEDevice

    var body: some View {
        VStack {
            Text(device.name)
                .font(.largeTitle)
                .padding()

            Text("UUID: \(device.identifier.uuidString)")
                .font(.footnote)
                .padding()

            Text("RSSI: \(device.rssi)")
                .font(.subheadline)
                .padding()

            // 추가적인 정보나 기능을 여기에 추가할 수 있습니다.

            Spacer()
        }
        .navigationBarTitle(device.name, displayMode: .inline)
    }
}

