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
    
    func getBaseData(completionHandler: @escaping (BaseNewsModel)->Void){
        ServiceInvoker.getBaseData { data in
            
            let decode = JSONDecoder()
            decode.dateDecodingStrategy = .iso8601
            
            do{
                let userResponse = try decode.decode(BaseNewsModel.self, from: data)
                //print(userResponse)
                completionHandler(userResponse)
            }catch let err{
                print(err.localizedDescription)
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
