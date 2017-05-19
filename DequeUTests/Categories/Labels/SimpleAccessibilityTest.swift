import XCTest
//import Attest

class SimpleAccessibilityTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testAccessibility(){

        let storyboard: UIStoryboard = UIStoryboard(name: "Storyboard", bundle: nil);
        let viewController = storyboard.instantiateViewController(withIdentifier: "brokenLabel");

        //viewController.view.forceLoad()

        //Attest.that(viewController: viewController).isAccessible()
    }
}
