//
//  TablesViewController.swift
//  ChatAppPractice
//
//  Created by 松岡裕介 on 2019/04/17.
//  Copyright © 2019 松岡裕介. All rights reserved.
//

import UIKit

class ChatGroup {
    var groupId: String
    var groupName: String
    var index: Int
    
    init() {
        self.groupId = ""
        self.groupName = ""
        self.index = 0
    }
    
    init(groupName: String) {
        self.groupId = ""
        self.groupName = ""
        self.index = 0
    }
}

class ChatTableViewController: UIViewController,UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {

    var navBar = UINavigationBar()
    var searchBar = UISearchBar()
    var tableView: UITableView?
    
    var items:[ChatGroup] = []
    
    let public1 = ChatGroup()
    let public2 = ChatGroup()
    let public3 = ChatGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        public1.groupName = "public 1"
        public2.groupName = "public 2"
        public3.groupName = "public 3"
        items.append(public1)
        items.append(public2)
        items.append(public3)

        
        view = UIView()
        view.backgroundColor = .white
        
        //navItem
        let navItem: UINavigationItem = UINavigationItem(title: "Chats")
        navItem.leftBarButtonItem = UIBarButtonItem(title: "< BACK", style: .plain, target: self, action: #selector(self.returnView))
        navBar.pushItem(navItem, animated: false)

        //searchBar
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        searchBar.placeholder = "Buscar"
        
        //TableView
        self.tableView = {
            let tableView = UITableView(frame: self.view.bounds, style: .plain)
            tableView.autoresizingMask = [
                .flexibleWidth,
                .flexibleHeight
            ]
            tableView.delegate = self
            tableView.dataSource = self
            
            //tableView.separatorStyle = .singleLine
            self.tableView?.estimatedRowHeight = 90
            self.tableView?.rowHeight = UITableView.automaticDimension
            
            self.view.addSubview(tableView)
            return tableView
        }()
        
        
        
        
        loadConstraints()
        
        view.addSubview(navBar)
        view.addSubview(searchBar)
    }
    
    @objc func returnView() {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func loadConstraints() {
        
        navBar.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([
            navBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navBar.widthAnchor.constraint(equalTo: view.widthAnchor)
            ])
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([
            searchBar.topAnchor.constraint(equalTo: navBar.bottomAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        
        let tableView = self.tableView!
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if items.count > 0 {
            emptyMessage(message: "", tableView: self.tableView!)
            return 1
        } else {
            emptyMessage(message: "no data", tableView: self.tableView!)
            return 0
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default,
                                   reuseIdentifier: "aaa\(indexPath.section)-\(indexPath.row)")
        
        cell.textLabel?.text = self.items[indexPath.row].groupName

        // アクセサリに「DisclosureIndicator」を指定する場合
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let nextvc = ChatMessageViewController()
        //nextvc.setupController(toDo: toDo, parentController: self)
        //navigationController?.pushViewController(nextvc, animated: true)
        self.present(nextvc, animated: true, completion: nil)
    }
    
    func emptyMessage(message:String, tableView: UITableView) {
        let rect = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.height))
        let messageLabel = UILabel(frame: rect)
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 48)
        messageLabel.sizeToFit()
        
        tableView.backgroundView = messageLabel
        tableView.separatorStyle = .none
    }
}
