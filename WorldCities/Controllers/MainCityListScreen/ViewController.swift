//
//  ViewController.swift
//  TestApp
//
//  Created by Nishant Sharma on 1/20/18.
//  Copyright © 2018 Nishant. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    //MARK:- Outlets
    @IBOutlet weak var cityTableView: UITableView!
    @IBOutlet weak var titleHeaderLabel: UILabel!
    @IBOutlet weak var searchBarForCityTableView: UISearchBar!
    //MARK:- Member Variables
    let searchController = UISearchController(searchResultsController: nil)
    let PRODUCT_CELL_IDENTIFIER = "CitiesCellIdentifier"
    let wcViewModel:WCViewModel = WCViewModel()
    //MARK:- ViewLifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        cityTableView.rowHeight = 65
        self.searchBarForCityTableView.showsCancelButton = false
        self.navigationController?.navigationBar.isHidden = false
        //Add right button on navigation bar for providing more options to user - Ascending, Descending
        let rightButtonItem = UIBarButtonItem.init(title: "More", style: .done, target: self, action: #selector(ViewController.moreButtonTitleHeader(_:)))
        self.navigationItem.rightBarButtonItem = rightButtonItem
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Passing detail of city to DetailViewController
        if segue.identifier == "detailSeque"{
            if let indexPath = self.cityTableView.indexPathForSelectedRow{
                let detailVC:DetailViewController = segue.destination as! DetailViewController
                if wcViewModel.citiesArrToDisplay.count > indexPath.row{
                    detailVC.cityDetail = wcViewModel.citiesArrToDisplay[indexPath.row]
                }
            }
        }
    }
    //MARK:- MoreButton Action Handler
    @IBAction func moreButtonTitleHeader(_ sender: Any) {
        self.searchBarForCityTableView.resignFirstResponder()
        let alertController = UIAlertController(title: "", message: "Sort the list by population", preferredStyle: .actionSheet)
        // Change Title With Color and Font:
        
        let myString  = "Sort the list by population"
        var myMutableString = NSMutableAttributedString()
        myMutableString = NSMutableAttributedString(string: myString as String, attributes: [NSAttributedStringKey.font:UIFont(name: "Georgia", size: 20.0)!])
        myMutableString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.blue, range: NSRange(location:0,length:myString.count))
        alertController.setValue(myMutableString, forKey: "attributedMessage")
        
        let ascButton = UIAlertAction(title: "Ascending", style: .default, handler: { (action) -> Void in
            print("Ascending button tapped")
            DispatchQueue.global().async {
                self.wcViewModel.sortContentByOrder("Ascending", completionBlock: {
                    DispatchQueue.main.async { [unowned self] in
                        self.cityTableView.reloadData()
                    }
                })
            }
            
        })
        
        let  descButton = UIAlertAction(title: "Descending", style: .default, handler: { (action) -> Void in
            print("Descending button tapped")
            DispatchQueue.global().async { [unowned self] in
                self.wcViewModel.sortContentByOrder("Descending", completionBlock: {
                    DispatchQueue.main.async { [unowned self] in
                        self.cityTableView.reloadData()
                    }
                })
            }
        })
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) -> Void in
            print("cancel button tapped")
        })
        alertController.addAction(ascButton)
        alertController.addAction(descButton)
        alertController.addAction(cancelButton)
        
        self.navigationController?.present(alertController, animated: true, completion: nil)
    }
}
//MARK:- UITableView Delegate Methods
extension ViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wcViewModel.citiesArrToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PRODUCT_CELL_IDENTIFIER) as! WCTableViewCell
        if wcViewModel.citiesArrToDisplay.count > indexPath.row{
            let city = wcViewModel.citiesArrToDisplay[indexPath.row]
            cell.updateWithInfo(modelObj: city)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
        self.searchBarForCityTableView.resignFirstResponder()
    }
}
// MARK: - UISearchBar Delegate
extension ViewController:UISearchBarDelegate{
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty{
            wcViewModel.updateOriginalArrayOfCities()
            cityTableView.reloadData()
        }else{
            DispatchQueue.global().async { [unowned self] in
                self.wcViewModel.filterContentForSearchText(searchText, completionBlock: {
                    DispatchQueue.main.async { [unowned self] in
                        self.cityTableView.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
                        self.cityTableView.reloadData()
                    }
                })
            }
        }
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        // Stop doing the search stuff
        // and clear the text in the search bar
        searchBar.text = ""
        // Hide the cancel button
        searchBar.resignFirstResponder()
        wcViewModel.updateOriginalArrayOfCities()
        cityTableView.reloadData()
    }
}



