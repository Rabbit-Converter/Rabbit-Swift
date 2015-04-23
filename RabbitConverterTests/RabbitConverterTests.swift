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
      
        var json = NSString(contentsOfFile: bundlePath, encoding: NSUTF8StringEncoding, error: nil)
        
        XCTAssertNotNil(json, "JSON string not found")
        
        
        if let data:NSData = json?.dataUsingEncoding(NSUTF8StringEncoding) {
          
          var words:NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
          
          var zawgyi: NSArray = words["zg"] as! NSArray
          var uni: NSArray = words["uni"] as! NSArray
          

          var i:Int
          
          for i = 0; i < zawgyi.count ; i++ {
            
            var unicode:String = uni[i] as! String
            var zawgyi:String = zawgyi[i] as! String
            
            XCTAssertEqual(Rabbit.uni2zg(unicode),zawgyi, "Uni to zawgyi problem")
            XCTAssertEqual(Rabbit.zg2uni(zawgyi),unicode, "Uni to zawgyi problem")
            
          }
          
        }
        
        
      }
      
    }
    

    
}
