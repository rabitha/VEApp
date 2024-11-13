//
//  common.swift
//  VEApp
//
//  Created by Rabitha N. on 13/11/24.
//

import UIKit

class commonMethods : UITableViewCell{   

    func passStatusGetColor(st:String)->String{
        switch st{
        case "idle" : return "orangeColor"
        case "halt" : return "redColor"
        default: return "greenColor"
        }
    }

    func passStatusGetImgName(st:String)->String{
        switch st{
        case "idle" : return "idle"
        case "halt" : return "halt"
        default: return "running"
        }
    }
    
}
