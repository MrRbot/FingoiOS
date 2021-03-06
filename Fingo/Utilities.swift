//
//  Utilities.swift
//  Fingo
//
//  Created by Javier on 27/03/17.
//  Copyright © 2017 MrRobot. All rights reserved.
//

import Foundation

typealias completion = ()->()
protocol ItemTappedDelegate {
    func unicornTapped()
    func itemTapped(index: Int)
    func itemTappedToDeSelect(index:Int)
}
