//
//  ViewController.swift
//  textfieldDelgate
//
//  Created by Mohan K on 24/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchText: UITextField!
   
    var tableView = UITableView()
    var array:[String] = ["mani", "ramu", "somu", "ahamed", "bhavani", "khanmani", "balu", "chitra", "ravi" , "dharani" , "ebinesar","jaga", "farina", "aparna", "hariharan","iniyavan", "gandhi", "laurel", "naveen", "oreo", "priyan", "quantum", "tharamani", "urvasi", "veera", "willliam", "whatson", "xavier", "yazh", "xavin", "zaman", "somu", "sekar" ]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchText.delegate = self
        
    }
}

extension ViewController:UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        tableViewSetup()
        if textField == searchText {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.tag = 10
            tableView.rowHeight = 80
            view.addSubview(tableView)
            tableViewAnimated(load: true)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == searchText{
            tableView.delegate = self
            tableView.dataSource = self
            tableView.tag = 10
            tableView.rowHeight = 80
            view.endEditing(true)
//            tableViewAnimated(load: true)

        }
        return true
    }
    func tableViewSetup() {
        tableView.frame = CGRect(x: 20,
                                 y: view.frame.height,
                                 width: view.frame.width - 40,
                                 height: view.frame.height - 170)
        tableView.layer.shadowColor = UIColor.darkGray.cgColor
        tableView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        tableView.layer.shadowOpacity = 1.0
        tableView.layer.cornerRadius = 10
        tableView.layer.shadowRadius = 2
        tableView.layer.masksToBounds = true
        tableView.register(UITableViewCell.self
                           , forCellReuseIdentifier: "searchText")
        
    }
    func tableViewAnimated(load:Bool) {
        if load {
            UIView.animate(withDuration: 0.2) {
                self.tableView.frame = CGRect(x: 20,
                                              y: 170,
                                              width: self.view.frame.width - 40,
                                              height: self.view.frame.height - 170)
            }
                
            }else{
                UIView.animate(withDuration: 0.2,  animations: {
                    self.tableView.frame = CGRect(x: 20,
                                                  y: self.view.frame.height,
                                                  width: self.view.frame.width - 40,
                                                  height: self.view.frame.height - -170)
                })
                { (done) in
                    for subView in self.view.subviews{
                        if subView .tag == 10 {
                            subView.removeFromSuperview()
                        }
                    }
                }
            }
        }
    }


extension ViewController: UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "searchText")
        cell.textLabel?.text = array[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableViewAnimated(load: false)
        searchText.text = array[indexPath.row]
    }
}
