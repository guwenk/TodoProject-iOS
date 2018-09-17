//
//  Model.swift
//  TodoProject
//
//  Created by Admin on 17.09.2018.
//  Copyright © 2018 guwenk. All rights reserved.
//

import Foundation


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

var Todos: [TodoItem] = [TodoItem(id: 1, text: "What is love?", isCompleted: false),
                         TodoItem(id: 2, text: "Baby don't hurt me", isCompleted: false),
                         TodoItem(id: 3, text: "Don't hurt me", isCompleted: true),
                         TodoItem(id: 4, text: "No more", isCompleted: false)
                        ]

var Projects: [ProjectItem] = [
                                ProjectItem(id: 1, title: "Family", todos: [
                                    TodoItem(id: 1, text: "What is love?", isCompleted: false),
                                    TodoItem(id: 2, text: "Baby don't hurt me", isCompleted: false),
                                    TodoItem(id: 3, text: "Don't hurt me", isCompleted: true),
                                    TodoItem(id: 4, text: "No more", isCompleted: false),
                                    ]),
                                ProjectItem(id: 2, title: "Work", todos: [
                                    TodoItem(id: 5, text: "Never gonna give you up", isCompleted: false),
                                    TodoItem(id: 6, text: "Never gonna let you down", isCompleted: false),
                                    TodoItem(id: 7, text: "Never gonna run around and desert you", isCompleted: true),
                                    TodoItem(id: 8, text: "Never gonna make you cry", isCompleted: false),
                                    TodoItem(id: 9, text: "Never gonna say goodbye", isCompleted: false),
                                    TodoItem(id: 10, text: "Never gonna tell a lie and hurt you", isCompleted: false)
                                    ]),
                                ProjectItem(id: 3, title: "Other", todos: [
                                    TodoItem(id: 11, text: "Push me", isCompleted: false),
                                    TodoItem(id: 12, text: "And then just touch me", isCompleted: false),
                                    TodoItem(id: 13, text: "Till I can get my satisfaction", isCompleted: true),
                                    TodoItem(id: 14, text: "Satisfaction", isCompleted: false),
                                    ]),
                                ]

func addTodo(text: String, project_id: Int){
    Todos.append(TodoItem(id: 0, text: text, isCompleted: false))
}

func toggleTodo(section: Int, row: Int){
    Projects[section].todos[row].isCompleted = !Projects[section].todos[row].isCompleted
    //Todos[index].isCompleted = !Todos[index].isCompleted
    //uploadData()
}

func uploadData(){
    //print(Todos)
}

func downloadData(){
    
}
