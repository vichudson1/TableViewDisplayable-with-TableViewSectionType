//
//  TableViewSectionType.swift
//  TableViewDisplayableSample
//
//  Created by Victor Hudson on 3/5/16.
//  Copyright © 2016 Victor Hudson. All rights reserved.
//

import Foundation

protocol TableViewSectionType {
	var sectionHeaderText: String { get set }
	var rows: [AnyObject] { get set }
}