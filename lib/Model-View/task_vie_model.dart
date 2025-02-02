import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management/Model-View/task_provider.dart';
import 'package:task_management/Services/DatabaseHelper.dart';
import 'package:task_management/model/task_model.dart';

class TaskViewModel extends StateNotifier<TaskState> {
  final DatabaseHelper _databaseHelper;

  TaskViewModel(this._databaseHelper)
      : super(TaskState(tasks: [], isLoading: false));

  Future<void> loadTasks() async {
    state = state.copyWith(isLoading: true);
    try {
      final tasks = await _databaseHelper.getTasks();
      state = state.copyWith(tasks: tasks, isLoading: false, error: null); // Clear error when loading
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString()); // Set error if any
    }
  }

  Future<void> addTask(Task task) async {
    try {
      await _databaseHelper.insertTask(task);
      await loadTasks(); // Refresh tasks after adding
    } catch (e) {
      state = state.copyWith(error: e.toString()); // Set error if add fails
    }
  }

  Future<void> deleteTask(int id) async {
    try {
      await _databaseHelper.deleteTask(id);
      await loadTasks(); // Refresh tasks after deleting
    } catch (e) {
      state = state.copyWith(error: e.toString()); // Set error if delete fails
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      await _databaseHelper.updateTask(task);
      await loadTasks(); // Refresh tasks after update
    } catch (e) {
      state = state.copyWith(error: e.toString()); // Set error if update fails
    }
  }

  void setDueDate(DateTime? date) {
    state = state.copyWith(dueDate: date); // Update due date in the state
  }
}
