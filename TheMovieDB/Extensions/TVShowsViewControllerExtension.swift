//
//  TVShowsViewControllerExtension.swift
//  TheMovieDB
//
//  Created by Dai Flores on 17/08/22.
//

import Foundation
import UIKit

extension TVShowsViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataList.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCelda", for: indexPath) as! ShowsCollectionViewCell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MovieCollectionViewCell
        
        cell.outInfo(data: dataList[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "InfoViewController") as! InfoViewController
        
        vc.names = dataList[indexPath.row].title
        vc.popular = dataList[indexPath.row].popularity
        vc.descrp = dataList[indexPath.row].overview
        vc.dates = dataList[indexPath.row].releaseDate
        vc.voteAverage = dataList[indexPath.row].voteAverage
        vc.voteCounts = dataList[indexPath.row].voteCount
        vc.imagenP = "\(dataList[indexPath.row].posterPath)"
        vc.backPath = "\(dataList[indexPath.row].backdropPath)"

        self.navigationController?.pushViewController(vc, animated: true)
    }


}
