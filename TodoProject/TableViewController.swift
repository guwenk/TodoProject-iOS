import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet weak var toAddTodoViewButton: UIBarButtonItem!
    
    let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    let reloadButton = UIButton(type: UIButtonType.system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigationItem.rightBarButtonItem?.isEnabled = false
        
        reloadButton.frame = CGRect(x: tableView.center.x - 75, y: tableView.center.y - 25, width: 150, height: 50)
        reloadButton.setTitle("Reload", for: .normal)
        reloadButton.titleLabel?.font = UIFont(name: "OpenSans-Regular", size: 35)
        reloadButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        activityIndicatorView.startAnimating()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        downloadData(controller: self)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        downloadData(controller: self)
    }
    
    func todoToggle(){
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return Projects.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: "SectionHeader") as! TableViewSection
        header.labelTitle?.text = Projects[section].title
        header.isUserInteractionEnabled = false
        return header
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Projects[section].todos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TableViewCell
        cell.checkbox.isUserInteractionEnabled = false
        cell.labelText?.text = Projects[indexPath.section].todos[indexPath.row].text
        
        if Projects[indexPath.section].todos[indexPath.row].isCompleted {
            cell.checkbox.checkState = .checked
        } else {
            cell.checkbox.checkState = .unchecked
        }
        cell.syncLabel()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath) as! TableViewCell
        
        toggleTodo(section: indexPath.section, row: indexPath.row, cell: cell)
    }
}
