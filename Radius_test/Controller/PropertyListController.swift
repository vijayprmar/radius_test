//
//  ViewController.swift
//  Radius_test
//
//  Created by Vijay Parmar on 29/06/23.
//

import UIKit

class PropertyListController: UIViewController {
    
    @IBOutlet weak var tblPropertyList: UITableView!
    var vmPropertyList = PropertyListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    //MARK: - Initial Setup
    private func initialSetup(){
        self.title = "Property List"
        tblPropertyList.delegate = self
        tblPropertyList.dataSource = self
        getData()
    }
    
    //MARK: - Get Data From API
    private func getData(){
        
        self.view.activityStartAnimating(activityColor: .gray, backgroundColor: .clear)
        vmPropertyList.getPropertyList {[self] in
            self.view.activityStopAnimating()
            tblPropertyList.reloadData()
        } onError: { [self] error in
            showAlert(message: error)
        }
    }
    
    
}

//MARK: -  Tableview Delegate & Datasource
extension PropertyListController : UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return vmPropertyList.arrFacilities.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableCell(withIdentifier: "PropertyListTableViewCell")as! PropertyListTableViewCell
        
        headerView.imgIcon.isHidden = true
        headerView.lblTitle.text = vmPropertyList.arrFacilities[section].name ?? ""
        headerView.lblTitle.font = .boldSystemFont(ofSize: 18)
        headerView.backgroundColor = .white
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  vmPropertyList.arrFacilities[section].options?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PropertyListTableViewCell", for: indexPath)as! PropertyListTableViewCell
    
        cell.configure(data: vmPropertyList.arrFacilities[indexPath.section].options?[indexPath.row], facilityId: vmPropertyList.arrFacilities[indexPath.section].facilityId ?? "", isSelected: vmPropertyList.arrFacilities[indexPath.section].selectedIndex == indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        self.vmPropertyList.checkExclusionSelection(indexPath:indexPath)
        tblPropertyList.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    

}
