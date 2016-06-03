//
//  ViewController.swift
//  jsonFormat
//
//  Created by Guillaume on 03/06/16.
//  Copyright © 2016 Guillaume. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string: "http://www.omdbapi.com/?s=superman&page=2")
        
        let request = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) in
            
            if let urlContent = data {
                
                do {
                
                    let jsonDictionnary = try NSJSONSerialization.JSONObjectWithData(urlContent, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                    
                    let datas = jsonDictionnary["Search"] as! NSArray
                    
                    for info in datas {
                        
                        let infoDict = info as! NSDictionary
                        
                        print(infoDict["Title"]!)
                    }
                
                } catch {
                
                    print("error json")
                }
                
            }
            
        }
        
        request.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

