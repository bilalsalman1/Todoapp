import 'package:flutter/material.dart';
import 'package:todo_app/styles/colors.dart';

class NewTask extends StatelessWidget {
  final Function(String, String) updateTask;

  final String title;
  final String description;
  final bool isEditing;

  const NewTask(
      {super.key,
      required this.updateTask,
      required this.title,
      required this.description,
       required this.isEditing});

 

  @override
 
  @override
  Widget build(BuildContext context) {
 TextEditingController titleController = TextEditingController(text: title);
  TextEditingController descriptionController = TextEditingController(text: description);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.textFieldColor.withOpacity(0.4),
                  label: const Text('Title'),
                  labelStyle: TextStyle(color: AppColors.primaryColor),
                  hintText: 'Enter Text',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(12))),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.textFieldColor.withOpacity(0.4),
                  label: const Text('Description'),
                  labelStyle: TextStyle(color: AppColors.primaryColor),
                  hintText: 'Enter Text',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(12))),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonColor),
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: AppColors.primaryColor),
                    ),),
                ElevatedButton(
                  onPressed: () {
                    String title = titleController.text.trim();
                    String description = descriptionController.text.trim();
                    if (title.isEmpty || description.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Both fields are required')));
                    } else {
                      updateTask(title, description);
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonColor),
                  child: Text(isEditing? 'Update':
                    'Add',
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                ),
              
               
                   
              ],
            ),
          ],
        ),
      ),
    );
  }
}
