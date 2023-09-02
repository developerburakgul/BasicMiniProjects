//
//  ViewController.swift
//  navNav
//
//  Created by Burak Gül on 1.09.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .never
        
        
       
              
    }
    
    
 

}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Color.colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = Color.colors[indexPath.row][0] as? String
        return cell
    }
    
    
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let anotherVC = storyboard?.instantiateViewController(withIdentifier: "second") as? SecondViewController else { return }
        let color = Color.colors[indexPath.row][1] as? UIColor
        anotherVC.backColor = color
        if let data = Color.colors[indexPath.row][0] as? String {
            
            anotherVC.text = data
            anotherVC.title = data
            
            
        }
        navigationController?.pushViewController(anotherVC, animated: true)
    }

    
   
}

