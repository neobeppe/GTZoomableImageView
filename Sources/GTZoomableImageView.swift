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

import UIKit

public final class GTZoomableImageView: UIView {
    
    @IBInspectable public var image: UIImage? {
        didSet {
            imageView.image = image
            setup()
        }
    }
    
    @IBInspectable public var minimumZoomScale: CGFloat = 1.0
    @IBInspectable public var maximumZoomScale: CGFloat = 3.0
    
    internal let imageView = UIImageView()
    private let scrollImg = UIScrollView()
    
    public func setup(image: UIImage) {
        self.image = image
        setup()
    }
    
    override public func layoutSubviews() {
        if !isZoomed() {
            imageView.frame.size = self.frame.size
            scrollImg.frame.size = self.frame.size
        }
    }
    
    public func zoomIn(rect: CGRect, animated: Bool = false) {
        scrollImg.zoom(to: rect, animated: animated)
    }
    
    public func zoomIn(point: CGPoint, scale: CGFloat, animated: Bool = true) {
        let imageZoomRect = frame.size.width / scale
        zoomIn(rect: CGRect(x: point.x - imageZoomRect / 2, y: point.y - imageZoomRect / 2, width: imageZoomRect, height: imageZoomRect), animated: animated)
    }
    
    func zoomOut(animated: Bool = true) {
        self.scrollImg.setZoomScale(minimumZoomScale, animated: animated)
    }
    
    func autoZoom(gesture: UITapGestureRecognizer) {
        if scrollImg.zoomScale > minimumZoomScale {
            zoomOut()
        } else {
            zoomIn(point: gesture.location(in: scrollImg), scale: maximumZoomScale)
        }
    }
    
    internal func setup() {
        contentMode = .scaleAspectFit
        clipsToBounds = true
        isUserInteractionEnabled = true
        
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        imageView.clipsToBounds = false
        imageView.image = image
        
        let vWidth = self.frame.width
        let vHeight = self.frame.height
        
        scrollImg.delegate = self
        scrollImg.frame = CGRect(x: 0, y: 0, width: vWidth, height: vHeight)
        scrollImg.backgroundColor = UIColor.clear
        scrollImg.alwaysBounceVertical = false
        scrollImg.alwaysBounceHorizontal = false
        scrollImg.showsVerticalScrollIndicator = false
        scrollImg.showsHorizontalScrollIndicator = false
        scrollImg.flashScrollIndicators()
        scrollImg.minimumZoomScale = minimumZoomScale
        scrollImg.maximumZoomScale = maximumZoomScale
        scrollImg.clipsToBounds = false
        
        self.addSubview(scrollImg)
        
        scrollImg.addSubview(imageView)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(GTZoomableImageView.autoZoom(gesture:)))
        doubleTap.numberOfTapsRequired = 2
        scrollImg.addGestureRecognizer(doubleTap)
        
    }
    
    internal func isZoomed() -> Bool {
        return scrollImg.zoomScale != scrollImg.minimumZoomScale
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
}

extension GTZoomableImageView: UIScrollViewDelegate {
    
    public func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
}

