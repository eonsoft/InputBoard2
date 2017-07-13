Input Board App Type-2

a simple App handles your keyDown action and can save text file.

steps:

1. create an App , use Swift, select storyboard, select document.
2. add a Swift file named MyTextView.swift, content:

import Cocoa
import Foundation
class MyTextView : NSTextView  {
override func keyDown(with event: NSEvent) {
Swift.print("MyTextView-keyDown:"+event.characters! as String)
super.keyDown(with: event)
}
}

3. in Main.storyboard, in Viwe Controller, add a Text View, modify its Class as MyTextView.
4. in Main.storyboard, in View Controller->Referencing Outlets, add a New ,
drag to the Text View, it will create a connection. 
5. run, then comes a window.
7. type your keyboard, and see Xcode's log window, IT WORKS !


8. in Main.sotryboard, select Text View, drag it to ViewController.swift, it will create a @IBOutlet var, name it textView.
9. run, then it works too.
10. in ViewController.swift, add NSTextStorageDelegate to class, then add textView.textStorage?.delegate = self in viewDidLoad().

11. in Document.swift, add 2 vars:
var curWinCtrl: NSWindowController?
var content: String = ""
12. in Class Document -> makeWindowControllers(), add codes:** IMPORTANT ** whithout these code it couldn't save normally.
self.curWinCtrl = windowController
if let viewController = windowController.contentViewController as? ViewController {
viewController.textView.string = content
}
13. in Class Document -> data(), replace to these codes:
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
14. in Class Document -> read(), replace to these codes:
if let text = String(data: data, encoding: .utf8) {
content = text
//Swift.print("Text: \n", text)
} else {
Swift.print("Error reading file")
throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
}
15. run, and test save, IT WORKS!

NOTE: the App could run normally when sandbox enabled.
