////
////  File.swift
////  SwiftBasisKit
////
////  Created by 赵成竹 on 2025/11/23.
////
//
////import MJRefresh
////import RxSwift
//import UIKit
////import LYEmptyView
//
//class JCBaseTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//    lazy var tableView: UITableView = {
//        let tableView = UITableView(frame: .zero, style: .grouped)
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.separatorStyle = .none
//        tableView.showsVerticalScrollIndicator = false
//        tableView.keyboardDismissMode = .onDrag
//        tableView.sectionHeaderHeight = 0 /// 设置头部高度为 0，去除间隙
//        tableView.sectionFooterHeight = 0
//        tableView.backgroundColor = .clear
//        tableView.contentInsetAdjustmentBehavior = .never
//        tableView.estimatedRowHeight = 200
//        tableView.tableFooterView = nil
//        tableView.tableHeaderView = nil
//        tableView.contentInset = UIEdgeInsets.zero
//        tableView.rowHeight = UITableView.automaticDimension
//        
////        这是工商的却省图
////        tableView.ly_emptyView = SLPEmptyView.diyNoDataEmpty()
////
////        tableView.ly_emptyView = SLPEmptyView.empty(with: SLPEmptyView.getDefaultImg(), titleStr: "", detailStr: SLPlocalizedStringForKey("string_common_no_data_for_now"))
//        if #available(iOS 15.0, *) {
//            tableView.sectionHeaderTopPadding = 0
//        }
//
//        let header = JCCustomRefreshHeader { [weak self] in
//            guard let self = self else { return }
//            self.tableHeaderRefresh()
//        }
//        header.addCommon()
//        let footer = MJRefreshAutoNormalFooter { [weak self] in
//            guard let self = self else { return }
//            self.tableFooterRefresh()
//        }
//        footer.addCommon()
//        
//        tableView.mj_header = header
//        tableView.mj_footer = footer
//        return tableView
//    }()
//
//    func setFooterTitle(title:String){
//        let footer = MJRefreshAutoNormalFooter { [weak self] in
//            guard let self = self else { return }
//            self.tableFooterRefresh()
//        }
//        footer.ignoredScrollViewContentInsetBottom = -30
//        footer.addCommon()
//        tableView.mj_footer = footer
//        footer.setTitle(title, for: .noMoreData)
//    }
//    
//    /// 不要tableview的刷新功能
//    func noMJRefresh() {
//        tableView.mj_header = nil
//        tableView.mj_footer = nil
//    }
//
//    /// tableview下拉刷新回调，子类重写
//    func tableHeaderRefresh() {}
//    /// tableview上拉加载回调，子类重写
//    func tableFooterRefresh() {}
//
//    /// 停止下拉刷新与上拉加载
//    func stopAllMJRefresh() {
//        if let header = tableView.mj_header, header.isRefreshing {
//            header.endRefreshing()
//        }
//        if let footer = tableView.mj_footer, footer.isRefreshing {
//            footer.endRefreshing()
//        }
//    }
//
//    // MARK: - tableview delegate & datasource
//
//    func tableView(_: UITableView, heightForHeaderInSection _: Int) -> CGFloat {
//        return 0.1
//    }
//
//    func tableView(_: UITableView, viewForHeaderInSection _: Int) -> UIView? {
//        return UIView()
//    }
//
//    func tableView(_: UITableView, viewForFooterInSection _: Int) -> UIView? {
//        return UIView()
//    }
//
//    func tableView(_: UITableView, heightForFooterInSection _: Int) -> CGFloat {
//        return 0.1
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 20
//    }
//
//    
//    func tableView(_: UITableView, cellForRowAt _: IndexPath) -> UITableViewCell {
//        return UITableViewCell()
//    }
//}
//
