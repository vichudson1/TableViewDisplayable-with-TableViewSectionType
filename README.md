# TableViewDisplayable & TableViewSectionType
2 protocols for quickly setting up a data structure to store & interact with data types in a UITableView.

## TableViewDisplayable
This is a protocol for types to adopt for quickly putting data types into a structure suitable for displaying and interacting with data within a UITableView. The included protocol extension supplies several free method implementations for working with the data stored in the data structure and facilitates interaction with them via methods very similar to the UITableView protocol methods.. In most cases you can simply pass your tableview delegate methods directly to your type conforming to  *TableViewDisplayable*. 

For your Types to conform they simply need an array of sections, and to set the type of data you’ll be storing in the tableview. 
* var sections: [TableViewSectionType]
* typeAlias CellItem

## TableViewSectionType
This is the protocol for the type that actually represents the sections of data in your tableview. The *TableViewDisplayable* conforming type manages an array of these *TableViewSectionType* conforming objects. The *TableViewSectionType* protocol extension provides 2 free method implementations to add and remove rows from the section.

For your types to conform they need the following properties.
* var header: String // The section header, an empty string by default.
* var footer: String // The Section footer, an empty string by default.
* var rows: [AnyObject]  // The array holding the items to be displayed within the section, an empty array by default.

To use simple initialize an instance of a type conforming to *TableViewDisplayable*. Next build at least one instance of a type conforming to *TableViewSectionType*. Finally use the *TableViewDisplayable* method `insert(section: , atIndex: )` to add your new section to the tableview. See the sample project for full implementation.

