//
//  XCTestDemoUITests.m
//  XCTestDemoUITests
//
//  Created by uwei on 9/21/16.
//  Copyright © 2016 Tencent. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AppDelegate.h"
#import "ViewController.h"


// 启动测试的命令行, 关于destination的参数部分，都是使用key-value,每哥key pair之间不能有空格
// xcodebuild test -project XCTestDemo.xcodeproj -scheme XCTestDemo -destination 'platform=iOS Simulator,OS=10.0,name=iPhone 7 Plus'
@interface XCTestDemoUITests : XCTestCase {
    @private
    ViewController *vc;
}
@end

@implementation XCTestDemoUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];
    
//    [[XCUIApplication new] terminate];
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    
    // suggest this part to be added into unit test
//    XCTestSuite *testSuite = [XCTestDemoUITests defaultTestSuite];
//    NSUInteger count = testSuite.tests.count;
//    for (int i = 0; i < count; ++i) {
//        XCTest *test = testSuite.tests[i];
//        NSLog(@"Test case count:%ld", test.testCaseCount);
//        NSLog(@"Test name:%@", test.name);
//        if (i == 1) {
//            XCTestRun *testRun = [[XCTestRun alloc] initWithTest:test];
//            // run loop never out
//            [test performTest:testRun];
//            if (testRun.hasSucceeded) {
//                NSLog(@"OK");
//            } else {
//                NSLog(@"NO");
//            }
//        }
//    }
//
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    
    // type query provider
    XCUIElementQuery *buttonQuery = app.buttons;
    
    
    
    NSLog(@"button count : %ld", buttonQuery.count);
    
    XCUIElement *button1 = [buttonQuery elementBoundByIndex:0];
    
    [button1 tap];
    
    XCUIElementQuery *textFieldQuery = app.textFields;
    NSLog(@"textField count : %ld", textFieldQuery.count);
    
    // 此处存在错误，就是XCUIElementQuery如果被new出来，这个实例没有跟任何的app instance关联，也就不知道在哪里找UI element
//    XCUIElementQuery *typeQuery = [[[XCUIElementQuery alloc] init] childrenMatchingType:(XCUIElementTypeTextField)];
    
    NSLog(@"app elements count = %ld", app.otherElements.count);
    
    
    for (int i = 0; i < app.otherElements.count; i++) {
        XCUIElement *element = [app.otherElements elementBoundByIndex:i];
        NSLog(@"Element type = %ld", element.elementType);
    }
    
    
//    rather than calling [query descendantsMatchingType: XCUIElementTypeButton], you can use the buttons property from the protocol to retrieve query.buttons
    XCUIElementQuery *buttonTypeQuery = [app.otherElements childrenMatchingType:(XCUIElementTypeButton)];
    NSLog(@"buttonTypeQuery count:%ld", buttonTypeQuery.count);
    for (int i = 0; i < buttonTypeQuery.count; i++) {
        XCUIElement *button = [buttonTypeQuery elementBoundByIndex:i];
        NSLog(@"Button id = %@", button.identifier);
    }
//    childrenMatchingType
//    Get number of matches for: Children matching type Button
//    Find: Descendants matching type Other
//    Find: Children matching type Button
    
    
    
//    XCUIElementQuery *typeQuery = [app.otherElements childrenMatchingType:(XCUIElementTypeTextField)];
    XCUIElementQuery *textFieldTypeQuery = [app.otherElements descendantsMatchingType:(XCUIElementTypeTextField)];
    NSLog(@"typeQuery count:%ld", textFieldTypeQuery.count);
    for (int i = 0; i < textFieldTypeQuery.count; i++) {
        XCUIElement *textField = [textFieldTypeQuery elementBoundByIndex:i];
        NSLog(@"TextField id = %@", textField.identifier);
    }
//    descendantsMatchingType
//    Get number of matches for: Descendants matching type TextField
//    Find: Descendants matching type Other
//    Find: Descendants matching type TextField
    
    
// 存在问题
    XCUIElementQuery *elementIDQuery = [app.otherElements containingType:XCUIElementTypeSwitch identifier:@"switch"];
