//
//  ViewController.swift
//  Fx Rates
//
//  Created by Lois-Anne Hall on 11/05/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    let listofRates = [ratesDetail](){
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.navigationItem.title = "\(self.listofRates.count) Rates Found"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 0
        }

        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            let rate = listofRates[indexPath.row]
            cell.textLabel?.text = rate

            return cell
        }
        
    }
}
extension ViewController: UISearchBarDelegate{
    func searchBarButtonClicked(_ searchBar: UISearchBar){
        guard let searchBarText = searchBar.text else { return}
        let ratesRequest = RateRequest(ratesCode: searchBarText)
        ratesRequest.getRates{[weak self] result in
            switch result{
            case .failure(let error):
                print(error)
            case .success(let Rates):
                self?.listofRates = Rates
            
            }
        }
    
    }
}
   
//    @IBOutlet weak var picker: UIPickerView!
//
//    var pickerData: [String] = [String]()
//
//    //var selectedValue = pickerData[pickerView.selectedRowInComponent(0)]
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        picker.delegate = self
//        picker.dataSource = self
//        pickerData = ["AED","AFN","ALL","AMD","ANG","AOA","ARS","AUD","AWG","AZN","BAM","BBD","BDT","BGN","BHD","BIF","BMD","BND","BOB","BRL","BSD","BTN","BWP","BYN","BYR","BZD","CAD","CDF","CHF","CLF","CLP","CNY","COP","CRC","CUC","CUP","CVE","CZK","DJF","DKK","DOP","DZD","EGP","ERN","ETB","EUR","FJD","FKP","GBP","GEL","GGP","GHS","GIP","GMD","GNF","GTQ","GYD","HKD","HNL","HRK","HTG","HUF","IDR","ILS","IMP","INR","IQD","IRR","ISK","JEP","JMD","JOD","JPY","KES","KGS","KHR","KMF","KPW","KRW","KWD","KYD","KZT","LAK","LBP","LKR","LRD","LSL","LTL","LVL","LYD","MAD","MDL","MGA","MKD","MMK","MNT","MOP","MRO","MUR","MVR","MWK","MXN","MYR","MZN","NAD","NGN","NIO","NOK","NPR","NZD","OMR","PAB","PEN","PGK","PHP","PKR","PLN","PYG","QAR","RON","RSD","RUB","RWF","SAR","SBD","SCR","SDG","SEK","SGD","SHP","SLL","SOS","SRD","STD","SVC","SYP","SZL","THB","TJS","TMT","TND","TOP","TRY","TTD","TWD","TZS","UAH","UGX","USD","UYU","UZS","VEF","VND","VUV","WST","XAF","XAG","XAU","XDR","XOF","XPF","YER","ZAR","ZMK","ZMW","ZWL"]
//
//    }
//
//
//    @IBAction func addSubscription(_ sender: UIButton) {
//        // The user taps this to add the current base currency and conversion currency to add it to their subscriptions list.
//
//        //guard let vc = storyboard?.instantiateViewController(identifier: "addSubscription") as? AddSubController else{return}
//    }
//
//    @IBAction func convert(_ sender: UIButton) {
//        //converts the base rate to the user selected currency after pulling information from the API
//    }
//
//    @IBAction func viewSub(_ sender: UIButton) {
//        //view all current subscriptions
//        //guard let vc = storyboard?.instantiateViewController(identifier: "AddSubController") as? AddSubController else{return}
//    }
//}
//
//extension ViewController: UIPickerViewDataSource{
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return pickerData.count
//    }
//
//}
//
//extension ViewController: UIPickerViewDelegate{
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return pickerData[row]
//    }
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        let valueSelected = pickerData[row] as String
//    }
//}
//
//extension ViewController: UISearchBarDelegate{
//    func searchBarButtonClicked(_ searchBar: UISearchBar){
//        guard let searchValue = searchBar.text else {
//            return
//        }
        //
//    }
//}


