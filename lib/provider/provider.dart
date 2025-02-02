import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management/Model-View/task_provider.dart';
import 'package:task_management/Model-View/task_vie_model.dart';
import 'package:task_management/Services/DatabaseHelper.dart';

final databaseProvider = Provider((ref) => DatabaseHelper());

final taskViewModelProvider = StateNotifierProvider<TaskViewModel, TaskState>((ref) {
  return TaskViewModel(DatabaseHelper());
});