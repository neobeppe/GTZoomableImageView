/**
 *  GTZoomableImageView
 *
 *  Copyright (c) 2016 Giuseppe Travasoni. Licensed under the MIT license, as follows:
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in all
 *  copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 *  SOFTWARE.
 */

import Foundation
import XCTest
@testable import GTZoomableImageView

class GTZoomableImageViewTests: XCTestCase {
    
    var zoomableImageView: GTZoomableImageView?
    
    override func setUp() {
        super.setUp()
        zoomableImageView = GTZoomableImageView(frame: UIScreen.main.bounds)
        guard let zoomableImageView = zoomableImageView else {
            XCTFail("view is nil")
            return
        }
        zoomableImageView.setup()
    }
    
    func testInit() {
        guard let zoomableImageView = zoomableImageView else {
            XCTFail("view is nil")
            return
        }
        zoomableImageView.layoutSubviews()
        XCTAssert(zoomableImageView.frame == UIScreen.main.bounds, "Incorrect frame")
    }
    
    func testZoomIn() {
        guard let zoomableImageView = zoomableImageView else {
            XCTFail("view is nil")
            return
        }
        zoomableImageView.zoomIn(point: CGPoint(x: 0, y: 0), scale: 3.0, animated: false)
        XCTAssert(zoomableImageView.isZoomed(), "Should be zoomed")
    }
    
    func testZoomOut() {
        guard let zoomableImageView = zoomableImageView else {
            XCTFail("view is nil")
            return
        }
        zoomableImageView.zoomOut()
        XCTAssert(!zoomableImageView.isZoomed(), "Should be not zoomed")
    }
    
    func testAutoZoom() {
        guard let zoomableImageView = zoomableImageView else {
            XCTFail("view is nil")
            return
        }
        let doubleTap = UITapGestureRecognizer()
        zoomableImageView.autoZoom(gesture: doubleTap)
        XCTAssert(zoomableImageView.isZoomed(), "Should be zoomed")
        zoomableImageView.autoZoom(gesture: doubleTap)
        XCTAssert(!zoomableImageView.isZoomed(), "Should be not zoomed")
        
    }
    
    func testNilImage() {
        guard let zoomableImageView = zoomableImageView else {
            XCTFail("view is nil")
            return
        }
        zoomableImageView.image = nil
        XCTAssertNil(zoomableImageView.image, "Image should now be nil")
        
        zoomableImageView.setup(image: UIImage())
        XCTAssertNotNil(zoomableImageView.image, "Image should now be not nil")
    }
    
    func testInitWithCoder() {
        let archiverData = Data()
        let archiver = NSKeyedUnarchiver(forReadingWith: archiverData)
        let zoomableImageViewWithCoder = GTZoomableImageView(coder: archiver)
        XCTAssertNotNil(zoomableImageViewWithCoder, "GTZoomableImageView should be initialized")
    }
}
