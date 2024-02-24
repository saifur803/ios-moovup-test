//
//  People.swift
//  MoovupTest
//
//  Created by Saifur Rahman on 24/2/2024.
//

import Foundation
import CoreStore


public class People: CoreStoreObject, ImportableUniqueObject {

    enum Key: String {
        case id
        case name
        case email
        case picture
        case location
        
        case first
        case last
        
        case latitude
        case longitude
        
        var jsonKey: String {
            switch self {
            case .id:
                return "_id"
            default:
                return rawValue
            }
        }
    }
    
    @Field.Stored(Key.id.jsonKey)
    private(set) var id: String = ""
    
    @Field.Stored(Key.email.rawValue)
    private(set) var email: String = ""
    
    @Field.Stored(Key.picture.rawValue)
    private(set) var picture: String = ""
    
    @Field.Stored(Key.first.rawValue)
    private(set) var firstName: String = ""
    
    @Field.Stored(Key.last.rawValue)
    private(set) var lastName: String = ""
    
    @Field.Stored(Key.latitude.rawValue)
    private(set) var latitude: Double? = nil
    
    @Field.Stored(Key.longitude.rawValue)
    private(set) var longitude: Double? = nil
    
    
    public typealias UniqueIDType = String
    public var uniqueIDValue: String {
        set { id = newValue }
        get { return id }
    }
    public static var uniqueIDKeyPath: String {
        String(keyPath: \People.$id)
    }
    public typealias ImportSource = [String: Any]
    
    public static func uniqueID(from source: [String : Any], in transaction: CoreStore.BaseDataTransaction) throws -> UniqueIDType? {
        source[Key.id.jsonKey] as? UniqueIDType
    }
    
    public func update(from source: [String : Any], in transaction: CoreStore.BaseDataTransaction) throws {        
        id = source[Key.id.jsonKey] as! String
        email = source[Key.email.jsonKey] as? String ?? ""
        picture = source[Key.picture.jsonKey] as? String ?? ""
        
        if let nameSrc = source[Key.name.jsonKey] as? [String: Any] {
            firstName = nameSrc[Key.first.jsonKey] as? String ?? ""
            lastName = nameSrc[Key.last.jsonKey] as? String ?? ""
        }
        
        if let locationSrc = source[Key.location.jsonKey] as? [String: Any] {
            latitude = locationSrc[Key.latitude.jsonKey] as? Double
            longitude = locationSrc[Key.longitude.jsonKey] as? Double
        }
    }
    
    public static func shouldUpdate(from source: [String : Any], in transaction: BaseDataTransaction) -> Bool {
        guard let id = source[Key.id.jsonKey] as? String, !id.isEmpty else {
            return false
        }
        return true
    }
}


extension AppDatabase {
    
    func addPeopleList(source: [[String: Any]]) {
        _ = try? dataStack.perform { transcation -> [People] in
            let transactionPeople = try transcation.importUniqueObjects(Into<People>(), sourceArray: source)
            let people = dataStack.fetchExisting(transactionPeople)
            return people
        }
    }
    
    func getPeopleList() -> [People] {
        let peopleList = try? dataStack.fetchAll(From<People>())
        return peopleList ?? []
    }
    
    func deleteAllPeople() {
        _ = try? dataStack.perform { transaction in
            try transaction.deleteAll(From<People>())
        }
    }
}


