//
//  InfoViewController.swift
//  TheMovieDB
//
//  Created by Dai Flores on 17/08/22.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var imagePath: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPopular: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var voteAvera: UILabel!
    @IBOutlet weak var voteCount: UILabel!
    @IBOutlet weak var lblDes: UILabel!
    @IBOutlet weak var imageBackPath: UIImageView!
    @IBOutlet weak var imageProductora: UIImageView!
    
    
    var dataList = [Result]()
    
    var imagenP: String?
    var backPath: String?
    var names: String?
    var popular: Double?
    var descrp: String?
    var dates: String?
    var voteAverage: Double?
    var voteCounts: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagenP = "https://image.tmdb.org/t/p/w342/\(imagenP!)"
        backPath = "https://image.tmdb.org/t/p/w342/\(backPath!)"
        lblName.text = names
        lblPopular.text = "\(popular!)"
        lblDescription.text = dates
        lblDes.text = descrp
        voteAvera.text = "⭐️\(voteAverage!)"
        voteCount.text = "\(voteCounts!)"

//        Poster Path
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: imagenP!)!)){
            (data, req, error) in
            
            do{
                let dataIm = try data
                DispatchQueue.main.async {
                    self.imagePath.image = UIImage(data: dataIm!)
                }
            }catch{
                
            }
        }.resume()
        
//        Backdrop Path
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: backPath!)!)){
            (data, req, error) in
            
            do{
                let dataIm = try data
                DispatchQueue.main.async {
                    self.imageBackPath.image = UIImage(data: dataIm!)
                }
            }catch{
                
            }
        }.resume()
        
//        company Productions
        
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://image.tmdb.org/t/p/w500/wwemzKWzjKYJFfCeiB57q3r4Bcm.png")!)){
            (data, req, error) in
            
            do{
                let dataIm = try data
                DispatchQueue.main.async {
                    self.imageProductora.image = UIImage(data: dataIm!)
                }
            }catch{
                
            }
        }.resume()
        
        
    }
}
