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
    
    let simpleVC = YYSimpleViewController()
    open lazy var items = YYSimple.items
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("items check: \(items)")
        var item = ViewItem(name: "YYSimple")
        item.detailText = "The MIT License (MIT) ...Very long text..."
        simpleVC.items.append(item)
        simpleVC.items.sort { $0.name < $1.name }
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

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleCell", for: indexPath) as! SimpleCell
        print("simplecell check: \(cell), \(items.count)")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52
    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = table.dequeueReusableCell(withIdentifier: "LicenseCell", for: indexPath) as! LicenseCell
//
//        let item = self.items[indexPath.row]
//        cell.licenseLbl?.text = item.displayName
//        cell.detailTextLabel?.text = item.licenseName
//        cell.accessoryType = .disclosureIndicator
//
//        return cell
//    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: false)
//        let carteItem = self.items[indexPath.row]
//        let controller = UIStoryboard.storyboard(.settings).instantiateViewController(withIdentifier: "OpenSourceDetailViewController") as! OpenSourceDetailViewController
//        controller.item = carteItem
//        self.navigationController?.pushViewController(controller, animated: true)
//    }
//
}
