//
//  WCTableViewCell.swift
//  TestApp
//
//  Created by Nishant Sharma on 1/20/18.
//  Copyright © 2018 Nishant. All rights reserved.
//

import UIKit
class WCTableViewCell: UITableViewCell {
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!

    func updateWithInfo(modelObj:City){
        self.cityLabel.text = modelObj.city.capitalized
        self.populationLabel.text = modelObj.population
    }
}

