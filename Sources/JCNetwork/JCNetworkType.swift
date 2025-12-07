//
//  File.swift
//  SwiftBasisKit
//
//  Created by 赵成竹 on 2025/11/23.
//


import Moya
import Foundation



public protocol JCNetworkType: TargetType {
    var parameters: [String: Any]? { get }
    ///默认请求失败都展示toast
    var isShowErrorToast: Bool { get }
}

public extension JCNetworkType {
    
    var baseURL: URL {
        return URL(string: AppConstants.domain)!
    }
    
    var parameters: [String: Any]? { return [:] }
    
    var task: Task {
        let encoding: ParameterEncoding
        switch method {
        case .post:
            encoding = JSONEncoding.default
        default:
            encoding = URLEncoding.default
        }

        if let requestParameters = parameters {
            let param = requestParameters
            ///可以拼接公共参数
//            param["flag"] = "strategone"
            return .requestParameters(parameters: param, encoding: encoding)
        }
        return .requestPlain
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var headers: [String: String]? {
        ///新增请求头
        var headers: [String: String] = [:]
        headers["Content-type"] = "application/json"
        headers["x-transaction-id"] = UUID().uuidString
//        headers["version"] = Utilities.instance.fetchApplicationVersion()
//        headers["lang"] = SLMLanguageManager.getLanguagePostHeader()
//        headers["token"] = UserManager.instance.fetchToken()
//        headers["tokenId"] = UserManager.instance.fetchToken()
//        headers["deviceType"] = "2"
//        headers["source"] = "2"
//        headers["appVer"] = "V" + Bundle(for: SLCNetService.self).version
        return headers
    }
    
    /// 服务器返回的状态码为 2xx 时，请求会被视为成功
    var validationType: Moya.ValidationType {
        return .successCodes
    }
}
public func demoTest() {
    JCNetworkService.shared.request(
        testNE.updateAccountInfo(params: [:]),
        responseType: SLIBaseServiceModel.self
    )
    .subscribe(onSuccess: { model in
        print("success:", model.message, model.code, model.success)
    }, onFailure: { error in
        print("failure:", error)
    })
}
public enum testNE:JCNetworkType{

    ///更新用户信息
    case updateAccountInfo(params: [String: Any])
    
    
    // 请求路径
    public var path: String {
        switch self {
        case .updateAccountInfo:
            return "/todos/1"
        }
//        https://jsonplaceholder.typicode.com
    }
    public var parameters: [String: Any]? {
        switch self {
        case
            let .updateAccountInfo(params: params):
            return params
        }
    }
        
        
        ///是否展示toast
    public  var isShowErrorToast:Bool {

                return true
            
        }
        
    public  var method: Moya.Method {
//            switch self {
//            case .fetchWifiSnInfo,
//                    .modelDisplay,
//                    .afterSaleGetToken:
//                return .get
//            default:
                return .get
//            }
        }
    public var baseURL: URL {
        return URL(string: "https://jsonplaceholder.typicode.com")!
    }
}




import ObjectMapper

public class SLIBaseServiceModel: ImmutableMappable {
    public var message = String()
    public var code = Int()
    public var success = Bool()
    
    let transformIntToString = TransformOf<String, Any>(fromJSON: { (value: Any?) -> String? in
        // 将值从 any? 变换为 String?
        if let c1 = value as? Int {
            return String(c1)
        }
        return value as? String
    }, toJSON: { (value: String?) -> Double? in
        // 将值从 String? 变换为 Float?
        if let value = value {
            return Double(value)
        }
        return nil
    })
    
    public required init(map _: Map) throws {}
    
    public func mapping(map: Map) {
        message <- map["message"]
        code <- map["code"]
//        success <- map["success"]
        if code == 0 {
            success = true
        } else {
            success = false
        }

    }
}
