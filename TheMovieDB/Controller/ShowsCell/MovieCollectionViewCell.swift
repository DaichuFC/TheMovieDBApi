//
//  MovieCollectionViewCell.swift
//  TheMovieDB
//
//  Created by Dai Flores on 17/08/22.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblRated: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    @IBOutlet weak var viewCell: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        lblName.textColor = .green
        lblDate.textColor = .green
        lblRated.textColor = .green
        lblDescription.textColor = .white
        viewCell.layer.borderWidth = 2
        viewCell.layer.cornerRadius = 25.0
    }
    
    func outInfo(data: Result){
        
        lblName.text = data.title
        lblDate.text = data.releaseDate
        lblRated.text = "⭐️\(data.voteAverage)"
        lblDescription.text = data.overview
        
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://image.tmdb.org/t/p/w342/\(data.posterPath)")!)){
            (data, req, error) in
            
            do{
                let dataIm = try data
                DispatchQueue.main.async {
                    self.myImage.image = UIImage(data: dataIm!)
                }
            }catch{
                
            }
        }.resume()
    }
    
}
