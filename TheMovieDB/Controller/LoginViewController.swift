//
//  LoginViewController.swift
//  TheMovieDB
//
//  Created by Dai Flores on 16/08/22.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblError: UILabel!
    @IBOutlet weak var indicatorActivity: UIActivityIndicatorView!
    
    let objLogin = LoginPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtUsername.placeholder = "Username"
        txtPassword.placeholder = "Password"
        txtPassword.isSecureTextEntry = true
        lblError.textColor = .red
        
        indicatorActivity.isHidden = true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "vcShows"{
            let viewTv = segue.destination as! TVShowsViewController
            viewTv.nameUser = txtUsername.text ?? "error"
        }
    }

    @IBAction func btnLogin(_ sender: Any) {
        
        indicatorActivity.isHidden = false
        indicatorActivity.startAnimating()
        
        
        if let username = txtUsername.text, let passwor = txtPassword.text{
            Auth.auth().signIn(withEmail: username, password: passwor){
                (result, error) in

                if let result = result, error == nil{
                    self.performSegue(withIdentifier: "vcShows", sender: nil)
                    self.indicatorActivity.isHidden = true
                    self.txtPassword.text = ""
                }else{
                    self.lblError.text = "Invalid username ond / or password: You Did not provide a valid login"
                    self.indicatorActivity.isHidden = true
                    self.txtPassword.text = ""
                    self.txtUsername.text = ""
                }
            }
        }
//        
//        if objLogin.authentication(username: txtUsername.text ?? "", password: txtPassword.text ?? "") == true{
//            performSegue(withIdentifier: "vcShows", sender: nil)
//            indicatorActivity.stopAnimating()
//            indicatorActivity.isHidden = true
//        }else{
//            lblError.text = "Invalid username ond / or password: You Did not provide a valid login"
//        }
    }
}