//    XCUIElementQuery *textFieldIDQuery = [app.otherElements matchingPredicate:[NSPredicate predicateWithFormat:@"'password' IN identifiers"]];
    NSLog(@"elementIDQuery count:%ld", elementIDQuery.count);
    for (int i = 0; i < elementIDQuery.count; i++) {
        XCUIElement *element = [elementIDQuery elementBoundByIndex:i];
        NSLog(@"element id = %@", element.identifier);
//        [element tap];
    }
    
    
    XCUIElement *usernameTextField = [textFieldTypeQuery elementBoundByIndex:0];
    [usernameTextField tap];
    [usernameTextField typeText:@"what a name"];
    
//    XCUIElement *button2 = [buttonQuery elementAtIndex:1];
    // TODO:how to use predicate
    // 通过identifier的谓词，从buttons中锁定某一button
    XCUIElement *button2 = [buttonQuery elementMatchingPredicate:[NSPredicate predicateWithFormat:@"'Login' in identifiers"]];
    [button2 tap];
    
}


- (void)testEmptyNameAndPassword {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    
    // XCode检索控件的方法
    //    XCUIElement *textField = [[[[[[app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@"Login"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:0];
    
    // 1. 在identity inspector 中 Accessibility 面板中为控件添加identifier，然后在此处就可以使用这个identifier检索控件
//    [app.buttons[@"userLogin"] tap];
    // 2. 使用button的title作为key检索button
    [app.buttons[@"Login"] tap];
    
    [app.alerts[@"Error"].buttons[@"OK"] tap];
}


/**
 测试完整的登录事件
 */
- (void)testLoginOK {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *usernameTextField = app.textFields[@"userName"];
    [usernameTextField tap];
    [usernameTextField typeText:@"name"];

    
    XCUIElement *passwordTextField = app.textFields[@"password"];
    [passwordTextField tap];
    [passwordTextField typeText:@"password"];
    
    XCUIElement *loginButton = app.buttons[@"Login"];
    [loginButton tap];
    [app.navigationBars[@"SigninView"].buttons[@"Login"] tap];
    
    
}


- (void)testSwitchAndCount {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *switch2 = app.switches[@"0"];
    [switch2 tap];
    
    XCUIElement *timeLabel = app.staticTexts[@"timesLabel"];
    NSString *count = timeLabel.label;
    XCTAssertTrue(count.integerValue > 0, @"count > 0");
    
    XCUIElement *switch3 = app.switches[@"1"];
    [switch3 tap];
    [switch2 tap];
    [switch3 tap];
    [switch2 tap];
    [app.navigationBars[@"SigninView"].buttons[@"Login"] tap];
    
}


- (void)testSwitchWithID {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *switch2 = app.switches[@"switch"];
    [switch2 tap];
    [switch2 tap];
    [app.navigationBars[@"SigninView"].buttons[@"Login"] tap];
    
}

- (void)testMyButtonEvent {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"MButton"] tap];
    NSLog(@"button frame:(%f,%f,%f,%f)", app.buttons[@"MButton"].frame.origin.x,app.buttons[@"MButton"].frame.origin.y, app.buttons[@"MButton"].frame.size.width, app.buttons[@"MButton"].frame.size.height);
}

- (void)testPressDeviceButton {
    XCUIDevice *device = [XCUIDevice sharedDevice];
    NSLog(@"Device orientaion:%ld", device.orientation);
    
#if TARGET_OS_SIMULATOR
#else
    int x = 0;
    while (x < 100) {
        
        [device pressButton:XCUIDeviceButtonVolumeUp];
        [device pressButton:XCUIDeviceButtonVolumeDown];
        ++x;
    }
#endif
    
    [device pressButton:XCUIDeviceButtonHome];
    
    
    
}

- (void)testSubViewButton {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"SubButton"] tap];
    
    XCUIElement *passwordTextField = app.textFields[@"password"];
    [passwordTextField tap];
    [passwordTextField typeText:@"pass"];
    [app.buttons[@"Login"] tap];
    [app.alerts[@"Error"].buttons[@"OK"] tap];
}

- (void)testCoordinate {
//    XCUIApplication *app = [[XCUIApplication alloc] init];
//    XCUIElement *myScroll = app.scrollViews[@"MyScrollView"];
//    
//    XCUICoordinate *start = [myScroll coordinateWithNormalizedOffset:CGVectorMake(0, 64)];
//    XCUICoordinate *end = [myScroll coordinateWithNormalizedOffset:CGVectorMake(0, 124)];
//    [start pressForDuration:0.1 thenDragToCoordinate:end];

    
    XCUIElement *myscrollviewScrollView = [[XCUIApplication alloc] init].scrollViews[@"MyScrollView"];
    [myscrollviewScrollView swipeUp];
    [myscrollviewScrollView pressForDuration:1.4];
    [myscrollviewScrollView swipeLeft];
    [myscrollviewScrollView swipeUp];
    [myscrollviewScrollView tap];
    [myscrollviewScrollView pressForDuration:0.6];
    [myscrollviewScrollView pressForDuration:2.1];
    [myscrollviewScrollView tap];
    [myscrollviewScrollView swipeUp];
    [myscrollviewScrollView swipeUp];
    [myscrollviewScrollView swipeDown];
    
}

