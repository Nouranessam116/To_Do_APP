# 📝 To-Do List App

A simple and user-friendly To-Do List application built with **Flutter** using the **Cubit (flutter_bloc)** state management pattern.

The application allows users to manage their daily tasks by adding, displaying, updating, and deleting tasks through a clean and simple interface.

---

## 📌 Features

- ✅ Add new tasks
- 📋 Display all tasks
- ✔️ Mark tasks as completed or incomplete
- 🗑️ Delete tasks by title
- 📅 Automatically assign the current date and time when a task is created
- ⚡ State management using Cubit (flutter_bloc)

---

## 🛠 Technologies Used

- Flutter
- Dart
- flutter_bloc (Cubit)
- Material Design

---

## 📂 Project Structure

```
lib/
│
├── main.dart              # Application entry point
├── App_cubit.dart         # Cubit containing application logic
├── States.dart            # Cubit states
├── Tasks.dart             # Task model
├── add_task.dart          # Add task screen
├── delete_task.dart       # Delete task screen
```

---

## 🏗 Project Architecture

The application follows a simple **Cubit Architecture**.

### 1. Presentation Layer
Responsible for displaying the UI and handling user interactions.

Files:
- main.dart
- add_task.dart
- delete_task.dart

---

### 2. Business Logic Layer

Implemented using **Cubit**.

The Cubit is responsible for:

- Adding tasks
- Deleting tasks
- Updating task status
- Emitting new states to rebuild the UI

File:

```
App_cubit.dart
```

---

### 3. Data Layer

The application uses a simple in-memory list to store tasks.

Task Model:

```
Tasks
├── title
├── description
├── date
└── is_done
```

Currently, tasks are stored only while the application is running.

---

## 🔄 Application Workflow

1. User opens the application.
2. User clicks **Add Task**.
3. User enters:
   - Title
   - Description
4. Current date and time are automatically assigned.
5. The task is added to the Cubit list.
6. Cubit emits a new state.
7. Home screen rebuilds automatically and displays the new task.
8. User can:
   - Mark the task as completed.
   - Delete the task.

---

## 📸 Screens

- Home Screen
- Add Task Screen
- Delete Task Screen

---

## 🚀 State Management

The application uses **flutter_bloc** with Cubit.

Main states:

- Initial_tasks
- Updated_tasks

Whenever a task is added, deleted, or updated, the Cubit emits an `Updated_tasks` state, causing the UI to refresh automatically.

---

## 📦 Task Model

```dart
class Tasks {
  String title;
  String description;
  DateTime date;
  bool is_done;
}
```

---

## ▶️ How to Run

1. Clone the repository

```
git clone <repository-link>
```

2. Navigate to the project folder

```
cd to_do_app
```

3. Install dependencies

```
flutter pub get
```

4. Run the application

```
flutter run
```

---

## 🔮 Future Improvements

- Save tasks locally using SharedPreferences or Hive
- Edit existing tasks
- Search tasks
- Filter completed tasks
- Task categories
- Dark Mode
- Notifications and reminders

---

## 👩‍💻 Author

Developed by **Nouran Essam**

Faculty of Computers and Artificial Intelligence  
Cairo University
