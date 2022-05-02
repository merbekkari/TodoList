//
//  ListUsersViewController.swift
//  MisterAuto
//
//  Created by mbekkari on 1/5/2022.
//

import UIKit
//ListUsersViewController
class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var noDataLabel: UILabel!
    
    var message:String?{
        didSet{
            noDataLabel.text = message
        }
    }
    
    var item = [Users](){
        didSet{
            self.tableView.reloadData()
            self.noDataLabel.isHidden = self.item.isNotEmpty()
          
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureTableView()
        self.reloadData()
    }
    
    func configureTableView(){
        self.tableView.register(UINib(nibName: ListUsersCell.identifiant, bundle: nil), forCellReuseIdentifier: ListUsersCell.identifiant)
        let nib = UINib(nibName: HeaderFooterCell.identifier, bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: HeaderFooterCell.identifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    private func reloadData(){
        ListUsersPresenter().getListUsers { users, success, error in
            
            if success == true {

            guard let users = users  else {
            return
            }
            self.item = users
                return
            }
            self.message = error
            
            
        }

    }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListUsersCell.identifiant, for: indexPath) as! ListUsersCell
        cell.item = self.item[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ListUsersCell.height
    }

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

            guard let controller = AppNavigations.getController(storyboardName: AppController.ListUsers.name) as? ListUsersViewController else {return}
            
            guard let listUserId = self.item[indexPath.row].id else{return}
            controller.reloadData(idUser: listUserId)
            navigationController?.pushViewController(controller, animated: true)
        }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderFooterCell.identifier)  as! HeaderFooterCell
        view.labelName.text = "Nom"
        view.userNameLabel.text = "User name"
        view.labelEmail.text = "Email"
        return view
    }
}
