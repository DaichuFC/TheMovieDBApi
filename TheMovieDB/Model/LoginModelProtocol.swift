//
//  LoginModelProtocol.swift
//  TheMovieDB
//
//  Created by Dai Flores on 16/08/22.
//

import Foundation

protocol LoginModelProtocol{
    func authentication(username: String, password: String) -> Bool
}
