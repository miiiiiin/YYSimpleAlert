//
//  ViewController.swift
//  YYSimpleAlert
//
//  Created by miiiiiin on 01/20/2021.
//  Copyright (c) 2021 miiiiiin. All rights reserved.
//

import UIKit
import YYSimpleAlert

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert(_ sender: UIButton) {
        YYSimpleAlert(title: "Simple Alert Check", confirm: "Yes") {
            print("So Simple Alert")
        }.show(in: view)
    }
}

