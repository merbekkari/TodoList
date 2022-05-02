//
//  ListTachesUserCell.swift
//  MisterAuto
//
//  Created by mbekkari on 1/5/2022.
//

import UIKit
public enum Status:String{
    case statusCompleted = "complétée"
    case statusNoCompletd = "Non complétée"
    var value : String {
        return self.rawValue
    }
  
}

class ListTachesUserCell: UITableViewCell {
    static var identifiant = "ListTachesUserCell"
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var iconStatus: UIImageView!
    
    var statusTache:Status?
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var item : listTachesUser? {
        didSet{
            self.stupeDate()
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
 
    private func stupeDate(){
        self.title.text = item?.title
        self.status.text =  item?.completed == true ? Status.statusCompleted.value : Status.statusNoCompletd.value
        self.iconStatus.image =  item?.completed == true ? UIImage(named: "Completed") : UIImage(named: "noCompleted")
        
    }
}
