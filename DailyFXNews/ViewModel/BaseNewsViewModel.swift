//
//  BaseNewsViewModel.swift
//  DailyFXNews
//
//  Created by Saurabh Bisht on 22/12/2021.
//

import Foundation
import UIKit

struct BaseNewsViewModel{
    
    struct Request {
        var id = ""
    }
    
    func getBaseData(){
        
    }
    
    func getImage(url:String, completionHandler: @escaping (UIImage)->Void){
        var image = UIImage()
        ServiceInvoker.downloadImage(url: url, completionHandler: { data in
                image = UIImage(data: data) ?? image
                completionHandler(image)
        })
    }
   
}
