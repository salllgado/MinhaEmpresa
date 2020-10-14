//
//  MinhaEmpresaUITests.swift
//  MinhaEmpresaUITests
//
//  Created by Chrystian on 13/10/20.
//  Copyright © 2020 Chrystian Salgado. All rights reserved.
//

import XCTest

class MinhaEmpresaUITests: XCTestCase {

    func testInitialView() {
        let app = XCUIApplication()
        app.launch()

        XCTAssertTrue(app.staticTexts["Sua Empresa"].exists)
        XCTAssertTrue(app.textFields["CNPJ"].exists)
        XCTAssertTrue(app.buttons["Continuar"].exists)
        XCTAssertTrue(app.buttons["Continuar"].isHittable)
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
