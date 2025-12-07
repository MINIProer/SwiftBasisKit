////
////  File.swift
////  SwiftBasisKit
////
////  Created by 赵成竹 on 2025/11/23.
////
//
//import Lottie
//import MJRefresh
//import UIKit
//
//class JCCustomRefreshHeader: MJRefreshGifHeader {
//    lazy var animationView: LottieAnimationView = {
//        let sdkBundle = Bundle.getLottieBundle()
//        let lottieView = LottieAnimationView(name: "mjlottie.json", bundle: sdkBundle)
//        lottieView.loopMode = .loop
//        return lottieView
//    }()
//
//    override func prepare() {
//        super.prepare()
//        setCommonTitle()
//        animationView.loopMode = .loop
//        animationView.contentMode = .scaleAspectFill
//        addSubview(animationView)
//    }
//
//    override func placeSubviews() {
//        super.placeSubviews()
//        animationView.frame = CGRect(x: 0, y: 20, width: 36, height: 36)
//        animationView.centerX = centerX
//        animationView.bottom = stateLabel?.bottom ?? height / 2
//        
//        stateLabel?.isHidden = true
//        lastUpdatedTimeLabel?.text = stateLabel?.text
//        lastUpdatedTimeLabel?.top = animationView.bottom
//        lastUpdatedTimeLabel?.textColor = SLCColor.color_cloud_theme_t3
//        lastUpdatedTimeLabel?.font = SLPRobotoMediumFont(12)
//    }
//
//    func date2String(_ date: Date, dateFormat: String = "dd/MM/yyyy HH:mm:ss") -> String {
//        let formatter = DateFormatter()
//        formatter.locale = Locale(identifier: "en_US")
//        formatter.dateFormat = dateFormat
//        let date = formatter.string(from: date)
//        return date
//    }
//    
//    func setCommonTitle() {
//        setTitle(SLPlocalizedStringForKey("string_load_pull_down_refresh"), for: .idle)
//        setTitle(SLPlocalizedStringForKey("string_load_release_update"), for: .pulling)
//        setTitle(SLPlocalizedStringForKey("string_load_loading"), for: .refreshing)
//    }
//
//    override var state: MJRefreshState {
//        didSet {
//            switch state {
//            case .idle:
//                animationView.stop()
//            case .pulling:
//                break
//            case .refreshing:
//                animationView.play { [weak self] _ in
//                    DispatchQueue.main.async {
//                        guard let self = self else { return }
//                        self.endRefreshing()
//                    }
//                }
//            default:
//                break
//            }
//        }
//    }
//}
