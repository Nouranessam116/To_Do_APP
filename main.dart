import 'package:flutter/material.dart';
import 'add_task.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'delete_task.dart';
import 'App_cubit.dart';
import 'States.dart';
void main() {
  runApp(
    BlocProvider(
      create: (context) => Appcubit(),
      child: const ToDoApp(),
    ),
  );
}


class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(), 
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color.fromARGB(255, 73, 7, 87); 
    const secondaryColor = Color(0xFFEBDDB7); 
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          "To Do List",
          style: TextStyle(color: secondaryColor, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Icon(Icons.account_circle, color: secondaryColor),
          SizedBox(width: 10),
        ],
        leading: const Icon(Icons.arrow_back_ios_new_outlined, color: secondaryColor),
      ),
      body: Padding(
  padding: const EdgeInsets.all(20),
  child: BlocBuilder<Appcubit, States>(
    builder: (context, state) {
      var tasks = BlocProvider.of<Appcubit>(context).to_do;

      return Column(
        children: [
          const Text(
            "Welcome Back User",
            style: TextStyle(
              color: primaryColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),
          Expanded(
            child: tasks.isEmpty ? Center(child: Text("There is no Tasks :(" , style: TextStyle(color: primaryColor,fontSize: 18),)):
            ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title:  Row(
  children: [
    const Text(
      "Name: ",
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    ),
    Expanded(
      child: Text(tasks[index].title),
    ),
  ],
),
                    subtitle: Column(
                      children: [
                       Row(
                        children: [
                          Text("Description: ",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold,) ,),Text("${tasks[index].description}\n")
                          ]) ,
                       Row(
                         children: [
                            Text("date: ",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold,)),Text("${tasks[index].date.day}/${tasks[index].date.month}/${tasks[index].date.year} "),
                         ],
                       ),
                       Row(
                         children: [
                            Text("Time: ",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold,) ),Text("${tasks[index].date.hour}:${tasks[index].date.minute.toString().padLeft(2, '0')}"),
                         ],
                       ), ],
                    ), 
                     trailing: IconButton(
                    icon: Icon(
                      tasks[index].is_done
                      ? Icons.check_circle
                      : Icons.radio_button_unchecked,
                      ),
                      onPressed: () {
                       BlocProvider.of<Appcubit>(context).changeTaskState(index);
                       },
                  ),),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          MaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const add_task(),
                ),
              );
            },
            color: primaryColor,
            textColor: Colors.white,
            minWidth: double.infinity,
            height: 50,
            child: const Text("Add Task"),
          ),

          const SizedBox(height: 10),

          MaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const deletetask(),
                ),
              );
            },
            color: primaryColor,
            textColor: Colors.white,
            minWidth: double.infinity,
            height: 50,
            child: const Text("Delete Task"),
          ),

        ],
      );
    },
  ),
),
    );
  }
}