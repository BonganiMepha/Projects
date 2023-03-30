//
//  ListViewController.swift
//  SipOnSomeCocktail
//
//  Created by Bongani Mepha on 2022/12/21.
//

import UIKit

class ListViewController: UIViewController, UISearchBarDelegate {

    var drinks = Drinks()
    var myDrinks: [String: String] = [:]
    var filteredData: [Drinks] = []


    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

    @IBAction func isFavourite(_ sender: Any) {
        
    }
    
    
    /*
     
     func setCell(isMarked: Bool){
         if isMarked {
             
             isFavourite.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
             
         }else {
             
     isFavourite.setImage(UIImage(systemName: "circle"), for: .normal)
         }
     }
     @IBAction func isFavouriteChecked(_ sender: Any){
         
         isCompleteDelegate?.toggleIsFavourite(for: self)
         
         
     }
 }
     */
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        loadData()
        
        drinks.getData {
            DispatchQueue.main.async {
                self.navigationItem.title = "Drink Shown: \(self.drinks.drinkArray.count)"
                self.tableView.reloadData()
            }
        }
    }

    func loadData() {
        let directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask) .first!
        let documentURL = directoryURL.appendingPathComponent("myDrinks").appendingPathExtension("json")

        guard let data = try? Data(contentsOf: documentURL) else { return }
        let jsonDecoder = JSONDecoder()
        do {
            myDrinks = try jsonDecoder.decode(Dictionary.self, from: data)
            tableView.reloadData()
        } catch {
            print("ERROR: Could not load data \(error.localizedDescription)")
        }
        

    }


    func saveData(){
        let directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask) .first!

        let documentURL = directoryURL.appendingPathComponent("myDrinks").appendingPathExtension("json")

        let jsonEncoder = JSONEncoder()
        let data = try? jsonEncoder.encode(myDrinks)
        do {
            try data?.write(to: documentURL, options: .noFileProtection)
        } catch {
            print("ERROR: Could not save data \(error.localizedDescription)")
        }

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail"{
            let destination = segue.destination as! DetailViewController
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            destination.drink = drinks.drinkArray[selectedIndexPath.row]
            destination.myDrinks = myDrinks 
        }
    }
    @IBAction func unwindFromDetail(segue: UIStoryboardSegue) {
        let source = segue.source as! DetailViewController
        myDrinks = source.myDrinks
        saveData()
        tableView.reloadData()
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinks.drinkArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if indexPath.row == drinks.drinkArray.count-1 && drinks.alphabetIndex < drinks.alphabet.count {
            drinks.getData {
                DispatchQueue.main.async {
                    self.navigationItem.title = "Drink Shown: \(self.drinks.drinkArray.count)"
                    self.tableView.reloadData()
                }
            }
        }

        cell.textLabel?.text = drinks.drinkArray[indexPath.row].strDrink
        let drinkName = drinks.drinkArray[indexPath.row].strDrink
        if let drinkRating = myDrinks[drinkName] {
            cell.detailTextLabel?.text = drinkRating

        } else {
            cell.detailTextLabel?.text = "-"
        }

        return cell
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       /* for sip in drinks.drinkArray {

            if sip.lowercased().contains(searchText.lowercased())
            
        }*/
    }
    
}

