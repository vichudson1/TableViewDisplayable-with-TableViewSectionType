//
//  MasterViewController.swift
//  TableViewDisplayableSample
//
//  Created by Victor Hudson on 3/5/16.
//  Copyright © 2016 Victor Hudson. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

	var detailViewController: DetailViewController? = nil
	
	var config = TableViewConfig()

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		self.navigationItem.leftBarButtonItem = self.editButtonItem()

		let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
		self.navigationItem.rightBarButtonItem = addButton
		if let split = self.splitViewController {
		    let controllers = split.viewControllers
		    self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
		}
		
		buildInitialConfig()
	}

	override func viewWillAppear(animated: Bool) {
		self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
		super.viewWillAppear(animated)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func buildInitialConfig() {
		let rows = ["Thing 1", "Thing 2"]
		let section1 = TableViewSection(header: "Things", rows: rows)
		self.config.insert(section: section1, atIndex: 0)
		
		let rows2 = ["Thing 3", "Thing 4", "Thing 5"]
		let section2 = TableViewSection(header: "More Things", footer: "A bunch more Things", rows: rows2)
		self.config.insert(section: section2, atIndex: 1)
	}

	func insertNewObject(sender: AnyObject) {
		let indexPath = NSIndexPath(forRow: 0, inSection: 0)
		config.insert(object: "Thing \(config.allItems().count + 1)", atIndexPath: indexPath)
		self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
	}


	// MARK: - Table View

	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return config.numberOfSections()
	}

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return config.numberOfRowsInSection(section: section)
	}

	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

		let object = config.object(atIndexPath: indexPath)
		cell.textLabel!.text = object
		return cell
	}

	override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
		// Return false if you do not want the specified item to be editable.
		return true
	}
	
	override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return config.titleForHeaderForSection(section: section)
	}
	
	override func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
		return config.titleForFooterForSection(section: section)
	}

	override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
		if editingStyle == .Delete {
			config.remove(objectAtIndexPath: indexPath)
			if config.numberOfRowsInSection(section: indexPath.section) == 0 {
				config.remove(sectionAtIndex: indexPath.section)
				tableView.deleteSections(NSIndexSet(index: indexPath.section), withRowAnimation: .Automatic)
			} else {
				tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
			}
		} 
	}
	
	override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
		config.moveItem(fromIndexPath: sourceIndexPath, toIndexPath: destinationIndexPath)
	}


}

