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
	/// Set `CellItem` to the Type you'll be displaying in your tableview.
	associatedtype CellItem
	
	/// The Array that represents the sections of your table. These objects should conform to `TableViewSectionType`.
	var sections: [TableViewSectionType]  { get set }
	
	/**
	The number of sections in your tableview structure.
	
	- returns: Int
	*/
	func numberOfSections() -> Int
	
	/**
	The number of rows in a section.
	
	- parameter section: `Int`: the section you need the row count for.
	
	- returns: Int
	*/
	func numberOfRowsInSection(section: Int) -> Int
	
	/**
	The title for section header.
	
	- parameter section: `Int`: the section you need the header for.
	
	- returns: String
	*/
	func titleForHeaderForSection(section: Int) -> String
	
	/**
	The title for the section footer.
	
	- parameter section: `Int`: the section you need the footer for.
	
	- returns: String
	*/
	func titleForFooterForSection(section: Int) -> String
	
	/**
	Returns the object located at the indexPath.
	
	- parameter indexPath: `NSIndexPath`: IndexPath of the desired Object.
	
	- returns: Type defined by `CellItem`
	*/
	func object(atIndexPath indexPath: IndexPath) -> CellItem
	
	/**
	An array of all the `CellItem`s in your structure.
	
	- returns: Array
	*/
	func allItems() -> [CellItem]
	
	/**
	Inserts new items into your data structre.
	
	- parameter object:    `CellItem` you want to insert.
	- parameter indexPath: `NSIndexPath` The location you want the item inserted.
	*/
	mutating func insert(object:CellItem, atIndexPath indexPath: IndexPath)
	
	/**
	Remove objects located in your data structure. The removed item is returned to the caller.
	
	- parameter indexPath: `NSIndexPath` The location of the object you want to remove.
	
	- returns: `CellItem`
	*/
	mutating func remove(objectAtIndexPath indexPath: IndexPath) -> CellItem

	/**
	Move `CellItem`s around within your data structure.
	
	- parameter sourceIndexPath:      `NSIndexPath` The index path of the `CellItem`s curent location.
	- parameter destinationIndexPath: `NSIndexPath` The index path of the `CellItem`s new location.
	*/
	mutating func moveItem(fromIndexPath sourceIndexPath: IndexPath, toIndexPath destinationIndexPath: IndexPath)

	
	mutating func replace(itemAtIndexPath indexPath: IndexPath, withNewItem item: CellItem)

	
	/**
	Inserts a new `TableViewSectionType` into your data structure.
	
	- parameter section: `TableViewSectionType` conforming item representing a section of data in your structure.
	- parameter index:   `Int` The index you'd like to insert your new section.
	*/
	mutating func insert(section: TableViewSectionType, atIndex index: Int)
	
	/**
	Removes and returns the section an the index passed in.
	
	- parameter index:   `Int` The index of the section you want to remove.
	- returns: `TableViewDescriptionType`
	*/
	mutating func remove(sectionAtIndex index: Int) -> TableViewSectionType
	
	
	mutating func replace(sectionAtIndex index: Int, withNewSection section: TableViewSectionType)
}


// MARK: - Method Implementations
extension TableViewDisplayable {
	
	func numberOfSections() -> Int {
		return sections.count
	}
	
	func numberOfRowsInSection(section: Int) -> Int {
		return sections[section].rows.count
	}
	
	func titleForHeaderForSection(section: Int) -> String {
		return sections[section].header
	}
	
	func titleForFooterForSection(section: Int) -> String {
		return sections[section].footer
	}
	
	func object(atIndexPath indexPath: IndexPath) -> CellItem {
		return sections[(indexPath as NSIndexPath).section].rows[(indexPath as NSIndexPath).row] as! CellItem
	}
	
	func allItems() -> [CellItem] {
		var items = [CellItem]()
		for s in sections {
			items.append(contentsOf: s.rows.map { $0 as! CellItem })
		}
		return items
	}

	mutating func insert(object: CellItem, atIndexPath indexPath: IndexPath) {
		sections[(indexPath as NSIndexPath).section].insert(object: object as Any, atIndex: (indexPath as NSIndexPath).row)
	}

	mutating func remove(objectAtIndexPath indexPath: IndexPath) -> CellItem {
		return sections[(indexPath as NSIndexPath).section].removeObject(atIndex: (indexPath as NSIndexPath).row) as! CellItem
	}

	mutating func moveItem(fromIndexPath sourceIndexPath: IndexPath, toIndexPath destinationIndexPath: IndexPath) {
		let item = self.remove(objectAtIndexPath: sourceIndexPath)
		self.insert(object: item, atIndexPath: destinationIndexPath)
	}
	
	mutating func replace(itemAtIndexPath indexPath: IndexPath, withNewItem item: CellItem) {
		_ = remove(objectAtIndexPath: indexPath)
		insert(object: item, atIndexPath: indexPath)
	}

	mutating func insert(section: TableViewSectionType, atIndex index: Int) {
		sections.insert(section, at: index)
	}

	mutating func remove(sectionAtIndex index: Int) -> TableViewSectionType {
		return sections.remove(at: index)		
	}
	
	mutating func replace(sectionAtIndex index: Int, withNewSection section: TableViewSectionType) {
		_ = remove(sectionAtIndex: index)
		insert(section: section, atIndex: index)
	}

}
