//
//  ViewController.swift
//  aaaa
//
//  Created by J_Min on 2021/08/08.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var array = [String]()
    var lastId = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        array = UserDefaults.standard.array(forKey: "aa") as? [String] ?? [] // 저장된 array값 불러오기 key: "aa"
        lastId = UserDefaults.standard.integer(forKey: "bb") // 저장된 lastId 불러오기 key: "bb"
    }
    
    @IBAction func btnAdd(_ sender: Any) {
        
        let nextId = lastId + 1
        array.append(String(nextId))
        lastId = nextId
        tableView.reloadData()
        
    }
    @IBAction func btnSave(_ sender: Any) { // save버튼 누를시
        UserDefaults.standard.set(array, forKey: "aa") // array값 저장 key: "aa"
        UserDefaults.standard.set(lastId, forKey: "bb") // lastId 저장 key: "bb"
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? tableViewCell else {
            return UITableViewCell()
        }
        cell.lbl.text = array[indexPath.row]
        return cell
    }
    
}


class tableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbl: UILabel!
}

