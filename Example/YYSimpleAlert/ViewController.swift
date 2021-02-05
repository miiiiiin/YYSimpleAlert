//
//  ViewController.swift
//  YYSimpleAlert
//
//  Created by miiiiiin on 01/20/2021.
//  Copyright (c) 2021 miiiiiin. All rights reserved.
//

import UIKit
import YYSimpleAlert
import GoogleSignIn

class ViewController: YYSimpleViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("items check: \(items)")
        var item = ViewItem(name: "YYSimple")
        item.detailText = "The MIT License (MIT) ...Very long text..."
        
        GIDSignIn.sharedInstance()?.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert(_ sender: UIButton) {
        YYSimpleAlert(title: "Simple Alert Check", confirm: "Yes") {
            print("So Simple Alert")
            let viewItem = self.items.first
            let controller = YYSimpleDetailViewController(item: viewItem!)
            self.navigationController?.pushViewController(controller, animated: true)
        }.show(in: view)
    }
}

extension ViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
    }    
}

extension ViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
