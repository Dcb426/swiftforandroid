//
//  DetailViewController.swift
//  swiftforandroid
//
//  Created by Darius Bell on 3/9/18.
//  Copyright © 2018 Darius Bell. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var witle: UILabel!
    @IBOutlet weak var yStart: UILabel!
    @IBOutlet weak var format: UILabel!
    @IBOutlet weak var studnet: UILabel!
    @IBOutlet weak var ep: UILabel!
    @IBOutlet weak var castcss: UIButton!
    @IBOutlet weak var summary: UILabel!
    @IBOutlet weak var desc: UILabel!
    

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = self.witle {
                label.text = detail.name
            }
            if let label = self.yStart {
                label.text = detail.yearStart + "-" + detail.yearEnd!
            }
            if let label = self.format {
                label.text = detail.format
            }
            if let label = self.studnet {
                label.text = detail.studio! + "/" + detail.network!
            }
            if let label = self.ep {
                label.text = "Episodes: " + String(detail.episodes)
            }
            if let label = self.castcss {
                label.tintColor = UIColor.red
            }
            if let label = self.summary {
                label.text = detail.showSummary
            }
            if let label = self.desc {
                label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: DataObject? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

