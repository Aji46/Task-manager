import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management/provider/provider.dart';
import 'package:task_management/view/add_page.dart';

class FloatingButton extends ConsumerWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () async {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddPage()),
        );
        await ref.read(taskViewModelProvider.notifier).loadTasks();
      },
      child: const Icon(Icons.add),
    );
  }
}