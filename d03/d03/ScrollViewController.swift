//
//  ScrollViewController.swift
//  d03
//
//  Created by Jeremy SCHOTTE on 1/11/18.
//  Copyright © 2018 Jeremy SCHOTTE. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    var imageView : UIImageView?
    var image : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        imageView = UIImageView(image: image)
        scrollView.addSubview(imageView!)
        scrollView.contentSize = (imageView?.frame.size)!
        scrollView.minimumZoomScale = 0
        scrollView.maximumZoomScale = 100
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat)
    {
        updateZoom()
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func updateZoom()
    {
        if (UIApplication.shared.statusBarOrientation.isPortrait)
        {
            self.scrollView.minimumZoomScale = min(self.scrollView.bounds.size.width / (imageView?.image?.size.width)!, self.scrollView.bounds.size.height / (imageView?.image?.size.height)!);
        
            if (self.scrollView.zoomScale < self.scrollView.minimumZoomScale)
            {
                self.scrollView.zoomScale = self.scrollView.minimumZoomScale;
            }
        }
        else
        {
            self.scrollView.minimumZoomScale = max(self.scrollView.bounds.size.width / (imageView?.image?.size.width)!, self.scrollView.bounds.size.height / (imageView?.image?.size.height)!);
            if (self.scrollView.zoomScale < self.scrollView.minimumZoomScale)
            {
                self.scrollView.zoomScale = self.scrollView.minimumZoomScale;
            }
        }
    }
    
    func didRotateFromInterfaceOrientation(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator)
    {
        updateZoom()
    }
    
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        updateZoom()

    }
}
