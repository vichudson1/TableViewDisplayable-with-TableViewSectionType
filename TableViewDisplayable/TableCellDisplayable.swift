//
//  TableCellDisplayable.swift
//
//  Created by Victor Hudson on 3/26/16.
//  Copyright © 2016 Victor Hudson. All rights reserved.
//

import Foundation
import UIKit

protocol TableCellTextDisplayable {
	var textLabelString: String { get }
	var detailTextLabelString: String? { get }
}

extension TableCellTextDisplayable {
	func configure(cell: UITableViewCell) {
		cell.textLabel?.text = textLabelString
		
		var detailString = ""
		if let detail = detailTextLabelString {
			detailString = detail
		}
		
		cell.detailTextLabel?.text = detailString
	}
}

protocol TableCellImageDisplayable: TableCellTextDisplayable {
	var image: UIImage? { get }
}
