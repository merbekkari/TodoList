//
//  HeadeCell.swift
//  MisterAuto
//
//  Created by mbekkari on 1/5/2022.
//

import UIKit

class HeaderFooterCell: UITableViewHeaderFooterView  {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var labelName: UILabel!
    static var identifier = "HeadeCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    override init(reuseIdentifier: String?) {
           super.init(reuseIdentifier: reuseIdentifier)
       }

       required init?(coder: NSCoder) {
           super.init(coder: coder)
       }
    
}
