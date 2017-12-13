//
//  ViewController.swift
//  coreDataApp
//
//  Created by Yash Patel on 24/10/17.
//  Copyright © 2017 Yash Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var user:[User]? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
       // Uncomment below for
        //Save, fetch, single delete and clean delete operation
        
            user = CoreDataHandler.fetchObject()
            print("Before Single Delete")
            for i in user! {
                print(i.username!)
            }

            if CoreDataHandler.deleteObject(user: user![1]) {

                user = CoreDataHandler.fetchObject()
                print("After Single Delete")
                for i in user! {
                    print(i.username!)
                }
                print(user?.count)
            }

        if CoreDataHandler.cleanDelete() {
            user = CoreDataHandler.fetchObject()
            print(user?.count)
        
        //Uncomment below for
        //fetch or filter operation
        }
        
        //Uncomment below for
        //Filter or restricted fetch
        
        // clean delete before every run
        CoreDataHandler.cleanDelete()

        // adding objects to test filter
        CoreDataHandler.saveObject(username: "Yash", password: "12345")
        CoreDataHandler.saveObject(username: "CottonCandy", password: "22-22")
        CoreDataHandler.saveObject(username: "John", password: "Snow")
        CoreDataHandler.saveObject(username: "Alpha", password: "Beta@")
        CoreDataHandler.saveObject(username: "yash@gmail.com", password: "neutral.ity")

        user = CoreDataHandler.filterData()
        for i in user! {
            print("Username: \(i.username!)\nPassword: \(i.password!)")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

