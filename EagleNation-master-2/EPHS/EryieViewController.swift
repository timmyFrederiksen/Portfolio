//
//  EryieViewController.swift
//  EPHS
//
//  Created by Jennifer Nelson on 12/19/18.
//  Copyright © 2018 EPHS. All rights reserved.
//


import UIKit
import MapKit
import WebKit

class EryieViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    var url:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        url = "https://theeyrie.org"

        webView.load(URLRequest(url: URL(string: self.url!)!))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
}
