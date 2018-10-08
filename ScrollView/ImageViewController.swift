//
//  ImageViewController.swift
//  ScrollView
//
//  Created by Abdul Basit on 08/10/2018.
//  Copyright © 2018 Abdul Basit. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController , UIScrollViewDelegate{

    var imageURL : URL?
    {
        didSet{
        ImageView.image = nil
            if view.window != nil
            {
            fetchImage()
            }
            
        }
    }
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
                if ImageView.image == nil
                {
                    fetchImage()
                }
                
        
    }
        
        
    
    @IBOutlet weak var ImageView: UIImageView!
    
    
    @IBOutlet weak var ScollView: UIScrollView!
        {
        didSet{
            ScollView.minimumZoomScale=1/25
            ScollView.maximumZoomScale=1.0
            ScollView.delegate=self
            
        }
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return ImageView
    }
    
    func fetchImage()
    {
        if let url = imageURL
        {
            let urlcontent = try? Data(contentsOf: url)
            if let imgData = urlcontent
            {
                ImageView.image = UIImage (data: imgData)
                
                
                
            } 
           
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if imageURL == nil
        {
             imageURL = DemoUrl.ovlImage
        }
    }

}
