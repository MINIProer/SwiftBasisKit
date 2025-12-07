//
//  File.swift
//  SwiftBasisKit
//
//  Created by 赵成竹 on 2025/11/24.
//

import Moya
import RxSwift
import ObjectMapper
import RxMoya

public enum NetworkError: Error {
    case jsonMapping
    case objectMapping
}

public final class JCNetworkService: @unchecked Sendable {

    public static let shared = JCNetworkService()
    private init() {}

    /// 通用 provider，保证生命周期足够长
    private let provider = MoyaProvider<MultiTarget>(
        plugins: [
            NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))
        ]
    )

    /// 通用请求方法
    /// - Parameters:
    ///   - target: 你的 API TargetType
    ///   - responseType: 解析成的模型类型
    /// - Returns: Single<T>
    public func request<T: ImmutableMappable>(
        _ target: TargetType,
        responseType: T.Type
    ) -> Single<T> {

        // 使用 MultiTarget 支持任意 TargetType
        return provider.rx.request(MultiTarget(target))
            .flatMap { response -> Single<T> in
                // 尝试 JSON 映射
                guard let json = try? response.mapJSON() as? [String: Any] else {
                    return Single.error(NetworkError.jsonMapping)
                }

                // 尝试映射成模型
                guard let object = Mapper<T>().map(JSON: json) else {
                    return Single.error(NetworkError.objectMapping)
                }

                return Single.just(object)
            }
    }
}


