//
//  WebService.swift
//  MVVM-Weather
//
//  Created by Raja Adeel Ahmed on 3/27/23.
//

import Foundation

struct Resource<T> {
    let url: URL
    let parse: (Data) -> T?
}

final class WebService {
    func load<T>(resource: Resource<T>, completionHandler:@escaping (T?) -> ()) {
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                    completionHandler(resource.parse(data))
                }
            } else {
                completionHandler(nil)
            }
        }.resume()
    }
}
