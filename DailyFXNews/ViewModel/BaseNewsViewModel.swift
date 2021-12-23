//
//  BaseNewsViewModel.swift
//  DailyFXNews
//
//  Created by Saurabh Bisht on 22/12/2021.
//

import Foundation
import UIKit

struct BaseNewsViewModel{
    var baseResult = BaseNewsModel.self
    struct Request {
        var id = ""
    }
    
    func getBaseData(completionHandler: @escaping (Result<BaseNewsModel, Error>) -> Void)  {
        ServiceInvoker.getBaseData { result in
            let decode = JSONDecoder()
            decode.dateDecodingStrategy = .iso8601
            switch result {
            case .success(let data):
                do{
                    let userResponse = try decode.decode(BaseNewsModel.self, from: data)
                    //print(userResponse)
                    completionHandler(.success(userResponse))
                    
                }catch let err{
                    print(err.localizedDescription)
                    completionHandler(.failure(err))
                    return
                }
            case .failure(let err):
                completionHandler(.failure(err))
            }
        }
    }

    func getImage(url:String, completionHandler: @escaping (UIImage)->Void){
        var image = UIImage()
        ServiceInvoker.downloadImage(url: url, completionHandler: { data in
                image = UIImage(data: data) ?? image
                completionHandler(image)
        })
    }
   
}
