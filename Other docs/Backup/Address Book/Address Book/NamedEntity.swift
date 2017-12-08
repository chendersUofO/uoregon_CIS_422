//
//  NamedEntity.swift
//  Address Book
//
//  Created by Caleb Friden on 1/14/16.
//  Copyright © 2016 CIS422 Team Dead Beef. All rights reserved.
//

import Foundation


public protocol NamedEntity {
    static var entityName: String { get }
}