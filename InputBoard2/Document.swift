//
//  Document.swift
//  InputBoard2
//
//  Created by apple on 2017/7/13.
//  Copyright © 2017年 EonSoft. All rights reserved.
//

import Cocoa

class Document: NSDocument {

	var curWinCtrl: NSWindowController?
	var content: String = ""
	
	override init() {
	    super.init()
		// Add your subclass-specific initialization here.
	}

	override class func autosavesInPlace() -> Bool {
		return true
	}

	override func makeWindowControllers() {
		// Returns the Storyboard that contains your Document window.
		let storyboard = NSStoryboard(name: "Main", bundle: nil)
		let windowController = storyboard.instantiateController(withIdentifier: "Document Window Controller") as! NSWindowController
		self.addWindowController(windowController)
		
		// Custom code ** IMPORTANT ** whithout these code it couldn't save normally.
		self.curWinCtrl = windowController
		if let viewController = windowController.contentViewController as? ViewController {
			viewController.textView.string = content
		}
	}

	override func data(ofType typeName: String) throws -> Data {
		// Insert code here to write your document to data of the specified type. If outError != nil, ensure that you create and set an appropriate error when returning nil.
		// You can also choose to override fileWrapperOfType:error:, writeToURL:ofType:error:, or writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
		guard let viewController = curWinCtrl?.contentViewController as? ViewController else {
			Swift.print("No text for saving?")
			throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
		}
		
		let text = viewController.textView.string ?? ""
		//Swift.print("Saving text to ", self.fileURL!)
		
		if let data = text.data(using: .utf8) {
			return data
		} else {
			Swift.print("No data for saving?")
			throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
		}
	}

	override func read(from data: Data, ofType typeName: String) throws {
		// Insert code here to read your document from the given data of the specified type. If outError != nil, ensure that you create and set an appropriate error when returning false.
		// You can also choose to override readFromFileWrapper:ofType:error: or readFromURL:ofType:error: instead.
		// If you override either of these, you should also override -isEntireFileLoaded to return false if the contents are lazily loaded.
		if let text = String(data: data, encoding: .utf8) {
			content = text
			//Swift.print("Text: \n", text)
		} else {
			Swift.print("Error reading file")
			throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
		}
	}

	
}

