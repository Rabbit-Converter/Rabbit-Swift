import XCTest
@testable import Rabbit

final class RabbitTests: XCTestCase {
    
    
    var json: String?
    
    override func setUp() {
        super.setUp()
        if let bundlePath = Bundle.module.path(forResource: "sample", ofType: "json") {
            do {
                json = try String(contentsOfFile: bundlePath, encoding: .utf8)
            } catch {
                XCTFail("Error reading JSON file: \(error.localizedDescription)")
            }
        } else {
            XCTFail("JSON file not found in the bundle.")
        }
    }
    
    func testConvertUniToZawgyi() {
        guard let json = json, let data = json.data(using: .utf8) else {
            XCTFail("JSON data not available.")
            return
        }
        
        do {
            let words = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            let zawgyiArray = words?["zg"] as? [String]
            let uniArray = words?["uni"] as? [String]
            
            XCTAssertNotNil(zawgyiArray, "Zawgyi array is nil.")
            XCTAssertNotNil(uniArray, "Uni array is nil.")
            
            for (index, unicode) in uniArray!.enumerated() {
                let zawgyi = zawgyiArray![index]
                XCTAssertEqual(Rabbit.uni2zg(unicode), zawgyi, "Uni to Zawgyi conversion failed at index \(index)")
            }
        } catch {
            XCTFail("Error parsing JSON: \(error.localizedDescription)")
        }
    }
    
    func testConvertZawgyiToUni() {
        guard let json = json, let data = json.data(using: .utf8) else {
            XCTFail("JSON data not available.")
            return
        }
        
        do {
            let words = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            let zawgyiArray = words?["zg"] as? [String]
            let uniArray = words?["uni"] as? [String]
            
            XCTAssertNotNil(zawgyiArray, "Zawgyi array is nil.")
            XCTAssertNotNil(uniArray, "Uni array is nil.")
            
            for (index, zawgyi) in zawgyiArray!.enumerated() {
                let unicode = uniArray![index]
                XCTAssertEqual(Rabbit.zg2uni(zawgyi), unicode, "Zawgyi to Uni conversion failed at index \(index)")
            }
        } catch {
            XCTFail("Error parsing JSON: \(error.localizedDescription)")
        }
    }
}
