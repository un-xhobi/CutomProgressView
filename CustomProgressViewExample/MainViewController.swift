//
//  MainViewController.swift
//  CustomProgressView
//
//  Created by Shoaib Ismail on 04/07/2019.
//  Copyright © 2019 Xhobi. All rights reserved.
//

import UIKit
import CustomProgressViewFramework


class MainViewController: UIViewController {
    
    
    @IBOutlet weak var progressBar: CustomProgressBar!
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
        progressBar.resetViews()
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
