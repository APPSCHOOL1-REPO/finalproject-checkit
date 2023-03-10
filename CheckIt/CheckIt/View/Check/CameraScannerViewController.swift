//
//  CameraScannerViewController.swift
//  CheckIt
//
//  Created by 류창휘 on 2023/01/31.
//

import Foundation
import UIKit
import VisionKit
import SwiftUI

struct CameraScannerViewController: UIViewControllerRepresentable {
    @Binding var startScanning: Bool
    @Binding var userID: String?
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    
    func makeUIViewController(context: Context) -> DataScannerViewController {
        let viewController = DataScannerViewController(
            recognizedDataTypes: [.barcode()],
            qualityLevel: .fast,
            recognizesMultipleItems: false,
            isHighFrameRateTrackingEnabled: false,
            isHighlightingEnabled: true)
        
        viewController.delegate = context.coordinator

        return viewController
    }
    
    func updateUIViewController(_ viewController: DataScannerViewController, context: Context) {
        if startScanning {
            try? viewController.startScanning()
        } else {
            viewController.stopScanning()
        }
    }
    
    class Coordinator: NSObject, DataScannerViewControllerDelegate {
        var parent: CameraScannerViewController
        init(_ parent: CameraScannerViewController) {
            self.parent = parent
        }
        
        func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem) {
            switch item {
            case .barcode(let barcode):
                let details = barcode.payloadStringValue ?? ""
                parent.userID = details // uid
                print("barcode: \(barcode.payloadStringValue ?? "알 수 없음")")
                    dataScanner.stopScanning()
                    dataScanner.dismiss(animated: true)

                
            default:
                break
            }
        }
    }
}
