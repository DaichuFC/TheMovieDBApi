//
//  PerfilViewController.swift
//  TheMovieDB
//
//  Created by Dai Flores on 17/08/22.
//

import UIKit

class PerfilViewController: UIViewController {
    
    @IBOutlet weak var lbluserName: UILabel!
    
    var nameUse = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbluserName.text = nameUse
    }
}
