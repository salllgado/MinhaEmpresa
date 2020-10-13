//
//  MinhaEmpresaUITests.swift
//  MinhaEmpresaUITests
//
//  Created by Chrystian on 13/10/20.
//  Copyright © 2020 Chrystian Salgado. All rights reserved.
//

import XCTest

class MinhaEmpresaUITests: XCTestCase {

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()

        XCTAssertTrue(app.buttons["Continuar"].exists)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
