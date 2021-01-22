//
//  CarteItem.swift
//  YYSimpleAlert
//
//  Created by Running Raccoon on 2021/01/22.
//

import Foundation

public struct CarteItem {

  public var name: String
  public var version: String?
  public var licenseName: String?
  public var licenseText: String?

  public var displayName: String? {
    if let version = self.version {
      return "\(self.name) (\(version))"
    }
    return self.name
  }

  public init(name: String) {
    self.name = name
  }
  
}
