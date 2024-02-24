//
//  AppDatabase.swift
//  MoovupTest
//
//  Created by Saifur Rahman on 24/2/2024.
//

import Foundation
import CoreStore


class AppDatabase {
    static let shared = AppDatabase()
    
    let dataStack = DataStack(CoreStoreSchema(
        modelVersion: "MoovupAppDatabase",
        entities: [
            Entity<People>("People")
        ],
        versionLock: [
            "People": [0x6bd785c57914d0f1, 0x621c61b32e6792ed, 0x30180108154287cb, 0xba7c18d192d2c6b7]
        ])
    )
    
    init() {
        initDataStack()
    }
    
    private func initDataStack() {
        print("Initialize App DB")
        
        do {
            try dataStack.addStorageAndWait(SQLiteStore(
                fileName: "MoovupAppDatabaseName",
                localStorageOptions: .recreateStoreOnModelMismatch
            ))
        } catch {
            fatalError("EmsdHiker-Database dataStack failed.")
        }
    }
    
    
}
