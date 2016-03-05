//
//  TableViewSectionType.swift
//  TableViewDisplayableSample
//
//  Created by Victor Hudson on 3/5/16.
//  Copyright © 2016 Victor Hudson. All rights reserved.
//

import Foundation
/**
	Use this protocol for structs used as the sections of a tableview for TableViewDisplayable. There are methods provided by the extension for adding and removing rows.
*/
protocol TableViewSectionType {
	var header: String { get set }
	var rows: [AnyObject] { get set }
	
	func insert(object object: AnyObject, atIndex index: Int)
	func removeObject(atIndex index: Int) -> AnyObject
}

extension TableViewSectionType {
	mutating func insert(object object: AnyObject, atIndex index: Int) {
		rows.insert(object, atIndex: index)
	}
	
	mutating func removeObject(atIndex index: Int) -> AnyObject {
		return rows.removeAtIndex(index)
	}
}