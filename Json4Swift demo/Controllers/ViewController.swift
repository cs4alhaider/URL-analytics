//
//  ViewController.swift
//  Json4Swift demo
//
//  Created by Abdullah Alhaider on 3/16/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var jsonArray: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getJsonData()
    }

    
    
    
    func getJsonData(){
        
        let jsonURL = "https://api.myjson.com/bins/17rcy5"
       
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
