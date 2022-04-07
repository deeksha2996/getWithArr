//
//  UserViewModel.swift
//  practice API using MVVM
//
//  Created by Deeksha Sharma on 05/04/22.
//

import Foundation

class UserViewModel {
    
    weak var vc : ViewController?
    var arrUser = [UserModel]()
    
    
    func getAllUserData(){
        URLSession.shared.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/todos/")!) { (data, response, error) in
            if error == nil{
                if let data = data {
                    do{
                        let userResponse = try JSONDecoder().decode([UserModel].self, from: data)
                        self.arrUser.append(contentsOf: userResponse)
                        print(self.arrUser)
                        DispatchQueue.main.async{
                            self.vc?.tblView.reloadData()
                        }
                    }catch let err{
                        print(err.localizedDescription)
                    }
                }
            }else{
                print(error?.localizedDescription)
            }
        }.resume()
    }
    
}
