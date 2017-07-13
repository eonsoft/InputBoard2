//
//  MyTextView.swift
//  InputBoard2
//
//  Created by apple on 2017/7/13.
//  Copyright © 2017年 EonSoft. All rights reserved.
//

import Cocoa
import Foundation

class MyTextView : NSTextView  {
	override func keyDown(with event: NSEvent) {
		Swift.print("MyTextView-keyDown:"+event.characters! as String)
		super.keyDown(with: event)
	}
}
