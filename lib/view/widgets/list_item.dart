
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management/model/task_model.dart';
import 'package:task_management/provider/provider.dart';

class TaskListItem extends ConsumerWidget {
  final Task task;

  const TaskListItem({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: Key(task.id.toString()),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        if (task.id != null) {
          ref.read(taskViewModelProvider.notifier).deleteTask(task.id!);
        }
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: ListTile(
            leading: Container(
              
          width: 80,
          height: 24,
          child: Center(child: Text(task.isCompleted ? "Complited": "Pending")),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            shape: BoxShape.rectangle,
            color: task.isCompleted ? Colors.green : Colors.red,
          ),
        ),
          title: Text(task.title),
          subtitle: Text(task.description),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Due: ${task.dueDate.day}/${task.dueDate.month}/${task.dueDate.year}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                'Created: ${task.createdAt.day}/${task.createdAt.month}/${task.createdAt.year}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}