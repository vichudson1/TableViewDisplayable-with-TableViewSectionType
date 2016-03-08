//
//  File.swift
//  TableViewDisplayableSample
//
//  Created by Victor Hudson on 3/7/16.
//  Copyright © 2016 Victor Hudson. All rights reserved.
//

import Foundation

struct TableViewSection: TableViewSectionType {
	var header: String
	var footer: String
	var rows: [AnyObject]
}