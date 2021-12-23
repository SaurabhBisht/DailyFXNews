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
    
    fileprivate func headerView() -> UIView? {
        let headerView = UIView()
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 103/255.0, green: 109/255.0, blue: 118/255.0, alpha: 1)
        label.text = "Sub Title"
        label.addCharacterSpacing()
        headerView.addSubview(label)
        let maxSize = CGSize(width: headerView.frame.size.width, height: 18)
        let size = label.sizeThatFits(maxSize)
        label.frame.size = size
        headerView.addConstraints([NSLayoutConstraint(item: label, attribute: .leading, relatedBy: .equal, toItem: headerView, attribute: .leading, multiplier: 1, constant: 19), NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: headerView, attribute: .top, multiplier: 1, constant: 18)])
        headerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
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
            self.fetchImage(url: baseNewsModel?.breakingNews?[indexPath.section].headlineImageUrl ?? "", indexPath, cell)
            
        case .topNews:               self.fetchImage(url: baseNewsModel?.topNews?[indexPath.section].headlineImageUrl ?? "", indexPath, cell)
        case .technicalAnalysis:     self.fetchImage(url: baseNewsModel?.technicalAnalysis?[indexPath.section].headlineImageUrl ?? "", indexPath, cell)
        case .specialReport:         self.fetchImage(url: baseNewsModel?.specialReport?[indexPath.section].headlineImageUrl ?? "", indexPath, cell)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
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
}

