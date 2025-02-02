
# Task Management Application

A simple and intuitive task management application built with **Flutter** and **Riverpod** for state management. This app allows users to create, view, update, and delete tasks, with support for both mobile and tablet layouts.

## Features

- **Task Management**:
  - Add new tasks with a title, description, and due date.
  - View a list of tasks sorted by due date.
  - Update existing tasks.
  - Delete tasks.
- **Responsive Design**:
  - Optimized for both mobile and tablet layouts.
  - Mobile: Displays tasks in a vertical list.
  - Tablet: Displays tasks in a grid layout.
- **Dark/Light Theme**:
  - Toggle between dark and light themes for better user experience.
- **Automatic UI Refresh**:
  - The UI automatically updates when tasks are added, updated, or deleted.

---

## Screenshots



https://github.com/user-attachments/assets/457e809b-42f4-4baa-9ac5-b62d584b9c1c


### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/task_management_app.git
   ```
2. Navigate to the project directory:
   ```bash
   cd task_management_app
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run


## Dependencies

This project uses the following packages:

- **flutter_riverpod**: For state management.
- **intl**: For date formatting.
- **flutter_localizations**: For localization support.

You can find all dependencies in the `pubspec.yaml` file.

---

## How to Use

1. **Adding a Task**:
   - Tap the floating action button (`+`) on the home screen.
   - Fill in the task details (title, description, and due date).
   - Tap "Save" to add the task.

2. **Viewing/Editing a Task**:
   - Tap on a task in the list to view its details.
   - You can edit the task details and save changes.

3. **Deleting a Task**:
   - Swipe left on a task in the list (mobile) or use the delete option in the task details screen.

4. **Toggle Theme**:
   - Tap the theme toggle button in the app bar to switch between dark and light themes.

---

## Contributing

Contributions are welcome! If you find any issues or want to add new features, feel free to open an issue or submit a pull request.

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/your-feature`).
3. Commit your changes (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature/your-feature`).
5. Open a pull request.

## Acknowledgments

- Flutter Team for the amazing framework.
- Riverpod for simplifying state management.
- The open-source community for providing helpful packages and resources.