- (void)testTableView {
    
    XCUIElementQuery *tablesQuery = [[XCUIApplication alloc] init].tables;
    [tablesQuery.staticTexts[@"1"] swipeUp];
    XCUIElement *staticText1 = tablesQuery.staticTexts[@"2"];
    [staticText1 swipeUp];
    [staticText1 swipeDown];
    [staticText1 swipeUp];
    [staticText1 swipeDown];
    
    
    // 手势距离固定
    XCUICoordinate *start = [tablesQuery.staticTexts[@"1"] coordinateWithNormalizedOffset:CGVectorMake(0, 0)];
    XCUICoordinate *end = [tablesQuery.staticTexts[@"1"] coordinateWithNormalizedOffset:CGVectorMake(0, 10)];
    [start pressForDuration:3 thenDragToCoordinate:end];
    
    
    XCUIElement *mytableTable = [[XCUIApplication alloc] init].tables[@"MyTable"];
    
    // UITable中寻找cell的方法就是通过staticTexts，key是cell.labelText.text
    XCUIElement *staticText = mytableTable.staticTexts[@"3"];
    [staticText pressForDuration:2];
    
    // 手势距离不定
    [staticText swipeUp];
    [mytableTable.staticTexts[@"2"] swipeDown];
    
    XCUIElement *staticText2 = [[[[mytableTable.cells containingType:XCUIElementTypeStaticText identifier:@"1"] childrenMatchingType:XCUIElementTypeStaticText] matchingIdentifier:@"1"] elementBoundByIndex:0];
    [staticText2 pressForDuration:2.1];
    [staticText2 swipeDown];
    
}

- (void)testBundle {
    // this code can not access resources in bundle
    NSString *file = [[NSBundle mainBundle] pathForResource:@"bundle" ofType:@"plist"];
    NSDictionary *data = [NSDictionary dictionaryWithContentsOfFile:file];
    NSLog(@"[Test] bundle data: %@", data);
    [[[XCUIApplication alloc] init].scrollViews[@"MyScrollView"] tap];
}

- (void)testAllProcess{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"MButton"] tap];
    [app.textFields[@"userName"] tap];
    [app.textFields[@"userName"] typeText:@"username"];
    
    [app.textFields[@"password"] tap];
    [app.textFields[@"password"] typeText:@"password"];
    
    XCUIElement *loginButton = app.buttons[@"Login"];
    [loginButton tap];
//    [app.buttons[@"Login"] tap];
    
    XCUIElement *switch2 = app.switches[@"switch"];
    [switch2 tap];
    [switch2 tap];
    [app.navigationBars[@"SigninView"].buttons[@"My"] tap];
    [app.buttons[@"SubButton"] tap];
    
}

/**
 定位element的方法，注意：方法体可以为空
 */
- (void)testSubButton1 {
    // if element property isAccessibilityElement is YES, identifier previllage is top then the label, then the staticText, last is MatchingType:
    [[[XCUIApplication alloc] init].buttons[@"Button111"] tap];
    XCUIElement *button11Button = [[XCUIApplication alloc] init].buttons[@"Button11"];
    [button11Button tap];
    [[[XCUIApplication alloc] init].buttons[@"Button1"] tap];
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[[[[[[app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@"Login"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeButton] elementBoundByIndex:1] tap];
    
//    otherwise title staticText is top,then ccessablitityIdentifier, then accessablitityLabel, then matchType:
//    [[[XCUIApplication alloc] init].staticTexts[@"Button1"] tap];
//    [[[XCUIApplication alloc] init].buttons[@"Button111"] tap];
//    [[[XCUIApplication alloc] init].buttons[@"Button11"] tap];
//    [[[[[[[[[[XCUIApplication alloc] init].otherElements containingType:XCUIElementTypeNavigationBar identifier:@"Login"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeButton] elementBoundByIndex:1] tap];
    
}



@end
