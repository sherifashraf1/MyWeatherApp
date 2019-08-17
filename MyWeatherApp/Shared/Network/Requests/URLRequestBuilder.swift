//
//  RequestBuilderProtocol.swift
//  SwiftCairo-App
//
//  Created by abdelrahman mohamed on 4/21/18.
//  Copyright © 2018 abdelrahman mohamed. All rights reserved.
//

import Foundation
import Alamofire

protocol URLRequestBuilder: URLRequestConvertible, APIRequestHandler {
    
    var mainURL: URL { get }
    var requestURL: URL { get }
    // MARK: - Path
    var path: String { get }
    
    var headers: HTTPHeaders { get }
    // MARK: - Parameters
    var parameters: Parameters? { get }
    
    // MARK: - Methods
    var method: HTTPMethod { get }
    
    var encoding: ParameterEncoding { get }

    var urlRequest: URLRequest { get }
    
    var deviceId: String { get }

}

extension URLRequestBuilder {

    var mainURL: URL  {
        return URL(string: "https://samples.openweathermap.org/data/2.5")!
    }
    
    var requestURL: URL {
        return mainURL.appendingPathComponent(path)
    }
    
    var headers: HTTPHeaders {
        return HTTPHeaders()
    }
    
    var APIToken: String? {
        return "b6907d289e10d714a6e88b30761fae22"
    }
    
    var defaultParams: Parameters {
        var param = Parameters()
        param["appid"] = APIToken
        return param
    }
    
    var encoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    var urlRequest: URLRequest {
        var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
         headers.forEach { request.addValue($1, forHTTPHeaderField: $0) }
        return request
    }

    var deviceId: String {
        return UIDevice.current.identifierForVendor?.uuidString ?? ""
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        return try encoding.encode(urlRequest, with: parameters)
    }

}
extension NSMutableData {
    func appendString(_ string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: false)
        append(data!)
    }
}
