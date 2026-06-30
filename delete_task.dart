import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'App_cubit.dart';
void main(){
  runApp(deletetask());
}

class deletetask extends StatefulWidget {
  const deletetask({super.key});

  @override
  State<deletetask> createState() => delete_taskState();
}

class delete_taskState extends State<deletetask> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController_d = TextEditingController();
    const primaryColor = Color.fromARGB(255, 73, 7, 87); 
    const secondaryColor = Color(0xFFEBDDB7); 

    return Scaffold(
     appBar: AppBar(
      backgroundColor: primaryColor,
      title: Text("To Do List",style: TextStyle(color: secondaryColor,fontWeight: FontWeight.bold))
      ,actions: [Icon(Icons.account_circle,color: secondaryColor),SizedBox(width: 10,)],
      leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined, color: secondaryColor),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),),
    body: SingleChildScrollView( 
  child: Padding(
    padding: const EdgeInsets.all(20.0), 
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            "Delete task",
            style: TextStyle(
              color: primaryColor, 
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ),
        const SizedBox(height: 30), 

       
        TextFormField(
          style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          controller: titleController_d, 
          decoration: InputDecoration(
            labelText: 'Task Title',
            labelStyle: const TextStyle(color: primaryColor),
            hintText: 'Enter task title...',
            hintStyle: TextStyle(color: primaryColor),
            prefixIcon: const Icon(Icons.title, color: primaryColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: primaryColor),
            ),
          ),
        ),
        const SizedBox(height: 40),

        SizedBox(
          width: double.infinity, 
          height: 50, 
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor, 
              foregroundColor: secondaryColor, 
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), 
              ),
            ),
            onPressed: () {
                  BlocProvider.of<Appcubit>(context).deleteTask(
                  title_n: titleController_d.text,
                  );
                  Navigator.pop(context);
                  },
            child: const Text(
              'Delete',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    ),
  ),
     ),
    );
  }
}