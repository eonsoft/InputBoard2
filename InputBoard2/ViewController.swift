//
//  ViewController.swift
//  InputBoard2
//
//  Created by apple on 2017/7/13.
//  Copyright © 2017年 EonSoft. All rights reserved.
//

import Cocoa

class ViewController: NSViewController ,NSTextStorageDelegate{
	@IBOutlet var textView: MyTextView!

	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
		textView.textStorage?.delegate = self
	}

	override var representedObject: Any? {
		didSet {
		// Update the view, if already loaded.
		}
	}


}

