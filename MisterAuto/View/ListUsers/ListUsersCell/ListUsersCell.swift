//
//  ListUsersCell.swift
//  MisterAuto
//
//  Created by mbekkari on 1/5/2022.
//

import UIKit

class ListUsersCell: UITableViewCell {
  
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelUserName: UILabel!
    public static var height:CGFloat = 60
    public static var identifiant = "ListUsersCell"
    var item: Users? {
        didSet{
            self.loadData()
        }
    }
    
  
    
    func loadData(){
        labelName.text = item?.name
        labelEmail.text = item?.email
        labelUserName.text = item?.username
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
  
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
