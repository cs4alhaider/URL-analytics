//
//  ViewController.swift
//  Json4Swift demo
//
//  Created by Abdullah Alhaider on 3/16/18.
//

import UIKit
import Alamofire
import SVProgressHUD
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var jsonArray: [String]?
    let jsonURL = "https://api.myjson.com/bins/17rcy5"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //getJsonData()
        getLongURLFromGoogle()
    }

    
    
    
    func getJsonData(){
       
        guard let url = URL(string: jsonURL) else { return }
            URLSession.shared.dataTask(with: url) { (data, response, err) in
                guard let data = data else { return }
                
                do{
                    let expandedURL = try JSONDecoder().decode(AllURLData.self, from: data)
                    print(expandedURL)
                }catch let jsonError {
                    print(jsonError)
                    let noConnection = UIAlertController(title: "Error! 😰", message: "Could not load data!", preferredStyle: .alert)
                    let dismiss = UIAlertAction(title: "OK", style: .default, handler: nil)
                    noConnection.addAction(dismiss)
                    self.present(noConnection, animated: true, completion: nil)
                }
            }.resume()
        }
    
    
    
    
    
    
    
    
    
    
    var shortUrlClicksAllTimes: String?
    var longUrlClicksAllTimes: String?
    
    var shortUrlClicksLastMonth: String?
    var longUrlClicksLastMonth: String?
    
    var shortUrlClicksLastWeek: String?
    var longUrlClicksLastWeek: String?
    
    var shortUrlClicksLastDay: String?
    var longUrlClicksLastDay: String?
    
    var shortUrlClicksLastTwoHours: String?
    var longUrlClicksLastTwoHours: String?
    
    
    func getLongURLFromGoogle(){
        
        Alamofire.request(jsonURL, method: .get).responseJSON { (responds) in
            
//            if let JSON = responds.result.value {
//                print(JSON)
//            }
            if responds.result.isSuccess {
                //print(responds)
                
                let urlJSON : JSON = JSON(responds.result.value!)
                
                self.shortUrlClicksAllTimes = urlJSON["analytics"]["allTime"]["shortUrlClicks"].stringValue
                self.longUrlClicksAllTimes = urlJSON["analytics"]["allTime"]["longUrlClicks"].stringValue
                
                self.shortUrlClicksLastMonth = urlJSON["analytics"]["month"]["shortUrlClicks"].stringValue
                self.longUrlClicksLastMonth = urlJSON["analytics"]["month"]["longUrlClicks"].stringValue
                
                self.shortUrlClicksLastWeek = urlJSON["analytics"]["week"]["shortUrlClicks"].stringValue
                self.longUrlClicksLastWeek = urlJSON["analytics"]["week"]["longUrlClicks"].stringValue
                
                self.shortUrlClicksLastDay = urlJSON["analytics"]["day"]["shortUrlClicks"].stringValue
                self.longUrlClicksLastDay = urlJSON["analytics"]["day"]["longUrlClicks"].stringValue
                
                self.shortUrlClicksLastTwoHours = urlJSON["analytics"]["twoHours"]["shortUrlClicks"].stringValue
                self.longUrlClicksLastTwoHours = urlJSON["analytics"]["twoHours"]["longUrlClicks"].stringValue
                
                
                
                
                
                
                
                
                
                
                print(self.shortUrlClicksAllTimes!)
                print(self.longUrlClicksAllTimes!)
                
                print(self.shortUrlClicksLastMonth!)
                print(self.longUrlClicksLastMonth!)
                
                print(self.shortUrlClicksLastWeek!)
                print(self.longUrlClicksLastWeek!)
                
                print(self.shortUrlClicksLastDay!)
                print(self.longUrlClicksLastDay!)
                
                print(self.shortUrlClicksLastTwoHours!)
                print(self.longUrlClicksLastTwoHours!)
                
            }
        }
        
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}// End of ViewController class

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonArray?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "JsonCel", for: indexPath) as! JsonCell
        
        
        return cell
    }
    
}
