//
//  NetworkController.swift
//  MovieSearch
//
//  Created by Gibson Smiley on 4/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class NetworkController {
    
    static func dataAtURL(url: String, completion: (data: NSData?) -> Void) {
        if let url = NSURL(string: url) {
            let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, _, error) in
                if let error = error {
                    print(error.localizedDescription)
                    completion(data: nil)
                } else {
                    completion(data: data)
                }
            })
            task.resume()
        } else {
            completion(data: nil)
        }
    }
    
    static func jsonFromData(data: NSData, completion: (json: [String: AnyObject]?) -> Void) {
        let json = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String: AnyObject]
        completion(json: json)
    }
}