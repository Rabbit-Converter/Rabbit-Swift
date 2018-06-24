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
      if let bundlePath = Bundle(for: self.classForCoder).path(forResource: "sample", ofType: "json") {
      
        let json = try? NSString(contentsOfFile: bundlePath, encoding: String.Encoding.utf8.rawValue)
        
        XCTAssertNotNil(json, "JSON string not found")
        
        
        if let data:Data = json?.data(using: String.Encoding.utf8.rawValue) {
          
          let words:NSDictionary = (try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)) as! NSDictionary
          
          let zawgyi: NSArray = words["zg"] as! NSArray
          let uni: NSArray = words["uni"] as! NSArray
          

          
          
          for i in 0 ..< zawgyi.count {
            
            let unicode:String = uni[i] as! String
            let zawgyi:String = zawgyi[i] as! String
            
            XCTAssertEqual(Rabbit.uni2zg(unicode),zawgyi, "Uni to zawgyi problem")
            XCTAssertEqual(Rabbit.zg2uni(zawgyi),unicode, "Uni to zawgyi problem")
            
          }
          
        }
        
        
      }
      
    }
    

    
}
