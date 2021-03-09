//
//  ListsTableViewController.swift
//  NoteScanner
//
//  Created by Roger Navarro on 5/2/20.
//  Copyright © 2020 Sheetal . All rights reserved.
//

import UIKit
import AWSAppSync
import AWSMobileClient


class NotesTableViewController: UITableViewController {
    
    
    //MARK: - Properties
    private struct Identifiers {
        static let noteTableCell = "NoteTableCell"
        static let showDetailSegue = "ShowNoteDetail"
        static let addNoteSegue = "AddNote"
    }
    
    var appSyncClient: AWSAppSyncClient?
    var notes: [Note] = []
    
    var nextToken: String?
    var fixedLimit: Int = 100 // predefined pagination size
    var isLoadInProgress: Bool = false
    var needUpdateNotes: Bool = false
    var lastOpenedIndex: Int = -1
    var eventList: [ListNotesQuery.Data.ListNote.Item?] = []

    //MARK: - View Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if needUpdateNotes {
            needUpdateNotes = false
            nextToken = nil
            fetchAllNotesUsingCachePolicy(.returnCacheDataAndFetch)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.appSyncClient = (UIApplication.shared.delegate as! AppDelegate).appSyncClient
        let refreshControlCustom = UIRefreshControl()
        refreshControlCustom.addTarget(self,
                                 action: #selector(handleRefresh(_:)),
                                 for: .valueChanged)
        tableView.refreshControl = refreshControlCustom
        fetchAllNotesUsingCachePolicy(.returnCacheDataAndFetch)
    }
    
    //MARK: - Functions
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        nextToken = nil
        fetchAllNotesUsingCachePolicy(.fetchIgnoringCacheData)
    }
    
    func fetchAllNotesUsingCachePolicy(_ cachePolicy: CachePolicy) {
        if isLoadInProgress {
            return
        }
        
        isLoadInProgress = true
        
        tableView.refreshControl?.beginRefreshing()
        
        let thisUserIdFilterInput = ModelStringInput(eq: AWSMobileClient.default().identityId)
        let thisUserIdFilter = ModelNoteFilterInput(userId: thisUserIdFilterInput)
        let typeFilterInput = ModelStringInput(eq: "\(TextType.note)")
        let typeFilter = ModelNoteFilterInput(type: typeFilterInput)
        let queryFilters = [thisUserIdFilter, typeFilter]
        let filter = ModelNoteFilterInput(and: queryFilters)
       
        let query = ListNotesQuery(filter: filter, limit: fixedLimit, nextToken: nextToken)

        appSyncClient?.fetch(query: query, cachePolicy: cachePolicy) {[weak self] results, error in
            self?.tableView.refreshControl?.endRefreshing()
//            if self?.nextToken == nil, cachePolicy == .returnCacheDataAndFetch {
//                self?.lists.removeAll()
//            }
            self?.notes.removeAll()
            guard let self = self else { return }
            guard error == nil else {
                AlertUtils.showAlertWithOkButton(title: "Error", message: "No response fetching your notes", in: self)
                print("🔴 " + error!.localizedDescription)
                return
            }
            guard let results = results else { return }

            if let items = results.data?.listNotes?.jsonObject["items"] as? [[String:Any]] {
                items.forEach({ dict in
                    guard let json = try? JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted) else { return }
                    guard let note = try? JSONDecoder().decode(Note.self, from: json) else { return }
                    self.notes.append(note)
                })
                self.notes.sort(by: {$0.editedTime > $1.editedTime})
                self.tableView.reloadData()
                self.nextToken = results.data?.listNotes?.nextToken
                self.isLoadInProgress = false
            } else {
                print("🔴 0 notes found for this user")
            }
        }
    }
    
    func removeNote(_ note: Note) {
        let deleteInput = DeleteNoteInput(id: GraphQLID(note.id))
        let deleteMutation = DeleteNoteMutation(input: deleteInput)
        
        appSyncClient?.perform(mutation: deleteMutation, resultHandler: { [weak self] result, error in
            guard let self = self else { return }
            if error != nil {
                AlertUtils.showAlertWithOkButton(title: "Error", message: "Error deliting the note", in: self)
            } else {
                print("🟢 The record's has been deleted.")
            }
        })
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Identifiers.addNoteSegue {
            
            let nc = segue.destination as! UINavigationController
            let vc = nc.topViewController as! NoteDetailViewController
            vc.delegate = self
        } else if segue.identifier == Identifiers.showDetailSegue {
            let vc = segue.destination as! NoteDetailViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                vc.noteObject = notes[indexPath.row]
                vc.delegate = self
            }
        }
    }
    

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.noteTableCell, for: indexPath)
        cell.textLabel?.text = notes[indexPath.row].title
        cell.detailTextLabel?.text = DateUtils.convertToPrettyString(fromISOString: notes[indexPath.row].editedTime)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let item = notes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            removeNote(item)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    // pagination
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if !isLoadInProgress,
            indexPath.row > notes.count - 2,
            nextToken?.count ?? 0 > 0 {
            fetchAllNotesUsingCachePolicy(.fetchIgnoringCacheData)
        }
    }
}

extension NotesTableViewController: NoteDetailViewControllerDelegate {
    func newNoteCreated(noteObject: Note) {
        let createNoteInput = CreateNoteInput(id: noteObject.id,
                                              userId: noteObject.userId,
                                              title: noteObject.title,
                                              text: noteObject.text,
                                              editedTime: noteObject.editedTime,
                                              type: noteObject.type)
        let createNoteMutation = CreateNoteMutation(input: createNoteInput)
        appSyncClient?.perform(mutation: createNoteMutation, resultHandler: {[weak self] result, error in
            guard let self = self else { return }
            if error != nil {
                AlertUtils.showAlertWithOkButton(title: "Error", message: "Error while saving the note", in: self)
            } else {
                self.notes.append(noteObject)
                self.notes.sort(by: {$0.editedTime > $1.editedTime})
                self.fetchAllNotesUsingCachePolicy(.returnCacheDataAndFetch)
            }
        })
    }
    
    func dataDidSave(noteObject: Note) {
        let udpateNoteInput = UpdateNoteInput(id: noteObject.id, userId: noteObject.userId, title: noteObject.title, text: noteObject.text, editedTime: noteObject.editedTime, type: noteObject.type)
        let noteMutation = UpdateNoteMutation(input: udpateNoteInput)
        appSyncClient?.perform(mutation: noteMutation, resultHandler: {[weak self] result, error in
            guard let self = self else { return }
            if error != nil {
                AlertUtils.showAlertWithOkButton(title: "Error", message: "Error while saving the note", in: self)
            } else {
                self.notes.sort(by: {$0.editedTime > $1.editedTime})
                self.fetchAllNotesUsingCachePolicy(.returnCacheDataAndFetch)
            }
        })
    }
}
