//
//  ViewController.swift
//  DeepSwift
//
//  Created by Bimo Sekti Wicaksono on 22/08/23.
//

import UIKit

struct Topic {
    var name: String
    var storyboardName: String
    var viewName: String
}

class ViewController: UIViewController {

    @IBOutlet weak var topicsTableView: UITableView!
    
    let topics: [Topic] = [
        Topic(name: "Passing Data", storyboardName: "PassData", viewName: "MainPassDataVC"),
        Topic(name: "Tab Bar", storyboardName: "TabBar", viewName: "MainTabBarVC")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Topics"
        setupTableView()
    }
    
    func setupTableView() {
        topicsTableView.delegate = self
        topicsTableView.dataSource = self
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = topicsTableView.dequeueReusableCell(withIdentifier: "topicsCell", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = topics[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: topics[indexPath.row].storyboardName, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: topics[indexPath.row].viewName)
        self.navigationController?.pushViewController(vc, animated: true)
        topicsTableView.deselectRow(at: indexPath, animated: true)
    }
    
}
