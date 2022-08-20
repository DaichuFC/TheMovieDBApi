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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
