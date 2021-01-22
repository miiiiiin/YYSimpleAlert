//
//  YYSimpleViewController.swift
//  YYSimpleAlert
//
//  Created by Running Raccoon on 2021/01/22.
//

#if os(iOS)
import UIKit

open class YYSimpleViewController: UITableViewController {
    
    open lazy var items = YYSimple.items
    open var configureDetailViewController: ((YYSimpleDetailViewController) -> Void)?
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("YYSimpleView", comment: "Open Source Licenses")
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    private func adjustLeftBarButtonItemIfNeeded() {
        guard self.navigationItem.leftBarButtonItem == nil else { return }
        let isPresented = (self.presentingViewController != nil)
        if isPresented {
          self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(self.doneButtonDidTap))
        }
    }
    
    @objc open dynamic func doneButtonDidTap() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension YYSimpleViewController {
    
    open override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    open override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = self.items[indexPath.row]
        cell.textLabel?.text = item.displayName
        cell.detailTextLabel?.text = item.detailText
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    open override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let viewitem = self.items[indexPath.row]
        let detailViewController = YYSimpleDetailViewController(item: viewitem)
        self.configureDetailViewController?(detailViewController)
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

open class YYSimpleDetailViewController: UIViewController {
    
    public var viewItem: ViewItem
    
    open var textView: UITextView = {
      let textView = UITextView()
      textView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
      textView.font = UIFont.preferredFont(forTextStyle: .footnote)
      textView.isEditable = false
      textView.alwaysBounceVertical = true
      textView.dataDetectorTypes = .link
      return textView
    }()

    public init(item: ViewItem) {
        self.viewItem = item
        super.init(nibName: nil, bundle: nil)
        self.title = item.displayName
        self.textView.text = item.detailText
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.textView.frame = self.view.bounds
        self.textView.contentOffset = .zero
        self.view.addSubview(self.textView)
        
        print("yysimple detailvc: \(self.viewItem)")
    }
}
#endif

