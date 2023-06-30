//
//  PropertyListViewModel.swift
//  Radius_test
//
//  Created by Vijay Parmar on 29/06/23.
//

import Foundation

struct Exclusion{
    
    var facilityId : String
    var optionId:String
    var exFacilityId:String
    var exOptionId:String
    var isSelected:Bool = false
    
    
}


class PropertyListViewModel{
    
    var arrFacilities = [PropertyListFacility]()
    var arrExclusions = [Exclusion]()
    
    
    //MARK: - Get Property Data from Server
    func getPropertyList(onSccuess : @escaping () -> Void,onError : @escaping (String) -> Void){
        
        
        guard let propertyListUrl = URL(string: APIServices.propertyList) else {
            print("Invalid url")
            return
        }
        
        let httpUtility = HttpUtility()
        
        httpUtility.getApiData(requestUrl: propertyListUrl, resultType: PropertyListRootClass.self) {[weak self] result in
            
            if let facilities = result?.facilities,facilities.count > 0{
                for exclusion in result?.exclusions ?? []{
                    
                    self?.arrExclusions.append(Exclusion(facilityId: exclusion.first?.facilityId ?? "", optionId: exclusion.first?.optionsId ?? "", exFacilityId: exclusion.last?.facilityId ?? "", exOptionId: exclusion.last?.optionsId ?? ""))
                    
                }
                self?.arrFacilities = facilities
                onSccuess()
            }else{
                onError("Facilities data not found")
            }
        }
    }
    
    //MARK: -  Funtion to check the selected option is in excluded list or not
    func checkExclusionSelection(indexPath:IndexPath){
        
        let facilityId = arrFacilities[indexPath.section].facilityId ?? ""
        let optionId = arrFacilities[indexPath.section].options?[indexPath.row].id ?? ""
        
        if indexPath.section == 0{
            arrExclusions.indices.forEach {
                arrExclusions[$0].isSelected = false
            }
            
            arrFacilities.indices.forEach {
                arrFacilities[$0].selectedIndex = nil
                
            }
            
        }
        
        if  !(arrExclusions.contains(where: {$0.exFacilityId == facilityId && $0.exOptionId == optionId && $0.isSelected})){
            
            for index in 0..<arrExclusions.count{
                if arrExclusions[index].facilityId == facilityId &&  arrExclusions[index].optionId == optionId{
                    arrExclusions[index].isSelected = true
                    break
                }
                
            }
            arrFacilities[indexPath.section].selectedIndex = indexPath.row
        }
        
    }
    
}
