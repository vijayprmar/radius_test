//
//  Network.swift
//
//  Created by Vijay Parmar
//

import Foundation


class HttpUtility{
    
    static var shared = HttpUtility()
    
    
    func getApiData<T:Decodable>(requestUrl: URL, resultType: T.Type, completionHandler:@escaping(_ result: T?)-> Void)
       {
           URLSession.shared.dataTask(with: requestUrl) { (responseData, httpUrlResponse, error) in
               if(error == nil && responseData != nil && responseData?.count != 0)
               {
                   let decoder = JSONDecoder()
                   do {
                       let result = try decoder.decode(T.self, from: responseData!)
                       DispatchQueue.main.async {
                           _=completionHandler(result)
                       }
                       
                   }
                   catch let error{
                       debugPrint("error occured while decoding = \(error.localizedDescription)")
                   }
               }

           }.resume()
       }
    
}
