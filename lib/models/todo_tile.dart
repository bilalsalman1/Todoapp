import 'package:flutter/material.dart';
import 'package:todo_app/styles/colors.dart';


class TodoTile extends StatelessWidget {
  const TodoTile({
    super.key,
    required this.title,
    required this.description,
    required this.onChanged,
    required this.isCompleted,
     required this.onEdit,
      required this.onDelete,
  });

  final String title;
  final String description;
  final Function(bool?)? onChanged;
  final bool isCompleted;
  final VoidCallback onEdit;
   final VoidCallback onDelete;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListTile(
        leading: Checkbox(value: isCompleted, onChanged: onChanged),
        tileColor: AppColors.primaryColor.withOpacity(0.4),
        title: Text(
          title,
          style: TextStyle(
              decoration: isCompleted
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
        ),
        subtitle: Text(description),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: onEdit,
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: onDelete,
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}

