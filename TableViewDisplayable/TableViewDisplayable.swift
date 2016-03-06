//
//  TableViewDisplayable.swift
//
//  Created by Victor Hudson on 3/5/16.
//  Copyright © 2016 Victor Hudson. All rights reserved.
//

import Foundation
/**
	A simple protocol for structuring data to display and interact with in a tableview. Several free implementation functions are provided in the protocol extension.
*/
protocol TableViewDisplayable {
	
	typealias CellItem
	
	var sections: [TableViewSectionType]  { get set }
	
	func numberOfSections() -> Int
	func numberOfRowsInSection(section: Int) -> Int
	func titleForSection(section: Int) -> String
	
	/**
	Returns the object located at the indexPath
	
	- parameter indexPath: IndexPath of the desired Object.
	
	- returns: Object located at the IndexPath
	*/
	func object(atIndexPath indexPath: NSIndexPath) -> CellItem
	func insert(object object:AnyObject, atIndexPath indexPath: NSIndexPath)
	func removeObject(atIndexPath indexPath: NSIndexPath) -> CellItem
	func moveItem(fromIndexPath sourceIP: NSIndexPath, toIndexPath destinationIP: NSIndexPath)
}

// MARK: - Some Free Method Implementations
extension TableViewDisplayable {
	func numberOfSections() -> Int {
		return sections.count
	}
	
	func numberOfRowsInSection(section: Int) -> Int {
		return sections[section].rows.count
	}
	
	func titleForSection(section: Int) -> String {
		return sections[section].header
	}
	
	func objectForIndexPath(indexPath: NSIndexPath) -> CellItem {
		return sections[indexPath.section].rows[indexPath.row] as! CellItem
	}
	
	func insert(object object:CellItem, atIndexPath indexPath: NSIndexPath) {
		sections[indexPath.section].insert(object: object as! AnyObject, atIndex: indexPath.row)
	}

	mutating func removeObject(atIndexPath indexPath: NSIndexPath) -> CellItem {
		return sections[indexPath.section].removeObject(atIndex: indexPath.row) as! CellItem
	}

	func moveItem(fromIndexPath sourceIP: NSIndexPath, toIndexPath destinationIP: NSIndexPath) {
		let item = self.removeObject(atIndexPath: sourceIP)
		self.insert(object: item, atIndexPath: destinationIP)
	}
}