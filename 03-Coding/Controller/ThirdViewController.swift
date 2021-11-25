//
//  ThirdViewController.swift
//  03-Coding
//
//  Created by David Viloria Ortega on 19/11/21.
//  Copyright © 2021 David Viloria Ortega. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    
    var families: [String] = []
    var fonts: [String : [String]] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        families = UIFont.familyNames
        for family in families {
            fonts[family] = UIFont.fontNames(forFamilyName: family)
        }

        // Do any additional setup after loading the view.
    }
    
}
