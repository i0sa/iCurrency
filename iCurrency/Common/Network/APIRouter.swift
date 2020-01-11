//
//  APIRouter.swift
//  iCurrency
//
//  Created by Osama on 6/22/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//
import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case GetCurrencies
    
    var method: HTTPMethod {
        switch self {
        case .GetCurrencies:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .GetCurrencies:
            return "latest"
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .GetCurrencies:
            return nil
        }
    }
    
    
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.baseURL.asURL().appendingPathComponent(path)
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        // Common Headers
        request.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        
        request.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        var params: [String: Any] = ["access_key": Constants.AccessKey]
        if let parameters = parameters {
            // quick merge !
            parameters.forEach { (key, value) in params[key] = value }
        }
        return try URLEncoding.default.encode(request, with: params)
    }
    
    
}
