//
//  UserModel.swift
//  practice API using MVVM
//
//  Created by Deeksha Sharma on 05/04/22.
//

import Foundation
import  UIKit

struct UserModel : Codable {
    let userId : Int?
    let id : Int?
    let title : String?
    let completed : Bool?

    enum CodingKeys: String, CodingKey {

        case userId = "userId"
        case id = "id"
        case title = "title"
        case completed = "completed"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        userId = try values.decodeIfPresent(Int.self, forKey: .userId)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        completed = try values.decodeIfPresent(Bool.self, forKey: .completed)
    }
    
    func getStatusAndColour () -> (String , UIColor) {
        if completed ?? true {
            return ("completed" , UIColor.red)
        } else {
            return ("not completed" , UIColor.green)
        }
    }

}
