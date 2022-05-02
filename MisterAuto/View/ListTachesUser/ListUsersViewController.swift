//
//  ViewController.swift
//  MisterAuto
//
//  Created by mbekkari on 1/5/2022.
//

import UIKit

class ListUsersViewController: UIViewController {
 
 
    @IBOutlet weak var navItem: UINavigationItem!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var noDataLabel: UILabel!{
        didSet{
            if let noDataLabel = noDataLabel {
                noDataLabel.text = messageError
            }
            
        }
    }
    var messageError:String?
    

    
    var item = [listTachesUser]() {
        didSet{
        
            if let tableView = tableView {
                    tableView.reloadData()
                self.noDataLabel.isHidden = self.item.isNotEmpty()
                      }
            
          
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureItemNavigation()
        configureTableView()
 
    }
    
    private func configureTableView(){
        self.tableView.register(UINib(nibName: ListTachesUserCell.identifiant, bundle: nil), forCellReuseIdentifier: ListTachesUserCell.identifiant)
        let nib = UINib(nibName: HeaderFooterCell.identifier, bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: HeaderFooterCell.identifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    private func configureItemNavigation(){
        let image: UIImage = UIImage(named: "logo.png")!
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        self.navigationItem.titleView = imageView
  
    
    }
    
    

    func reloadData(idUser:Int) {
         ListTacheUsersPresenter().getListTacheByIdUser(id: idUser) { users, success, error in
             
             if success == true {
             guard let users = users  else {
             return
             }
                 
             self.item = users
                 return
             }
             self.messageError = error
          
         }
    }
    
    

}

extension ListUsersViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListTachesUserCell.identifiant, for: indexPath) as! ListTachesUserCell
        cell.item = self.item[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ListUsersCell.height
    }
 
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderFooterCell.identifier)  as! HeaderFooterCell
        view.labelEmail.isHidden = true
        view.userNameLabel.text = "Titre"
        view.labelName.text = "l’état d’avancement"
        return view
    }
}
