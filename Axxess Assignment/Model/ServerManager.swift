//
//  ServerManager.swift
//  Axxess Assignment
//
//  Created by Badve, Akshay on 7/18/20.
//  Copyright © 2020 Badve, Akshay. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit

class ServerManager: NSObject {
    
    static let sharedInstance = ServerManager()
    
    
    /// Function to get List from server
    /// - Parameters:
    ///   - pageCount: page number
    ///   - handler: handler to provide results back to view model
    func getListFromServer(handler:@escaping (Bool?, Error?)->Void) {
        
        //create the url with URL
        if let url = URL(string: "https://raw.githubusercontent.com/AxxessTech/Mobile-Projects/master/challenge.json") {
            
            //create the session object
            let session = URLSession.shared
            
            //now create the URLRequest object using the url object
            let request = URLRequest(url: url)
            
            //create dataTask using the session object to send data to the server
            let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
                
                guard error == nil else {
                    handler(nil, error)
                    return
                }
                
                guard let data = data else {
                    handler(nil,error)
                    
                    return
                }
                
                do {
                    let json = try! JSONSerialization.jsonObject(with: data, options: [])
                    RealmManager().storeDataInRealM(json: (json as? [[String: Any]])!)
                    handler(true,nil)
                    
                }})
            task.resume()
        }
    }
}
