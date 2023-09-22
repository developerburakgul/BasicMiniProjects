//
//  ViewController.swift
//  DataFilterWithNSPredicate
//
//  Created by Burak Gül on 16.09.2023.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var cities : [City] = [
    ]
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let searchController = UISearchController()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //        performRequest()
        loadDataBase()
        tableView.dataSource = self
        navigationItem.searchController = searchController
        navigationItem.searchController?.searchBar.delegate = self
        
    }
    
    
    
}

// database functions
extension ViewController {
    
    
    func saveDataBase() {
        do {
            try context.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
    }
    
    func loadDataBase() {
        
        cities = []
        let fetchRequest:NSFetchRequest<City> = NSFetchRequest.init(entityName: "City")
        
        do {
            cities = try context.fetch(fetchRequest)
            print("load data is successful")
        }
        catch {
            print("load data is not successful \(error)")
        }
        tableView.reloadData()
        
        
        
    }
    
}


extension ViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
            
            loadDataBase()
        }else {
            let fetchRequest: NSFetchRequest<City> = City.fetchRequest()
            
            
            
            let predicate =             NSCompoundPredicate(
                type: .and,
                subpredicates: [
                    
                    NSPredicate(format: "name BEGINSWITH[cd] %@", searchBar.text!)
                    
                ]
            )
            
            
            
            
            
            fetchRequest.predicate = predicate
            fetchRequest.sortDescriptors = [NSSortDescriptor(key: "plaque", ascending: true)]
            
            
            
            do {
                cities = try context.fetch(fetchRequest)
                print("filtered data is successful")
            }
            catch {
                print("filtered data is not successful \(error)")
            }
            tableView.reloadData()
            
        }
        
        // nspredicate
    }
}

//MARK: - TableViewDataSource Functions
extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(cities[indexPath.row].plaque) " + cities[indexPath.row].name!
        return cell
        
    }
    
    
}






////MARK: - JSON functions
//
//extension ViewController {
//
//
////    func performRequest(){
////        // step 1 create a url
////        guard let url = URL(string: "https://gist.githubusercontent.com/9ssi7/1942cd52598bd12de91c37fc8fcfc464/raw/275faba2386502848f4245e9046c18c9c361ffd5/cities.json")else {return }
////        // step 2 create a url session
////        let session = URLSession(configuration: .default)
////        // step 3 give a urlSession a task
////        let task = session.dataTask(with: url) { data, response, error in
////            if error != nil {
////                print("Hata oluştu: \(error!.localizedDescription)")
////            }
////            if let safeData = data {
////                self.saveCitiesFromJSONToArray(safeData)
////            }
////        }
////        // step 4 start the task
////        task.resume()
////
////    }
////
////    func saveCitiesFromJSONToArray(_ data : Data)  {
////        let decoder = JSONDecoder()
////        do {
////            let decodedData = try decoder.decode([String: String].self, from: data)
////            for (code, name) in decodedData {
////                let city = Sehir(name: name, plaque: code)
////                cities.append(city)
////            }
////        } catch {
////            print(error)
////        }
////
////    }
//
//}


