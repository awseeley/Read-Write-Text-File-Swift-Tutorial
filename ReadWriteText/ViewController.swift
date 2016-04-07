//
//  ViewController.swift
//  ReadWriteText
//
//  Created by Andrew on 7/04/2016.
//  Copyright © 2016 Seemu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Save data to file
        let fileName = "Test"
        let DocumentDirURL = try! NSFileManager.defaultManager().URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true)
        
        let fileURL = DocumentDirURL.URLByAppendingPathComponent(fileName).URLByAppendingPathExtension("txt")
        print("FilePath: \(fileURL.path)")
        
        let writeString = "Write this text to the fileURL as text in iOS using Swift"
        do {
            // Write to the file
            try writeString.writeToURL(fileURL, atomically: true, encoding: NSUTF8StringEncoding)
        } catch let error as NSError {
            print("Failed writing to URL: \(fileURL), Error: " + error.localizedDescription)
        }
     
        var readString = "" // Used to store the file contents
        do {
            // Read the file contents
            readString = try String(contentsOfURL: fileURL)
        } catch let error as NSError {
            print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
        }
        print("File Text: \(readString)")
        
        /*** Read from project txt file ***/
        
        // File location
        let fileURLProject = NSBundle.mainBundle().pathForResource("ProjectTextFile", ofType: "txt")
        // Read from the file
        var readStringProject = ""
        do {
            readStringProject = try String(contentsOfFile: fileURLProject!, encoding: NSUTF8StringEncoding)
        } catch let error as NSError {
             print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
        }

        print(readStringProject)
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

