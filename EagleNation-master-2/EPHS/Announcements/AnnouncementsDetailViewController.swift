//
//  AnnouncementsDetailViewController.swift
//  EPHS
//
//  Created by Jennifer Nelson on 12/21/18.
//  Copyright © 2018 EPHS. All rights reserved.
//

import UIKit

class AnnouncementsDetailViewController: UIViewController {
    
    var selectedLocation : AnnouncementsModel?
    @IBOutlet weak var announcementTitle: UILabel!
    @IBOutlet weak var announcementContent: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        announcementTitle.text = selectedLocation?.title
        announcementContent.text = selectedLocation?.content
        announcementContent.layer.cornerRadius = 10
        announcementTitle.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    
    @IBAction func shareAction(_ sender: UIBarButtonItem) {
        let activityVC = UIActivityViewController(activityItems: [ selectedLocation?.content as Any], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        
        self.present(activityVC, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
