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
    
    public static func getBaseData(completionHandler: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: Constants.Endpoints.baseDataURL) else {
            //completionHandler(.failure())
            return
        }
        URLSession.shared.dataTask(with: url) {data, response, error in
            if error == nil{
                if let data = data {
                    completionHandler(.success(data))
                }
            }else {
                print(error?.localizedDescription)
                completionHandler(.failure(error as! Error))
            }
        }.resume()
    }
}
