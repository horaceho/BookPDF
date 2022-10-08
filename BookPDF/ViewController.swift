//
//  ViewController.swift
//  BookPDF
//
//  Created by Horace Ho on 5/10/2022.
//

import UIKit
import PDFKit

class ViewController: UIViewController {

    @IBOutlet var pdfView: UIView!
    @IBOutlet var boxView: UIView!
    @IBOutlet var oneButton: UIButton!
    @IBOutlet var twoButton: UIButton!

    override var prefersStatusBarHidden: Bool {
         return true
    }

    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func clickButtonOne() {
        print("One")
    }

    @IBAction func clickButtonTwo() {
        print("Two")
    }

    @IBAction func clickButtonDebug() {
        debugInfo()
    }

    @IBAction func handlePan(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)

        guard let gestureView = gesture.view else {
            return
        }

        gestureView.center = CGPoint(
            x: gestureView.center.x + translation.x,
            y: gestureView.center.y + translation.y
        )

        gesture.setTranslation(.zero, in: view)
    }

    func debugInfo() {
        print("pdfView: w \(pdfView.frame.size.width) h \(pdfView.frame.size.height)")
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        debugInfo()
        coordinator.animate(alongsideTransition: nil) { _ in
            self.debugInfo()
        }
    }
}
