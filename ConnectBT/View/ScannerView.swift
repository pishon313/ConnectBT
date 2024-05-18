//
//  ScannerView.swift
//  ConnectBT
//
//  Created by Sarah Jeong on 5/15/24.
//
import SwiftUI

struct ScannerView: View {
    @ObservedObject var viewModel = BLEScannerViewModel()
    @State private var selectedDevice: BLEDevice? = nil
    @State private var isShowingDetailView = false

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // 네비게이션 바 위에 여백 추가
                Color.clear.frame(height: 50)

                // 커스텀 네비게이션 바 제목
                HStack {
                    Text("BLE Device Scanner")
                        .font(.largeTitle.bold())
                        .bold()
                        .padding(.leading, 15) // 제목을 왼쪽으로 이동
                    Spacer()
                }
                .padding(.top, 10) // 네비게이션 바의 여백 조정
                .background(Color(UIColor.systemBackground))

//                Divider() // 제목 아래에 구분선 추가

                // 투명한 사각형 바
                Rectangle()
                    .fill(Color.clear) // 사각형 내부를 투명하게 설정
                    .frame(height: 60)
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
//                    .border(Color.gray, width: 1) // 회색 테두리 추가
                    .padding([.leading, .trailing])

                // 중간에 발견한 장치를 보여주는 ScrollView
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(viewModel.devices) { device in
                            Button(action: {
                                self.selectedDevice = device
                                self.isShowingDetailView = true
                            }) {
                                VStack(alignment: .leading) {
                                    Text(device.name)
                                        .font(.headline)
                                        .foregroundColor(.blue)
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
            .navigationBarHidden(true) // 기본 네비게이션 바를 숨깁니다
            .sheet(item: $selectedDevice) { device in
                DeviceDetailView(device: device)
            }
        }
    }
}
