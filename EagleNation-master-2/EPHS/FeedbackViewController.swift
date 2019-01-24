//
//  FeedbackViewController.swift
//  EPHS
//
//  Created by Jennifer Nelson on 1/9/19.
//  Copyright © 2019 EPHS. All rights reserved.
//

import UIKit
import MapKit
import WebKit

class FeedbackViewController: UIViewController {

  
    @IBOutlet weak var webView: WKWebView!
    
    var url:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        url = "https://docs.google.com/forms/d/e/1FAIpQLSdU8-rXChdvsbqNAf4FXOxow4iJJEYXUcsUaCuJJGwNvGAZ0w/viewform"
        
        webView.load(URLRequest(url: URL(string: self.url!)!))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
}
