//
//  ViewController.swift
//  Notes
//
//  Created by GTCSYS Mac Mini 1  on 26/11/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    @IBOutlet var label: UILabel!
    
    var models : [(title: String, note: String)]=[]
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate=self
        table.dataSource=self
        title = "Notes"
       
    }
    
    @IBAction func didTapNewNote() {
        guard let vc=storyboard?.instantiateViewController(identifier:"new") as? EntryViewController else { return }
        vc.title = "New Note"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completion = { noteTitle, note in
            self.models.append((title:noteTitle,note:note))
            self.label.isHidden=true
            self.table.isHidden=false
            self.table.reloadData()
        }
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        cell.detailTextLabel?.text = models[indexPath.row].note
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let vc=storyboard?.instantiateViewController(identifier: "notes") as? NoteViewController else { return }
        
        vc.title="Notes"
        navigationController?.pushViewController(vc, animated: true)
    }


}




