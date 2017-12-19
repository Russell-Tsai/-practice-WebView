//
//  ViewController.swift
//  WebView
//
//  Created by 蔡松樺 on 19/12/2017.
//  Copyright © 2017 蔡松樺. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var sectionTitles = ["Leave Feedback","Follow US"]
    var sectionContents = [["Rate us on App Store","Tell us your feedback"],["Twitter","Facebook","Pinterest"]]
    var links = ["https://twitter.com/appcodamobile","https://facebook.com/appocodamobile","https://www.pinterest.com/appcoda/"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        
        //Clean tableFooterView
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                if let url = URL(string: "https://www.google.com.tw/"){
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }
            else if indexPath.row == 1 {
                performSegue(withIdentifier: "ShowWebView", sender: self)
            }
        case 1:
            if let url = URL(string:links[indexPath.row]) {
                let safariController = SFSafariViewController(url: url)
                present(safariController, animated: true, completion: nil)
            }
            
        default:
            break
        }
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

//MARK: - UITableViewDataSource
extension ViewController {
    //Multi-Section
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionContents[section].count
    }
    //Section title Setting
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = sectionContents[indexPath.section][indexPath.row]
        
        return cell
    }
    
}

