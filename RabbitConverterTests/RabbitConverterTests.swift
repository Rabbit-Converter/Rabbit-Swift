//
//  RabbitConverterTests.swift
//  RabbitConverterTests
//
//  Created by Htain Lin Shwe on 23/4/15.
//  Copyright (c) 2015 comquas. All rights reserved.
//

import UIKit
import XCTest

class RabbitConverterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRabbit() {
        // This is an example of a functional test case.
      if let bundlePath = NSBundle(forClass: self.classForCoder).pathForResource("sample", ofType: "json") {
      
        let json = try? NSString(contentsOfFile: bundlePath, encoding: NSUTF8StringEncoding)
        
        XCTAssertNotNil(json, "JSON string not found")
        
        
        if let data:NSData = json?.dataUsingEncoding(NSUTF8StringEncoding) {
          
          let words:NSDictionary = (try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers)) as! NSDictionary
          
          let zawgyi: NSArray = words["zg"] as! NSArray
          let uni: NSArray = words["uni"] as! NSArray
          

          var i:Int
          
          for i = 0; i < zawgyi.count ; i++ {
            
            let unicode:String = uni[i] as! String
            let zawgyi:String = zawgyi[i] as! String
            
            XCTAssertEqual(Rabbit.uni2zg(unicode),zawgyi, "Uni to zawgyi problem")
            XCTAssertEqual(Rabbit.zg2uni(zawgyi),unicode, "Uni to zawgyi problem")
            
          }
          
        }
        
        
      }
      
    }
    

    
}
