//
//  MainViewController.swift
//  TinyConsole
//
//  Created by Devran Uenal on 28.11.16.
//
//

import UIKit
import TinyConsole

class ViewController: UITableViewController {
    var tableViewDelegate: UITableViewDelegate
    var tableViewDataSource: UITableViewDataSource
    
    init() {
        tableViewDelegate = MainTableViewDelegate()
        tableViewDataSource = MainTableViewDataSource()
        super.init(style: UITableViewStyle.plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        tableViewDelegate = MainTableViewDelegate()
        tableViewDataSource = MainTableViewDataSource()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        (tableViewDataSource as? MainTableViewDataSource)?.registerCellsForTableView(self.tableView)
        tableView.delegate = tableViewDelegate
        tableView.dataSource = tableViewDataSource
        
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        setupNavigationItems()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        TinyConsole.print("Welcome to TinyConsole")
        TinyConsole.addMarker()
        TinyConsole.print("NOW", color: UIColor.red)
        TinyConsole.print("IN", color: UIColor.green)
        TinyConsole.print("COLOR", color: UIColor.blue)
        TinyConsole.addMarker()
    }
    
    func setupNavigationItems() {
        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(title: "Add Log", style: UIBarButtonItemStyle.plain, target: self, action: #selector(addLog))
        ]
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem( title: "Add Marker", style: UIBarButtonItemStyle.plain, target: self, action: #selector(addMarker)),
            UIBarButtonItem( title: "Clear", style: UIBarButtonItemStyle.plain, target: self, action: #selector(clear)),
        ]
    }
}

extension ViewController {
    @objc func addLog() {
        TinyConsole.print("Hello World")
    }
    
    @objc func clear() {
        TinyConsole.clear()
    }
    
    @objc func addMarker() {
        TinyConsole.addMarker()
    }
}
