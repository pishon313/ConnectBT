//
//  ScannerView.swift
//  ConnectBT
//
//  Created by Sarah Jeong on 5/15/24.
//

import Foundation
import SwiftUI


struct ScannerView: View {
    @ObservedObject var viewModel = BLEScannerViewModel()

    var body: some View {
        NavigationView {
            VStack {
                // 상단 제목
                Text("BLE Device Scanner")
                    .font(.largeTitle)
                    .padding(.top, 8) // 상단에 8포인트 여백 추가
                    .padding(.leading, 15) // 왼쪽으로 15포인트 이동
                    .padding(.bottom) // 기본 패딩 유지

                // 투명한 사각형 바
                Rectangle()
                    .fill(Color.clear) // 사각형 내부를 투명하게 설정
                    .frame(height: 30)
                    .overlay(
                        HStack {
                            Spacer()
                            Toggle(isOn: $viewModel.isScanning) {
                                Text(viewModel.isScanning ? "Stop Scanning" : "Start Scanning")
                            }
                            .padding(.trailing, 10)
                            .onChange(of: viewModel.isScanning) { isScanning in
                                if isScanning {
                                    viewModel.startScanning()
                                } else {
                                    viewModel.stopScanning()
                                }
                            }
                            Spacer()
                        }
                    )
                    .border(Color.gray, width: 1) // 회색 테두리 추가
                    .padding([.leading, .trailing])

                // 중간에 발견한 장치를 보여주는 ScrollView
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(viewModel.devices) { device in
                            NavigationLink(destination: DeviceDetailView(device: device)) {
                                VStack(alignment: .leading) {
                                    Text(device.name)
                                        .font(.headline)
                                    Text("RSSI: \(device.rssi)")
                                        .font(.subheadline)
                                    Text("UUID: \(device.identifier.uuidString)")
                                        .font(.footnote)
                                        .foregroundColor(.gray)
                                }
                                .padding()
                                .background(Color(.secondarySystemBackground))
                                .cornerRadius(10)
                                .padding([.leading, .trailing])
                            }
                        }
                    }
                }

                Spacer()
            }
            .navigationBarTitle("BLE Device Scanner", displayMode: .inline)
        }
    }
}
