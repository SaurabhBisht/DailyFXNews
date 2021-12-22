//
//  DetailedNewsViewController.swift
//  DailyFXNews
//
//  Created by Saurabh Bisht on 22/12/2021.
//

import Foundation
import UIKit
import Combine

class DetailedNewsViewController: UIViewController, ObservableObject{
    
    var baseNewsViewModel = BaseNewsViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
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
        //label.addCharacterSpacing()
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
        return 300
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: DetailViewCell.className, for: indexPath) as! DetailViewCell
        
        self.baseNewsViewModel.getImage(url: Constants.Endpoints.baseDataURL, completionHandler: { image in
            DispatchQueue.main.async {
                cell.imageVw.image = image
            }
        })
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
}

