//
//  YYSimple.swift
//  YYSimpleAlert
//
//  Created by Running Raccoon on 2021/01/22.
//

import Foundation

public class YYSimple {
    
    public static var infoDictionary: [String: Any]? = Bundle.main.infoDictionary {
        didSet {
            self._items = nil
        }
    }
    
    private static var _items: [ViewItem]? = nil
    
    public static var items: [ViewItem] {
        if let items = self._items {
            return items
        }
        
        let items = YYSimple.appendingYYSimple(to: YYSimple.items(from: YYSimple.infoDictionary) ?? [])
        self._items = items
        return items
    }
    
    static func items(from infoDictionary: [String: Any]? ) -> [ViewItem]? {
        return (infoDictionary?["YYSimple"] as? [[String: Any]])?
            .compactMap { dict -> ViewItem? in
                guard let name = dict["name"] as? String else { return nil }
                var item = ViewItem(name: name)
                item.detailText = (dict["text"] as? String)
                    .flatMap { Data(base64Encoded: $0)}
                    .flatMap { String(data: $0, encoding: .utf8) }
                return item
            }.sorted { $0.name < $1.name }
    }
    
    static func appendingYYSimple(to items: [ViewItem]) -> [ViewItem] {
        guard items.lazy.filter({ $0.name == "YYSimple"}).first == nil else {
            return items
        }
        
        var item = ViewItem(name: "YYSimple")
        item.detailText = ["YYSimple", "SDK", "Open Source"].joined(separator: "\n")
        
        return (items + [item]).sorted { $0.name < $1.name }
    }
}
