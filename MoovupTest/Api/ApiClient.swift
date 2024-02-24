//
//  ApiClient.swift
//  MoovupTest
//
//  Created by Saifur Rahman on 24/2/2024.
//

import Foundation
import Alamofire


public class ApiClient {
    
    private let TAG = "ApiClient"
    
    static let shared = ApiClient()
    
    private let token = "b2atclr0nk1po45amg305meheqf4xrjt9a1bo410"
    private let session = Session()
    
    func callPeopleListApi(completionHandler: ((Bool, Bool) -> Void)? = nil) {
        let url = "https://api.json-generator.com/templates/-xdNcNKYtTFG/data"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
        ]
        
        session.request(url,
                        method: .get,
                        headers: headers
        )
        .validate()
        .responseData { response in
            switch (response.result) {
            case .success(let data):
                if let peopleJson = try? JSONSerialization.jsonObject(with: data),
                   let peopleSrc = peopleJson as? [[String: Any]] {
                    
                    print("\(self.TAG): People List API success.")
                    
                    let appDb = AppDatabase.shared
                    
                    appDb.deleteAllPeople()
                    appDb.addPeopleList(source: peopleSrc)
                    
                    completionHandler?(true, true)
                }
                
                break
            case .failure(let error):
                print("\(self.TAG): People List API Failed. \(error)")
                
                let isDataAvailable = !AppDatabase.shared.getPeopleList().isEmpty
                
                completionHandler?(false, isDataAvailable)
                break
            }
        }
    }
}
