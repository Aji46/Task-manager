import 'package:task_management/model/task_model.dart';

class TaskState {
  final List<Task> tasks;
  final bool isLoading;
  final String? error;
  final DateTime? dueDate;

  TaskState({
    required this.tasks,
    required this.isLoading,
    this.error,
    this.dueDate,
  });

  TaskState copyWith({
    List<Task>? tasks,
    bool? isLoading,
    String? error,
    DateTime? dueDate,
  }) {
    return TaskState(
      tasks: tasks ?? this.tasks,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      dueDate: dueDate ?? this.dueDate,
    );
  }
}