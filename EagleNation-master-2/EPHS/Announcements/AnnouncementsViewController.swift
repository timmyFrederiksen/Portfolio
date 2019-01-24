//
//  FirstViewController.swift
//  EPHS
//
//  Created by Jennifer Nelson on 12/19/18.
//  Copyright © 2018 EPHS. All rights reserved.
//

import UIKit

class AnnouncementsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, HomeModelProtocol{
    
    var feedItems: NSArray = NSArray()
    var selectedLocation: AnnouncementsModel = AnnouncementsModel()
    @IBOutlet weak var announcementsTitleCV: UICollectionView!
    
    //this variable allows the VC to know it should recognize a refresh-style swipe from the user.
    var refresher: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.announcementsTitleCV.delegate = self
        self.announcementsTitleCV.dataSource = self
        
        let homeModel = HomeModel()
        homeModel.delegate = self
        homeModel.downloadItems()
        
        //refresh swipe code, setup for the action
        self.refresher = UIRefreshControl()
        self.announcementsTitleCV!.alwaysBounceVertical = true
        self.refresher.tintColor = UIColor.blue
        self.refresher.addTarget(self, action: #selector(loadData), for: .valueChanged)
        self.announcementsTitleCV!.addSubview(refresher)
    }
    
    @objc func loadData() {
        
        //this is the code that executes when the user swipes to refresh
        //it is taken from viewDidLoad above the refresh setup
        //basically tells the page to reload everything, as if the app restarted.
        let homeModel = HomeModel()
        homeModel.delegate = self
        homeModel.downloadItems()
        stopRefresher()
    }
    
    func stopRefresher() {
        //stops the page from forever having a refresh icon loading
        self.refresher.endRefreshing()
    }
    
    func itemsDownloaded(items: NSArray) {
        
        feedItems = items
        self.announcementsTitleCV.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.feedItems.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier: String = "announcementsFirstCell"
        let myCell: announcmentsCollectionViewCell = announcementsTitleCV.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath as IndexPath) as! announcmentsCollectionViewCell
        let item: AnnouncementsModel = feedItems[indexPath.row] as! AnnouncementsModel
        myCell.firstLabel.text = item.title
        //  print (item.id)
        //  print(item.name)
        return myCell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedLocation = (feedItems[indexPath.row] as! AnnouncementsModel)
        performSegue(withIdentifier: "announcementSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! AnnouncementsDetailViewController
        detailVC.selectedLocation = selectedLocation
    }
    
}
