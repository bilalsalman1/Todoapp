import 'package:flutter/material.dart';
import 'package:todo_app/styles/colors.dart';

import 'package:todo_app/models/new_task.dart';
import 'package:todo_app/styles/text_styles.dart';
import 'package:todo_app/models/todo_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.email});
  final String email;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> todolist = [];
  bool isEditing = false;
  int? index;

  void addTask(String title, String description) {
    setState(
      () {
        todolist.add(
          {'title': title, 'description': description, 'isCompleted': false},
        );
      },
    );
  }

  void editTask(int index, String title, String description) {
    setState(() {
      todolist[index]['title'] = title;
      todolist[index]['description'] = description;
    });
  }

  void deleteTask(int index) {
    setState(() {
      todolist.removeAt(index);
    });
  }

  void showModal({int? index}) {
    String title = index != null ? todolist[index]['title'] : '';
    String description = index != null ? todolist[index]['title'] : '';
    showModalBottomSheet(
        context: context,
        builder: (context) => NewTask(
            title: title,
            description: description,
            isEditing: index != null,
            updateTask: (title, description) {
              if (index != null) {
                editTask(index, title, description);
              } else {
                addTask(title, description);
              }
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModal();
        },
        backgroundColor: AppColors.buttonColor,
        child: Icon(
          Icons.add,
          color: AppColors.primaryColor,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.more_vert, color: Colors.white),
                      CircleAvatar(
                        radius: 22,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 65, left: 25),
                  child: Row(
                    children: [
                      Text(
                        'Hi ${widget.email}!',
                        style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 85, left: 25),
                  child: Row(
                    children: [
                      Text(
                        'Welcome to \nNotes!',
                        style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: Row(
                children: [
                  Text('My Tasks', style: TextStyles.todoListHeading),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: todolist.length,
                itemBuilder: (context, index) => TodoTile(
                  title: todolist[index]['title'],
                  description: todolist[index]['description'],
                  isCompleted: todolist[index]['isCompleted'],
                  onChanged: (bool? value) {
                    setState(() {
                      todolist[index]['isCompleted'] = value;
                    });
                  },
                  onEdit: () {
                    showModal(index: index);
                  },
                  onDelete: () {
                    deleteTask(index);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
