//
//  UserCell.swift
//  practice API using MVVM
//
//  Created by Deeksha Sharma on 05/04/22.
//

import UIKit

class UserCell: UITableViewCell {

    var modelUser : UserModel?
    
    //MARK : - Outlets
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func userConfiguration () {
        let status = modelUser?.getStatusAndColour()
        lblStatus.text = status?.0
        backgroundColor = status?.1
        lblId.text = "\(modelUser?.id ?? 0)"
        lblTitle.text = modelUser?.title
    }
    
}
