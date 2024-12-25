//
//  MMFFlipFlopHistory.swift
//  FlipMania
//
//  Created by jin fu on 2024/12/25.
//


import UIKit
import CoreData

class FlipFlopHistoryViewController: FlipBaseController {
    
    @IBOutlet weak var tblView: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var gameHistory = [FlipGameHistoryDATA]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchGameHistoryDataFromCoreData()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        if let myColor = UserDefaults.standard.colorForKey(key: "myColor") { // get color
            self.view.backgroundColor = myColor
        }
        showBackButton(isHide: false)
    }
    
    private func fetchGameHistoryDataFromCoreData() {
        do {
            let item = try context.fetch(GameHistory.fetchRequest())
            gameHistory.removeAll()
            
            item.enumerated().forEach { index, object in
                gameHistory.append(FlipGameHistoryDATA(id: object.id, status: object.status, dateTime: object.dateTime))
            }
            
            tblView.delegate = self
            tblView.dataSource = self
            tblView.reloadData()
        }
        catch {
            print("READ ERROR")
        }
    }
}

extension FlipFlopHistoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (gameHistory.count == 0) {
            tableView.setEmptyView(title: "\n\n\nNo Data Available", message: "")
            return 0
        } else {
            tableView.restore()
            return gameHistory.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: FlipHistoryCell.cellID) as? FlipHistoryCell {
            
            let data = gameHistory[indexPath.row]
            
            cell.lblLable1.text = data.status?.uppercased()
            cell.lblLable2.text = data.dateTime
            
            if data.status == "Won" {
                cell.imgBG.image = UIImage(named: "ic_win")
            } else {
                cell.imgBG.image = UIImage(named: "ic_loose")
            }
            
            return cell
            
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return FlipHistoryCell.cellHeight
    }
}
