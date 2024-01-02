//
//  NetworkService.swift
//  GitRepos
//
//  Created by Abdullah on 02/01/2024.
//

import Foundation
import Alamofire

struct ErrorModel: Codable, Error {
    let message: String?
}

protocol RemoteDataSource {
    func fetch<T>(relativeUrl urlString: String, method: HTTPMethod, type: T.Type, payload: [String: Any]?, completionHandler completion: @escaping (Result<T, ErrorModel>) -> Void) where T : Decodable, T : Encodable
}


class NetworkService: RemoteDataSource {
    
    func fetch<T>(relativeUrl urlString: String, method: HTTPMethod, type: T.Type, payload: [String: Any]? = [:], completionHandler completion: @escaping (Result<T, ErrorModel>) -> Void) where T : Decodable, T : Encodable {
        
        guard let url = URL(string: AppConfiguration.baseUrl + urlString) else {
            return
        }
        debugPrint("full url is \(AppConfiguration.baseUrl + urlString)")
        
//        let headers: HTTPHeaders =
//        [NetworkRequestHeader.tokenHeader : NetworkRequestHeader.token,
//         NetworkRequestHeader.accept : NetworkRequestHeader.applicationJson,
         //NetworkRequestHeader.contentType: NetworkRequestHeader.applicationJson]
        
        var makeRequest = URLRequest(url: url)
        makeRequest.httpMethod = method.rawValue
       // makeRequest.headers = headers
        
        if !(payload?.isEmpty ?? true) {
            let jsonData = try? JSONSerialization.data(withJSONObject: payload!)
            print(payload as Any)
            makeRequest.httpBody = jsonData
        }
        
        AF.request(makeRequest).responseDecodable(of: type.self) { response in
            switch response.result {
            case .success:
                if let statusCode = response.response?.statusCode {
                    let statusCodes = 200..<300
                    if statusCodes.contains(statusCode) {
                        if let data = response.data {
                            if let decodedResponse = try? JSONDecoder().decode(type.self, from: data) {
                                completion(.success(decodedResponse))
                            }
                            else {
                                self.errorHandler(data: response.data, completion: completion)
                            }
                        }
                        else {
                            let error = ErrorModel(message: "Unable to parse JSON")
                            completion(.failure(error))
                        }
                    }
                    else {
                        self.errorHandler(data: response.data, completion: completion)
                    }
                }
                
            case let .failure(error):
                if let data = response.data {
                    if let statusCode = response.response?.statusCode {
                        if statusCode >= 200 && statusCode < 300 {
                            if let decodedResponse = try? JSONDecoder().decode(type.self, from: data) {
                                completion(.success(decodedResponse))
                            }
                        }
                        else {
                            self.errorHandler(data: response.data, completion: completion)
                        }
                    }
                }
                else {
                    let error = ErrorModel(message: error.errorDescription)
                    completion(.failure(error))
                }
            }
        }
    }
    
    func errorHandler<T>(data: Data?, completion: @escaping (Result<T, ErrorModel>) -> Void) where T : Decodable, T : Encodable {
        if let data = data {
            let str = String(decoding: data, as: UTF8.self)
            if let decodedResponse = try? JSONDecoder().decode(ErrorModel.self, from: data) {
                completion(.failure(decodedResponse))
            }
            else {
                let error = ErrorModel(message: "Unable to parse JSON")
                completion(.failure(error))
            }
        }
    }
}
