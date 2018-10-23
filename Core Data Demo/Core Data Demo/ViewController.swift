//
//  ViewController.swift
//  Core Data Demo
//
//  Created by David E Bratton on 10/22/18.
//  Copyright © 2018 David Bratton. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
//        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
//        newUser.setValue("Nicholas", forKey: "username")
//        newUser.setValue("CHargers88", forKey: "password")
//        newUser.setValue(16, forKey: "age")
//        do {
//            try context.save()
//            print("Saved Successfully")
//        } catch {
//            print("There was an error")
//        }
        
        // Retrieve CoreData
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        // Return only certain values
        // username = Anna
        //request.predicate = NSPredicate(format: "username = %@", "Anna")
        
        // age < 17
        //request.predicate = NSPredicate(format: "age < %@", "17")
        
        // username = Nicholas
        //request.predicate = NSPredicate(format: "username = %@", "Nicholas")
        
        // username = Pongo
        request.predicate = NSPredicate(format: "username = %@", "Pongo")
    
        request.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    if let username = result.value(forKey: "username") as? String {
                        //Update username value from predicate above
                        //result.setValue("Pongo", forKey: "username")
//                        do {
//                            try context.save()
//                        } catch {
//                            print("Failed to find entry")
//                        }
                        print(username)
                    }
                }
            } else {
                print("No results")
            }
        } catch {
            print("Couln't fetch results")
        }
        
    }


}

