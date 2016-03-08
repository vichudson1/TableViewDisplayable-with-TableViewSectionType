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
	
	/// `String` The header title for the section.
	var header: String { get set }
	
	/// `String` The footer title for the section.
	var footer: String { get set }
	
	/// `Array` The items contained in your section.
	var rows: [AnyObject] { get set }
	
	/**
	Inserts Items into your section.
	
	- parameter object: `AnyObject`: The item you want to insert into your section.
	- parameter index:  `Int`: The index you want to insert the item to.
	*/
	mutating func insert(object object: AnyObject, atIndex index: Int)
	
	/**
	Removes and returns the item located at the passed in index.
	
	- parameter index: `Int`: The index of the object to remove.
	
	- returns: `AnyObject`
	*/
	mutating func removeObject(atIndex index: Int) -> AnyObject

	/**
	Creates an instance of a Type conforming to `TableViewSectionType`.
	
	- parameter header: `String`: The header for the section.
	- parameter footer: `String`: The footer for the section.
	- parameter rows:   `[AnyObject]`: An array containing the items for the section.
	*/
	init(header:String, footer: String, rows:[AnyObject])
}

extension TableViewSectionType {
	mutating func insert(object object: AnyObject, atIndex index: Int) {
		rows.insert(object, atIndex: index)
	}
	
	mutating func removeObject(atIndex index: Int) -> AnyObject {
		return rows.removeAtIndex(index)
	}
	
	init(header:String = "", footer: String = "", rows:[AnyObject] = []) {
		self.init(header: header, footer: footer, rows: rows)
	}
}