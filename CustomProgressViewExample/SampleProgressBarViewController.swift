//
//  SampleProgressBarViewController.swift
//  CustomProgressBarSample
//
//  Created by Shoaib Ismail on 02/07/2019.
//  Copyright © 2019 Emblem Technologies. All rights reserved.
//

import UIKit

class SampleProgressBarViewController: UIViewController {

    
    @IBOutlet weak var progressBar: CustomProgressbar!
    @IBOutlet weak var animationTimTF: UITextField!
    
    
    var animationTime = Double(3)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.setBackgroundColorsFor(innerBar: .red, middleBar: .blue, outterBar: .black)
    }
    
    
    // MARK: - UIActions
    
    @IBAction func startAnimationPressed(_ sender: Any) {
        animationTime = Double(animationTimTF.text ?? "3.0")!
        progressBar.setTimer(animationTime)
        progressBar.startAnimation()
    }
    
    @IBAction func resetViewPressed(_ sender: Any) {
        
    }
    
    
    
    @IBAction func stopInnerPressed(_ sender: Any) {
        progressBar.stopInnerBar = true
    }
    
    @IBAction func stopMiddlePressed(_ sender: Any) {
        progressBar.stopMiddleBar = true
    }
    
    @IBAction func stopOutterPressed(_ sender: Any) {
        progressBar.stopOutterBar = true
    }
    
}
