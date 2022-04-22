//
//  APIFetcher.swift
//  Coding-Test
//
//  Created by DaeHyeon Kim on 2022/04/22.
//  Copyright © 2022 DeliveyHero. All rights reserved.
//

import Foundation
import Combine


enum APIError: Error {
    case parsing(description: String, returnValue: [String: Any]?)
    case network(description: String, statusCode: Int?, url: String?)
    case invalidURL(path: String)
    case accessTokenDoesNotExist
    case userUUIDDoesNotExist
    case invalidBasicAuthorization
    case ResultFailure(code: String, message: String)
    case invalidToken
    case emptyResponse
    case unknown(description: String)
}




class APIFetcher
{
    static let shared = APIFetcher()
    
    private let session: URLSession = .shared
    
    private let disposables = Set<AnyCancellable>()
    
    func requestList(url : String) -> AnyPublisher<[ListResponse], APIError>
    {
        return requestToServer(url: url)
    }
    
    private func requestToServer<T>(
        url : String
    ) -> AnyPublisher<T, APIError> where T: Codable {
        
       
        let request = URLRequest(url: URL(string: url)!)
    
        return session.dataTaskPublisher(for: request)
            .tryMap { response -> Data in
                guard let httpResponse = response.response as? HTTPURLResponse else {
                    throw APIError.network(
                        description: "Invalid type of response",
                        statusCode: nil,
                        url: response.response.url?.absoluteString
                    )
                }
                
                let statusCode = httpResponse.statusCode
                
                guard statusCode == 200 else {
                    if let jsonData = try? JSONSerialization.jsonObject(with: response.data, options: []) {
                        throw APIError.network(
                            description: "\(jsonData)",
                            statusCode: statusCode,
                            url: httpResponse.url?.absoluteString
                        )
                    } else {
                        let responseData = String(data: response.data, encoding: .utf8) ?? "Unknown type of response.data"
                        throw APIError.network(
                            description: "\(responseData)",
                            statusCode: statusCode,
                            url: httpResponse.url?.absoluteString
                        )
                    }
                }
                
                return response.data
            }
            .mapError { [weak self] err -> APIError in
                if let aPIError = err as? APIError {
                    self?.printErrMessageOnConsole(err: aPIError, url: request.url?.absoluteString)
                    return aPIError
                } else {
                    return APIError.network(
                        description: err.localizedDescription,
                        statusCode: nil,
                        url: request.url?.absoluteString
                    )
                }
            }
            .flatMap(maxPublishers: .max(1), { responseData -> AnyPublisher<T, APIError> in
                return decode(responseData)
            })
            .mapError{ [weak self] wowpleErr in
                self?.printErrMessageOnConsole(err: wowpleErr, url: request.url?.absoluteString)
                return wowpleErr
            }
            .eraseToAnyPublisher()
        
    }
    private func printErrMessageOnConsole(err: APIError, url: String?) {
        switch err {
        case .network(let desc, let statusCode, _):
            print("=============== api network error  / status: \(statusCode ?? -1) ===============")
            print("URL: \(url ?? "Invalid URL")")
            print(desc)
            print("=============================================")
        case .parsing(let desc, let returnValue):
            print("============================== api parsing error ==============================")
            print("URL: \(url ?? "Invalid URL")")
            print(desc)
            
            if returnValue != nil {
                print("\(returnValue!)")
                print("===========================================================================")
            } else {
                print("===========================================================================")
            }
        case .ResultFailure(let code, let message):
            print("============================== api error code \(code) ==============================")
            print("URL: \(url ?? "Invalid URL")")
            print("message: \(message)")
        default:
            break
        }
    }
}


fileprivate func makeErrorResponseReadable(data: Data) -> [String: Any]? {
    guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
        return nil
    }
    
    return json
}

func decode<T: Codable>(_ data: Data) -> AnyPublisher<T, APIError> {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .secondsSince1970
  
    return Just(data)
        .decode(type: T.self, decoder: decoder)
        .tryMap { result -> T? in
            return result
        }
        .tryMap {
            if ($0 == nil) {
                throw APIError.emptyResponse
            } else {
                return $0
            }
        }
        .compactMap{$0}
        .mapError{err -> APIError in
            if let wowpleErr = err as? APIError {
                return wowpleErr
            } else {
                return .parsing(description: err.localizedDescription, returnValue: makeErrorResponseReadable(data: data))
            }
        }
        .eraseToAnyPublisher()
}
