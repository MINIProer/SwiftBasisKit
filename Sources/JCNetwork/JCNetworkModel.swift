//
//  File.swift
//  SwiftBasisKit
//
//  Created by 赵成竹 on 2025/12/3.
//

import ObjectMapper
import Foundation

public class JCNetworkModel: ImmutableMappable {
    public var message = String()
    public var code = Int()
    public var success = Bool()
    
    public required init(map _: Map) throws {}
    
    public func mapping(map: Map) {
        message <- map["message"]
        code <- map["code"]
        success = code == 0
    }
    
    public let TransformIntToString = TransformOf<String, Any>(
        fromJSON: { value in
            if let v = value as? Int { return String(v) }
            if let v = value as? Double { return String(v) }
            return value as? String
        },
        toJSON: { value in
            return value
        }
    )
    
    public let TransformStringToInt = TransformOf<Int, Any>(
        fromJSON: { value in
            if let v = value as? Int { return v }
            if let v = value as? String { return Int(v) }
            if let v = value as? Double { return Int(v) }
            return nil
        },
        toJSON: { value in
            return value
        }
    )
    
    public let TransformStringToDouble = TransformOf<Double, Any>(
        fromJSON: { value in
            if let v = value as? Double { return v }
            if let v = value as? Int { return Double(v) }
            if let v = value as? String { return Double(v) }
            return nil
        },
        toJSON: { value in
            return value
        }
    )
    
    public let TransformAnyToBool = TransformOf<Bool, Any>(
        fromJSON: { value in
            
            if let v = value as? Bool { return v }
            if let v = value as? Int { return v != 0 }
            if let v = value as? Double { return v != 0 }
            
            if let v = value as? String {
                if v == "1" { return true }
                if v == "0" { return false }
                return (v as NSString).boolValue
            }
            
            return false
        },
        toJSON: { value in value }
    )
    
    public let TransformNumberToString = TransformOf<String, Any>(
        fromJSON: { value in
            if let v = value as? NSNumber {
                return v.stringValue
            }
            if let v = value as? String {
                return v
            }
            return nil
        },
        toJSON: { value in
            return value
        }
    )
}
