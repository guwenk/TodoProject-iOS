import Foundation
import Alamofire
import M13Checkbox

struct TodoItem: Codable {
    let id: Int
    let text: String
    var isCompleted: Bool
}
struct ProjectItem: Codable {
    let id: Int
    let title: String
    var todos: [TodoItem]
}

var Projects: [ProjectItem] = [
    ProjectItem(id: 1, title: "Семья", todos: [
        TodoItem(id: 1, text: "What is love?", isCompleted: false),
        TodoItem(id: 2, text: "Baby don't hurt me", isCompleted: false),
        TodoItem(id: 3, text: "Don't hurt me", isCompleted: true),
        TodoItem(id: 4, text: "No more", isCompleted: false),
        ]),
    ProjectItem(id: 2, title: "Работа", todos: [
        TodoItem(id: 5, text: "Never gonna give you up", isCompleted: true),
        TodoItem(id: 6, text: "Never gonna let you down", isCompleted: false),
        TodoItem(id: 7, text: "Never gonna run around and desert you", isCompleted: false),
        TodoItem(id: 8, text: "Never gonna make you cry", isCompleted: true),
        TodoItem(id: 9, text: "Never gonna say goodbye", isCompleted: false),
        TodoItem(id: 10, text: "Never gonna tell a lie and hurt you", isCompleted: false)
        ]),
    ProjectItem(id: 3, title: "Прочее", todos: [
        TodoItem(id: 11, text: "Push me", isCompleted: true),
        TodoItem(id: 12, text: "And then just touch me", isCompleted: false),
        TodoItem(id: 13, text: "Till I can get my satisfaction", isCompleted: false),
        ]),
]

func toggleTodo(section: Int, row: Int, cell: TableViewCell){
    Projects[section].todos[row].isCompleted = !Projects[section].todos[row].isCompleted
    cell.toggle()
    //post request
}

func addTodoItem(project_id: Int, text: String, controller: NewTodoTableViewController){
    Projects[project_id-1].todos.append(TodoItem(id: 0, text: text, isCompleted: false)) //to replace
    controller.dismiss(animated: true)
    //post request
}

func downloadData(controller: TableViewController){
    controller.tableView.reloadData()
    //TODO download data
}
