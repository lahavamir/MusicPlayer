//
//  APIService.swift
//
//  Created by Amir lahav on 05/01/2019.
//  Copyright © 2019 Amir lahav. All rights reserved.
//

import Foundation
import UIKit


class APIService:APIServiceProtocol {
    
    let session:URLSession
    var dataTask:URLSessionDataTask? = nil
    init(session:URLSession = URLSession(configuration: .default)) {
        self.session = session
    }
    
    // generic fetch for Decodable objects
    func fetch<T:Decodable>(request:RequestData, type:T.Type, complition:@escaping (Resualt<[T]>)->())
    {
        
        dataTask?.cancel()
        do {
        let request = try prepare(request: request)
            dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                if let error = error {
                        complition(Resualt.error(APIError.networkError(error)))
                }else{
                    do {
                        let decoder = JSONDecoder()
                        let tracks = try decoder.decode([T].self, from: data!)
                        complition(Resualt.succes(tracks))
                    } catch let error {
                        print(error)
                    }
                }
            })
            
            dataTask?.resume()
        }catch{
            
        }
    }
    
    func fetchImage(request:RequestData, complition:@escaping (UIImage)->())
    {
        
    }

    
    func prepare(request:RequestData) throws -> URLRequest
    {
        let fullURL = "\(request.baseURL)/\(request.path)"
        guard let url = URL(string: fullURL) else {
            throw APIError.badInput
        }
        var apiRequest = URLRequest(url: url)
        
        switch request.param {

        case .url(let param):
            if let param = param {
                let queryItems = param.map { pair in
                    return URLQueryItem(name: pair.key, value: pair.value)
                }
                guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
                    throw APIError.badInput
                }
                components.queryItems = queryItems
                apiRequest.url = components.url
            }

        case .body(let param):
            apiRequest.httpBody = param
        }

        apiRequest.httpMethod = request.method.rawValue

        print(apiRequest.url)
        return apiRequest
    }
    
    
}
