//
//  ViewController.swift
//  YYSimpleAlert
//
//  Created by miiiiiin on 01/20/2021.
//  Copyright (c) 2021 miiiiiin. All rights reserved.
//

import UIKit
import YYSimpleAlert

class ViewController: YYSimpleViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("items check: \(items)")
        var item = ViewItem(name: "YYSimple")
        item.detailText = "The MIT License (MIT) ...Very long text..."
//        simpleVC.items.append(item)
//        simpleVC.items.sort { $0.name < $1.name }
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

extension ViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
