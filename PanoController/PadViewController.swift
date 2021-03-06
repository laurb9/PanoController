//
//  PadViewController.swift
//  PanoController
//
//  Created by Laurentiu Badea on 9/4/17.
//  Copyright © 2017 Laurentiu Badea. All rights reserved.
//

import UIKit

enum MoveMode {
    case freeMove
    case gridMove
}

class PadViewController: UIViewController {
    var bleManager: BLEManager!
    var moveMode: MoveMode = .freeMove
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        print("PadViewControler: \(String(describing: bleManager))")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func repeatFreeMove(horizontal: Float, vertical: Float) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) {
            (timer: Timer) in
            self.bleManager.panoPeripheral?.writeLine("A\(horizontal*2) C\(vertical*2) M114") // FIXME: gcode, use Pano and disable accel
        }
    }
    func stopFreeMove(){
        timer?.invalidate()
    }

    @IBAction func leftArrowBegin(_ sender: UIButton) {
        switch moveMode {
        case .gridMove: break // FIXME: bleManager.panoPeripheral?.sendIncMove(.back)
        case .freeMove: repeatFreeMove(horizontal: -1, vertical: 0)
        }
    }
    @IBAction func leftArrowEnd(_ sender: UIButton) {
        stopFreeMove()
    }

    @IBAction func rightArrowBegin(_ sender: UIButton) {
        switch moveMode {
        case .gridMove: break // FIXME: bleManager.panoPeripheral?.sendIncMove(.forward)
        case .freeMove: repeatFreeMove(horizontal: 1, vertical: 0)
        }
    }
    @IBAction func rightArrowEnd(_ sender: UIButton) {
        stopFreeMove()
    }

    @IBAction func upArrowBegin(_ sender: UIButton) {
        switch moveMode {
        case .gridMove: break // FIXME: bleManager.panoPeripheral?.sendIncMove(.up)
        case .freeMove: repeatFreeMove(horizontal: 0, vertical: 1)
        }
    }
    @IBAction func upArrowEnd(_ sender: UIButton) {
        stopFreeMove()
    }

    @IBAction func downArrowBegin(_ sender: UIButton) {
        switch moveMode {
        case .gridMove: break // FIXME: bleManager.panoPeripheral?.sendIncMove(.down)
        case .freeMove: repeatFreeMove(horizontal: 0, vertical: -1)
        }
    }
    @IBAction func downArrowEnd(_ sender: UIButton) {
        stopFreeMove()
    }

    @IBAction func ok(_ sender: UIButton) {
        print("ok pressed")
        stopFreeMove()
    }

    @IBAction func shutter(_ sender: UIButton) {
        bleManager.panoPeripheral?.writeLine("M240 P0.01 Q0 R0.1") // FIXME: gcode, use Pano
    }
}
