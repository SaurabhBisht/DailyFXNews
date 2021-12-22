//
//  ServiceInvoker.swift
//  DailyFXNews
//
//  Created by Saurabh Bisht on 22/12/2021.
//

import Foundation

class ServiceInvoker{
    public static func downloadImage(url: String, completionHandler: @escaping (Data)->Void) {
        if let url = URL(string:url) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async {
                    completionHandler(data)
                }
            }
            
            task.resume()
        }
    }
}
