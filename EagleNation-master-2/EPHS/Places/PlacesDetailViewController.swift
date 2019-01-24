//
//  PlacesDetailViewController.swift
//  EPHS
//
//  Created by Jennifer Nelson on 12/19/18.
//  Copyright © 2018 EPHS. All rights reserved.
//

import Foundation
import UIKit

class PlacesDetailViewController: UIViewController {
    
    var selection: String!
    var selectedLocation: PlacesModel?
    
    @IBOutlet weak var locationImageView:
    
    
    UIImageView!
    @IBOutlet weak var placesNameLabel: UILabel!
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var directionsLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func viewDidLoad() {
        print("Here")
        super.viewDidLoad()
        
        
        placesNameLabel.text = selectedLocation?.name
        informationLabel.text = selectedLocation?.information
        directionsLabel.text = selectedLocation?.directions
        subtitleLabel.text = selectedLocation?.subtitle
       // let currentImage = selectedLocation?.id + ".jpg"
        // need to fix this part
        locationImageView.image = UIImage(named: ".jpg")
        
        if let theImage = selectedLocation?.id {
            locationImageView.image = UIImage(named: theImage + "x.jpg")
            locationImageView.clipsToBounds = true
        }
        
        
    }
    
    
    
    
    
    
    
}
