//
//  ViewController.swift
//  practice API using MVVM
//
//  Created by Deeksha Sharma on 05/04/22.
//

import UIKit

class ViewController: UIViewController {

    
    var viewModelUse = UserViewModel()
    
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModelUse.vc = self
        viewModelUse.getAllUserData()
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModelUse.arrUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell
        print("user array is \(viewModelUse.arrUser.count)")
        let modelUser = viewModelUse.arrUser[indexPath.row]
        cell?.modelUser = modelUser
        cell?.userConfiguration()
        return cell!
        
    }
    
    
}
