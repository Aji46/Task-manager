import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management/model/task_model.dart';
import 'package:task_management/provider/provider.dart';
import 'package:task_management/view/editTaskPage.dart';

final currentTaskProvider = StateProvider.family<Task, Task>((ref, initialTask) {
  return initialTask;
});

class TaskDetailPage extends ConsumerWidget {
  final Task task;
  const TaskDetailPage({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTask = ref.watch(currentTaskProvider(task));
    final taskViewModel = ref.read(taskViewModelProvider.notifier);

    final screenWidth = MediaQuery.of(context).size.width;

    final padding = screenWidth < 600 ? 16.0 : 32.0; 
    final titleFontSize = screenWidth < 600 ? 24.0 : 32.0; 
    final bodyFontSize = screenWidth < 600 ? 16.0 : 20.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditTaskPage(task: currentTask),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: ListView(
          children: [
            Text(
              "Task",
              style: TextStyle(fontSize: titleFontSize, fontWeight: FontWeight.bold),
            ),
            Text(
              currentTask.title,
              style: TextStyle(fontSize: titleFontSize, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              "More About Task",
              style: TextStyle(fontSize: titleFontSize, fontWeight: FontWeight.bold),
            ),
            Text(
              currentTask.description,
              style: TextStyle(fontSize: bodyFontSize),
            ),
            const SizedBox(height: 16),
            Text(
              'Created: ${currentTask.createdAt.day}/${currentTask.createdAt.month}/${currentTask.createdAt.year}',
              style: TextStyle(fontSize: bodyFontSize),
            ),
            Text(
              'Due Date: ${currentTask.dueDate.day}/${currentTask.dueDate.month}/${currentTask.dueDate.year}',
              style: TextStyle(fontSize: bodyFontSize),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  'Completed:',
                  style: TextStyle(fontSize: bodyFontSize),
                ),
                const SizedBox(width: 10),
                Switch(
                  value: currentTask.isCompleted,
                  onChanged: (value) async {
                    final updatedTask = currentTask.copyWith(isCompleted: value);
                    ref.read(currentTaskProvider(task).notifier).state = updatedTask;
                    await taskViewModel.updateTask(updatedTask);
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            value ? 'Task marked as completed!' : 'Task marked as incomplete!',
                          ),
                        ),
                      );
                    }
                  },
                  activeColor: Colors.green,
                  activeTrackColor: Colors.lightGreen,
                  inactiveThumbColor: Colors.grey,
                  inactiveTrackColor: Colors.grey[300],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}