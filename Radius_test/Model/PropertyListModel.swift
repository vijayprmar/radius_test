//
//  PropertyListModel.swift
//  Radius_test
//
//  Created by Vijay Parmar on 29/06/23.
//

import Foundation

struct PropertyListRootClass : Codable {

    let exclusions : [[PropertyListExclusion]]?
    let facilities : [PropertyListFacility]?


    enum CodingKeys: String, CodingKey {
        case exclusions = "exclusions"
        case facilities = "facilities"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        exclusions = try? values.decodeIfPresent([[PropertyListExclusion]].self, forKey: .exclusions)
        facilities = try? values.decodeIfPresent([PropertyListFacility].self, forKey: .facilities)
    }


}

struct PropertyListFacility : Codable {

    let facilityId : String?
    let name : String?
    var options : [PropertyListOption]?
    
    var selectedIndex : Int?
   
    enum CodingKeys: String, CodingKey {
        case facilityId = "facility_id"
        case name = "name"
        case options = "options"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        facilityId = try? values.decodeIfPresent(String.self, forKey: .facilityId)
        name = try? values.decodeIfPresent(String.self, forKey: .name)
        options = try? values.decodeIfPresent([PropertyListOption].self, forKey: .options)
    }


}


struct PropertyListOption : Codable {

    let icon : String?
    let id : String?
    let name : String?
    var excludedFacilityIds = ""
    var excludedOptionId = ""
    
    enum CodingKeys: String, CodingKey {
        case icon = "icon"
        case id = "id"
        case name = "name"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        icon = try? values.decodeIfPresent(String.self, forKey: .icon)
        id = try? values.decodeIfPresent(String.self, forKey: .id)
        name = try? values.decodeIfPresent(String.self, forKey: .name)
    }
}


struct PropertyListExclusion : Codable {

    let facilityId : String?
    let optionsId : String?


    enum CodingKeys: String, CodingKey {
        case facilityId = "facility_id"
        case optionsId = "options_id"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        facilityId = try values.decodeIfPresent(String.self, forKey: .facilityId)
        optionsId = try values.decodeIfPresent(String.self, forKey: .optionsId)
    }


}
