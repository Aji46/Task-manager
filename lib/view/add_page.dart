import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management/Services/DatabaseHelper.dart';
import 'package:task_management/model/task_model.dart';
import 'package:task_management/provider/provider.dart';

class AddPage extends ConsumerWidget {
  AddPage({Key? key}) : super(key: key);

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dueDate = ref.watch(taskViewModelProvider.select((state) => state.dueDate));
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text('Add Task')),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: ListView(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: screenWidth > 600 ? 4 : 2,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  dueDate == null
                      ? 'Selecte Due Date '
                      : 'Due Date: ${dueDate.toLocal()}'.split(' ')[0],
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );
                    if (picked != null) {
                      ref.read(taskViewModelProvider.notifier).setDueDate(picked);
                    }
                  },
                  child: const Text('Select Due Date'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (_titleController.text.isNotEmpty &&
                    _descriptionController.text.isNotEmpty &&
                    dueDate != null) {
                  final newTask = Task(
                    title: _titleController.text,
                    description: _descriptionController.text,
                    dueDate: dueDate,
                    isCompleted: false,
                    createdAt: DateTime.now(),
                  );

                  await DatabaseHelper().insertTask(newTask);
                        await ref.read(taskViewModelProvider.notifier).loadTasks();
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please fill all fields and select a due date.'),
                    ),
                  );
                }
              },
              child: const Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}