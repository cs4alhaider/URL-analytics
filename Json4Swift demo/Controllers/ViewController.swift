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

var longURL: String?
var shortURL: String?
var status: String?
var created: String?

var shortUrlClicksAllTimes: String?
var longUrlClicksAllTimes: String?

var platformsIdAllTime: [String]?
var platformsCountAllTime: [String]?

var countriesIdAllTime: [String]?
var countriesCountAllTime: [String]?


var shortUrlClicksLastMonth: String?
var longUrlClicksLastMonth: String?

var shortUrlClicksLastWeek: String?
var longUrlClicksLastWeek: String?

var shortUrlClicksLastDay: String?
var longUrlClicksLastDay: String?

var shortUrlClicksLastTwoHours: String?
var longUrlClicksLastTwoHours: String?



class ViewController: UIViewController {

    
    var data : [CITreeViewData] = []
    var treeView:CITreeView!
    
    let treeViewCellIdentifier = "TreeViewCellIdentifier"
    let treeViewCellNibName = "CITreeViewCell"
    
    var jsonArray: [String]?
    let jsonURL = "https://api.myjson.com/bins/17rcy5"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getLongURLFromGoogle()
        
    }
    
    func showTheTable(){
        
        SVProgressHUD.show(withStatus: "Customizing data ...")
        data = CITreeViewData.getDefaultCITreeViewData()
        treeView = CITreeView.init(frame: self.view.bounds, style: UITableViewStyle.plain)
        treeView.treeViewDelegate = self
        treeView.treeViewDataSource = self
        treeView.collapseNoneSelectedRows = false
        treeView.register(UINib(nibName: treeViewCellNibName, bundle: nil), forCellReuseIdentifier: treeViewCellIdentifier)
        self.view.addSubview(treeView)
        
        
        SVProgressHUD.showSuccess(withStatus: "Done")
        SVProgressHUD.dismiss(withDelay: 1.5)
    }
    
    
    func getLongURLFromGoogle(){
        
        Alamofire.request(jsonURL, method: .get).responseJSON { (responds) in
            
            //if let JSON = responds.result.value {
            //    print(JSON)
            //}
            
            SVProgressHUD.show(withStatus: "Loading data from server ...")
            
            if responds.result.isSuccess {
                //print(responds)
                
                let urlJSON : JSON = JSON(responds.result.value!)
                
                shortURL = urlJSON["id"].stringValue
                longURL = urlJSON["longUrl"].stringValue
                status = urlJSON["status"].stringValue
                created = urlJSON["created"].stringValue
                
                shortUrlClicksAllTimes = urlJSON["analytics"]["allTime"]["shortUrlClicks"].stringValue
                longUrlClicksAllTimes = urlJSON["analytics"]["allTime"]["longUrlClicks"].stringValue
                
                platformsIdAllTime = urlJSON["analytics"]["allTime"]["platforms"].arrayValue.map({$0["id"].stringValue})
                platformsCountAllTime = urlJSON["analytics"]["allTime"]["platforms"].arrayValue.map({$0["count"].stringValue})
                
                print(platformsIdAllTime!)
                print(platformsCountAllTime!)
                
                countriesIdAllTime = urlJSON["analytics"]["allTime"]["countries"].arrayValue.map({$0["id"].stringValue})
                countriesCountAllTime = urlJSON["analytics"]["allTime"]["countries"].arrayValue.map({$0["count"].stringValue})
                
                print(countriesIdAllTime!)
                print(countriesCountAllTime!)
                
                shortUrlClicksLastMonth = urlJSON["analytics"]["month"]["shortUrlClicks"].stringValue
                longUrlClicksLastMonth = urlJSON["analytics"]["month"]["longUrlClicks"].stringValue
                
                shortUrlClicksLastWeek = urlJSON["analytics"]["week"]["shortUrlClicks"].stringValue
                longUrlClicksLastWeek = urlJSON["analytics"]["week"]["longUrlClicks"].stringValue
                
                shortUrlClicksLastDay = urlJSON["analytics"]["day"]["shortUrlClicks"].stringValue
                longUrlClicksLastDay = urlJSON["analytics"]["day"]["longUrlClicks"].stringValue
                
                shortUrlClicksLastTwoHours = urlJSON["analytics"]["twoHours"]["shortUrlClicks"].stringValue
                longUrlClicksLastTwoHours = urlJSON["analytics"]["twoHours"]["longUrlClicks"].stringValue
                
                SVProgressHUD.dismiss()
                
                self.showTheTable()
                
            }else{
                SVProgressHUD.showError(withStatus: "Error!")
                SVProgressHUD.dismiss(withDelay: 2)
            }
        }
        
    }
    
    
    
    
    
}// End of ViewController class

extension ViewController : CITreeViewDelegate {
    func treeView(_ treeView: CITreeView, heightForRowAt indexPath: IndexPath, withTreeViewNode treeViewNode: CITreeViewNode) -> CGFloat {
        return 45
    }
    
    func treeView(_ treeView: CITreeView, didSelectRowAt treeViewNode: CITreeViewNode) {
    }
    
    func willExpandTreeViewNode(treeViewNode: CITreeViewNode, atIndexPath: IndexPath) {
        
    }
    
    func didExpandTreeViewNode(treeViewNode: CITreeViewNode, atIndexPath: IndexPath) {
        
        
        
    }
    
    func willCollapseTreeViewNode(treeViewNode: CITreeViewNode, atIndexPath: IndexPath) {
        
    }
    
    func didCollapseTreeViewNode(treeViewNode: CITreeViewNode, atIndexPath: IndexPath) {
    }
    
    
}

extension ViewController : CITreeViewDataSource {
    
    
    func treeView(_ treeView: CITreeView, atIndexPath indexPath: IndexPath, withTreeViewNode treeViewNode: CITreeViewNode) -> UITableViewCell {
        let cell = treeView.dequeueReusableCell(withIdentifier: treeViewCellIdentifier) as! CITreeViewCell
        let dataObj = treeViewNode.item as! CITreeViewData
        cell.nameLabel.text = dataObj.name
        cell.setupCell(level: treeViewNode.level)
        
        
        return cell;
        
    }
    
    func treeViewSelectedNodeChildren(for treeViewNodeItem: Any) -> [Any] {
        if let dataObj = treeViewNodeItem as? CITreeViewData {
            return dataObj.children
        }
        return []
        
    }
    
    func treeViewDataArray() -> [Any] {
        return data
    }
}

