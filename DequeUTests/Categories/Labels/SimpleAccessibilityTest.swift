import XCTest
import A11yAnalysisFramework

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
        let view = viewController.view!;
        viewController.viewDidLoad();

        A11yAssert.that(view)
            .exceptRule(RuleActiveControls.self)
            .isAccessible();
    }
}
