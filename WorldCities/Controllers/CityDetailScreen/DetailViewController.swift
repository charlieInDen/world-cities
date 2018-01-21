//
//  DetailViewController.swift
//  TestApp
//
//  Created by Nishant Sharma on 1/20/18.
//  Copyright © 2018 Nishant. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    var cityDetail:City?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Below function show details of city
        self.updateCityDetails()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func updateCityDetails(){
        //City, Country, Population, Latitude & Longitude
        self.descriptionLabel.text = """
        Country: \(cityDetail?.country ?? "")
        City: \(cityDetail?.city ?? "")
        Population: \(cityDetail?.population ?? "0")
        Latitude: \(cityDetail?.latitude ?? "")
        Longitude: \(cityDetail?.longitude ?? "")
        """
    }
}




