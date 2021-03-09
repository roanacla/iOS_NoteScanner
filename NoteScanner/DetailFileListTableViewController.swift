//
//  DetailFileListTableViewController.swift
//  NoteScanner
//
//  Created by Sheetal  on 4/18/20.
//  Copyright © 2020 Sheetal . All rights reserved.
//

import UIKit

class DetailFileListTableViewController: UITableViewController {
    
    var items = [String]()
    //@IBOutlet weak var dataReceived: UITableViewCell!
    var cellValue: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(cellValue ?? "")
        
        //Read from File
        let fileName = cellValue
        var filePath = ""
        
        // Find documents directory on device
        let dirs : [String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        
        if dirs.count > 0 {
            let dir = dirs[0] //documents directory
            filePath = dir.appending("/" + (fileName ?? ""))
            print("Local path = \(filePath)")
        } else {
            print("Could not find local directory to store file")
            return
        }
        do {
            // Read file content
            let contentFromFile = try NSString(contentsOfFile: filePath, encoding: String.Encoding.utf8.rawValue)
            print(contentFromFile)
            items = contentFromFile.components(separatedBy: ",")
            print(items)
        }
        catch let error as NSError {
            print("An error took place: \(error)")
        }
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

         let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell1", for: indexPath)

               // Configure the cell...
               cell.textLabel?.text = items[indexPath.row]
                //Hover Over change color
                cell.selectionStyle = UITableViewCell.SelectionStyle.gray
               return cell

    }
    
   //Customize Table View Header
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let label = UILabel(frame: CGRect(x: 15, y: 5, width: tableView.frame.width, height: 20))
        
        //Pick File Name only
        let fileNameString = cellValue
        let fileName = fileNameString!.firstIndex(of: ".")!
        let fName = fileNameString![...fileName]
        label.text = String(fName.dropLast())
        label.textAlignment = .center
        view.addSubview(label)
        view.backgroundColor = UIColor.lightGray

        return view
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
