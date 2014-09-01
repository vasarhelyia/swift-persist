//
//  PersistentStorage.swift
//  SwiftStorageTest
//
//  Created by Ágnes Vásárhelyi on 31/08/14.
//  Copyright (c) 2014 Ágnes Vásárhelyi. All rights reserved.
//

import Foundation

private var Instance = PersistentStorage()
private let StorageName = "MyAppStorage" //Replace with yours

class PersistentStorage : NSObject {
    
    /* Always call self.save() in property's didSet:
     didSet {
     self.save()
     } */
    
    class var sharedInstance : PersistentStorage {
        return Instance
    }
    
    override init() {
        super.init()
    }
    
    override class func initialize() {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if let storageData = userDefaults.dataForKey(StorageName) {
            let unarchiver = NSKeyedUnarchiver(forReadingWithData: storageData)
            Instance = unarchiver.decodeObject() as PersistentStorage
        } else {
            Instance = PersistentStorage()
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        /* Call aDecoder.decodeObjectForKey(key:) for every property */
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        /* Call aCoder.encodeObject(objv:, forKey:) for every property */
    }
    
    func save() {
        let lock = NSLock()
        lock.lock()
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let storageData = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWithMutableData: storageData)
        
        archiver.encodeObject(Instance)
        archiver.finishEncoding()
        
        userDefaults.setObject(storageData, forKey: StorageName)
        userDefaults.synchronize()
        
        lock.unlock()
    }
    
}