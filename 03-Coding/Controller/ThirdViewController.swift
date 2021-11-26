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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowFontsForFamily"{
            let destinationViewController = segue.destination as! FontDetailViewController
            let idx = self.tableView.indexPathForSelectedRow!.row // Constante para saber cual fila es seleccionada
            destinationViewController.familyName = self.families[idx]
            destinationViewController.fonts = self.fonts[self.families[idx]]!
            
        }
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
        let fontFamily = families[indexPath.row]
        cell.textLabel?.text = fontFamily
        cell.textLabel?.font = UIFont(name: fontFamily, size: 18.0)
        return cell
    }
    
    // MARK: - Métodos del protocolo UIViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let fontFamily = families[row]
        let familyFonts = fonts[fontFamily]!
        print(fontFamily)
        print(familyFonts as Any)
    }
}
