//
//  LogInViewController.swift
//  ChatAppPractice
//
//  Created by 松岡裕介 on 2019/04/17.
//  Copyright © 2019 松岡裕介. All rights reserved.
//

import UIKit


class LogInViewController: UIViewController {

    var lblNickname = UILabel()
    var textNickname = UITextField()
    var btnStart = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view = UIView()
        view.backgroundColor = .white
        
        lblNickname.text = "Nickname"
        lblNickname.font = UIFont.systemFont(ofSize: 24)
        
        textNickname.borderStyle = .roundedRect
        textNickname.font = UIFont.systemFont(ofSize: 24)
        
        btnStart.backgroundColor = .darkGray
        btnStart.setTitle("START", for: .normal)
        btnStart.setTitleColor(.white, for: .normal)
        btnStart.titleLabel?.font = UIFont.systemFont(ofSize: 24)

        btnStart.addTarget(self, action: #selector(btnStartPush), for: .touchUpInside)
        
        //constraints
        loadConstraints()
        
        view.addSubview(lblNickname)
        view.addSubview(textNickname)
        view.addSubview(btnStart)
        // Do any additional setup after loading the view.
    }
    
    func loadConstraints() {
        
        lblNickname.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([
            lblNickname.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            lblNickname.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0),
            lblNickname.heightAnchor.constraint(equalToConstant: 40)
            ])
        
        textNickname.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([
            textNickname.topAnchor.constraint(equalTo: lblNickname.bottomAnchor, constant: 20.0),
            textNickname.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0),
            textNickname.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.0),
            
            textNickname.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        btnStart.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([
            btnStart.topAnchor.constraint(equalTo: textNickname.bottomAnchor, constant: 20.0),
            btnStart.leadingAnchor.constraint(equalTo: textNickname.leadingAnchor),
            btnStart.trailingAnchor.constraint(equalTo: textNickname.trailingAnchor),
            btnStart.heightAnchor.constraint(equalToConstant: 40)
            ])
    }
    
    @objc func btnStartPush(sender: UIButton){
        
        let nextvc = ChatTableViewController()
        //nextvc.setupController(toDo: ToDo(), parentController: self)
        self.present(nextvc, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
