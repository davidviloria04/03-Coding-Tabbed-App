//
//  ThirdViewController.swift
//  03-Coding
//
//  Created by David Viloria Ortega on 19/11/21.
//  Copyright © 2021 David Viloria Ortega. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
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
    
    // MARK: - Métodos del protocolo UIViewDataSource
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.families.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "FontFamilyCell", for: indexPath)
        cell.textLabel?.text = families[indexPath.row]
        return cell
    }
    
}
