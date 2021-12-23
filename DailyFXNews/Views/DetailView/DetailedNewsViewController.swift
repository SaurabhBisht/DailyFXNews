//
//  DetailedNewsViewController.swift
//  DailyFXNews
//
//  Created by Saurabh Bisht on 22/12/2021.
//

import Foundation
import UIKit
import Combine

class DetailedNewsViewController: BaseViewController, ObservableObject{
    
    @IBOutlet weak var nodataLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var newsType = NewsType.breakingNews
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    fileprivate func setTableView() {
        self.tableView.register(UINib(nibName: DetailViewCell.className, bundle: nil), forCellReuseIdentifier: DetailViewCell.className)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.tableFooterView = UIView()
        self.tableView.estimatedRowHeight = 103.0
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.separatorInset = .zero
        self.tableView.layoutMargins = .zero
    }
    
    fileprivate func headerView(title:String) -> UIView? {
        let headerView = UIView()
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 103/255.0, green: 109/255.0, blue: 118/255.0, alpha: 1)
        label.text = title
        headerView.addSubview(label)
        let maxSize = CGSize(width: headerView.frame.size.width, height: 18)
        let size = label.sizeThatFits(maxSize)
        label.frame.size = size
        label.numberOfLines = 2
        headerView.addConstraints([
            NSLayoutConstraint(item: label, attribute: .leading, relatedBy: .equal, toItem: headerView, attribute: .leading, multiplier: 1, constant: 16),
            NSLayoutConstraint(item: label, attribute: .trailing, relatedBy: .equal, toItem: headerView, attribute: .trailing, multiplier: 1, constant: -16),
            NSLayoutConstraint(item: label, attribute: .bottom, relatedBy: .equal, toItem: headerView, attribute: .bottom, multiplier: 1, constant: -2)
        ])
        headerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 50.0).isActive = true
        headerView.backgroundColor = UIColor.white
        return headerView
    }
    
}

extension DetailedNewsViewController : UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        switch newsType {
        case .breakingNews:         return 0
        case .topNews:              return baseNewsModel?.topNews?.count ?? 0
        case .technicalAnalysis:    return baseNewsModel?.technicalAnalysis?.count ?? 0
        case .specialReport:        return baseNewsModel?.specialReport?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: DetailViewCell.className, for: indexPath) as! DetailViewCell
        switch newsType {
        case .breakingNews:
            breakingNewsDetails(indexPath, cell)
        case .topNews:
            topNewsDetails(indexPath, cell)
        case .technicalAnalysis:
            analysisNewsDetails(indexPath, cell)
        case .specialReport:
            specialReportDetails(indexPath, cell)
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch newsType {
        case .breakingNews:
            return headerView(title: baseNewsModel?.breakingNews?[section].title ?? "")
        case .topNews:
            return headerView(title: baseNewsModel?.topNews?[section].title ?? "")
        case .technicalAnalysis:
            return headerView(title: baseNewsModel?.technicalAnalysis?[section].title ?? "")
        case .specialReport:
            return headerView(title: baseNewsModel?.specialReport?[section].title ?? "")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 65
    }
    
    
    fileprivate func fetchImage(url:String,_ indexPath: IndexPath, _ cell: DetailViewCell) {
        self.beginLoad()
        self.baseNewsViewModel.getImage(url: url, completionHandler: { image in
            self.endLoad()
            DispatchQueue.main.async {
                cell.imageVw.image = image
            }
        })
    }
    
    fileprivate func breakingNewsDetails(_ indexPath: IndexPath, _ cell: DetailViewCell) {
        self.fetchImage(url: baseNewsModel?.breakingNews?[indexPath.section].headlineImageUrl ?? "", indexPath, cell)
        nodataLbl.isHidden = false
        cell.titleLbl.text = baseNewsModel?.breakingNews?[indexPath.section].description
        cell.subtitleLbl.text = baseNewsModel?.breakingNews?[indexPath.section].newsKeywords
        cell.onContinueClick = {[weak self] value in
            let url = self?.baseNewsModel?.breakingNews?[indexPath.section].url
            if let url = URL(string:url ?? "") {
                UIApplication.shared.open(url)
            }
        }
    }
    
    fileprivate func topNewsDetails(_ indexPath: IndexPath, _ cell: DetailViewCell) {
        self.fetchImage(url: baseNewsModel?.topNews?[indexPath.section].headlineImageUrl ?? "", indexPath, cell)
        nodataLbl.isHidden = true
        cell.titleLbl.text = baseNewsModel?.topNews?[indexPath.section].description
        cell.subtitleLbl.text = baseNewsModel?.topNews?[indexPath.section].newsKeywords
        cell.onContinueClick = {[weak self] value in
            let url = self?.baseNewsModel?.topNews?[indexPath.section].url
            if let url = URL(string:url ?? "") {
                UIApplication.shared.open(url)
            }
        }
    }
    
    fileprivate func analysisNewsDetails(_ indexPath: IndexPath, _ cell: DetailViewCell) {
        self.fetchImage(url: baseNewsModel?.technicalAnalysis?[indexPath.section].headlineImageUrl ?? "", indexPath, cell)
        nodataLbl.isHidden = true
        cell.titleLbl.text = baseNewsModel?.technicalAnalysis?[indexPath.section].description
        cell.subtitleLbl.text = baseNewsModel?.technicalAnalysis?[indexPath.section].newsKeywords
        cell.onContinueClick = {[weak self] value in
            let url = self?.baseNewsModel?.technicalAnalysis?[indexPath.section].url
            if let url = URL(string:url ?? "") {
                UIApplication.shared.open(url)
            }
        }
    }
    
    fileprivate func specialReportDetails(_ indexPath: IndexPath, _ cell: DetailViewCell) {
        self.fetchImage(url: baseNewsModel?.specialReport?[indexPath.section].headlineImageUrl ?? "", indexPath, cell)
        nodataLbl.isHidden = true
        cell.titleLbl.text = baseNewsModel?.specialReport?[indexPath.section].description
        cell.subtitleLbl.text = baseNewsModel?.specialReport?[indexPath.section].newsKeywords
        cell.onContinueClick = {[weak self] value in
            let url = self?.baseNewsModel?.specialReport?[indexPath.section].url
            if let url = URL(string:url ?? "") {
                UIApplication.shared.open(url)
            }
        }
    }
}

