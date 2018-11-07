//
//  XCTestDemoTests.m
//  XCTestDemoTests
//
//  Created by uwei on 9/21/16.
//  Copyright © 2016 Tencent. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AppDelegate.h"
#import "ViewController.h"
#import "TestAdvanceFunction.m"



@interface XCMyTestCase : XCTestCase<XCTestObservation>
@property BOOL isFinished;
@end

@implementation XCMyTestCase

- (void)setUp {
    [super setUp];
    [[XCTestObservationCenter sharedTestObservationCenter] addTestObserver:self];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testMyMethod0 {
    NSLog(@"----------->%s", __FUNCTION__);
}

- (void)testMyMethod1 {
    NSLog(@"%s", __FUNCTION__);
}

- (void)testMyMethod2 {
    NSLog(@"%s", __FUNCTION__);
}

- (void)testCaseWillStart:(XCTestCase *)testCase {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)testCaseDidFinish:(XCTestCase *)testCase {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

@end

@interface XCMyTestSuite : XCTestSuite<XCTestObservation>

@end

@implementation XCMyTestSuite

- (instancetype)init {
    if (self = [super init]) {
        self = [XCMyTestSuite defaultTestSuite];
        [[XCTestObservationCenter sharedTestObservationCenter] addTestObserver:self];
    }
    return self;
}


- (void)testSuiteWillStart:(XCTestSuite *)testSuite {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)testSuiteDidFinish:(XCTestSuite *)testSuite {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

@end



@interface XCTestDemoTests : XCTestCase<XCTestObservation> {
    
@private
    ViewController *vc;
    
}
@end

@implementation XCTestDemoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ViewController"];
    [[XCTestObservationCenter sharedTestObservationCenter] addTestObserver:self];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
//    XCMyTestSuite *testSuite = [[XCMyTestSuite alloc] init]; // not working
    
    
    
    
//    XCTestSuite *testSuite = [XCTestDemoTests defaultTestSuite]; // ok
    
    // 这个方式可以从测试文件中加载测试case，然后执行。
//    XCTestSuite *testSuite = [TestAdvanceFunction defaultTestSuite]; // ok
//    XCTestSuite *testSuite = [XCTestSuite testSuiteForTestCaseClass:[XCMyTestCase class]]; // ok
    XCTestSuite *testSuite = [XCTestSuite testSuiteForTestCaseWithName:@"XCMyTestCase"]; //ok
    
//    NSString *bPath = [[NSBundle mainBundle] bundlePath];
//    XCTestSuite *testSuite = [XCTestSuite testSuiteForBundlePath:bPath]; // not working
    NSUInteger count = testSuite.tests.count;
    for (int i = 0; i < count; ++i) {
        XCTest *test = testSuite.tests[i];
        NSLog(@"Test method[%d]:%@", i, test.name);
        if (i == 0) {
            //            [test runTest];
            //            [[test testRun] start];
            //            [[test testRun] stop];
            
        }
        
        //            XCTestRun *testRun = [[XCTestRun alloc] initWithTest:test];
        XCTestRun *testRun = [XCTestRun testRunWithTest:test];
        
//        [testRun start]; // not working
        [test performTest:testRun];
        if (testRun.hasSucceeded) {
            NSLog(@"OK");
        } else {
            NSLog(@"NO");
        }
    }
}

- (void)testMethod {
    NSLog(@"%s", __FUNCTION__);
}

- (void)testA {
    NSLog(@"%s", __FUNCTION__);
}

- (void)testZ {
    NSLog(@"%s", __FUNCTION__);
}

- (void)testBundle {
    NSString *file = [[NSBundle mainBundle] pathForResource:@"bundle" ofType:@"plist"];
    NSDictionary *data = [NSDictionary dictionaryWithContentsOfFile:file];
    NSLog(@"[Test] bundle data: %@", data);
}

- (void)testCaseWillStart:(XCTestCase *)testCase {
    NSLog(@"%s", __FUNCTION__);
}

- (void)testCaseDidFinish:(XCTestCase *)testCase {
    NSLog(@"%s", __FUNCTION__);
}

@end
