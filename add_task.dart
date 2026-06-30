import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'App_cubit.dart';
void main() {
  runApp(const add_task());
}

class add_task extends StatefulWidget {
  const add_task({super.key});

  @override
  State<add_task> createState() => add_taskState();
}

class add_taskState extends State<add_task> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    const primaryColor = Color.fromARGB(255, 73, 7, 87); 
    const secondaryColor = Color(0xFFEBDDB7); 

    return  Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor, 
        title: const Text(
          "To Do List",
          style: TextStyle(
            color: secondaryColor, 
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Icon(Icons.account_circle, color: secondaryColor),
          SizedBox(width: 10),
        ],
        
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined, color: secondaryColor),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Add another task",
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
                style: const TextStyle(color: Colors.black), 
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Task Title',
                  labelStyle: const TextStyle(color: primaryColor),
                  hintText: 'Enter task title...',
                  hintStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
                  prefixIcon: const Icon(Icons.title, color: primaryColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: primaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: primaryColor, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 20),

         
              TextFormField(
                maxLines: 3,
                style: const TextStyle(color: Colors.black),
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  labelStyle: const TextStyle(color: primaryColor),
                  hintText: 'Enter task details...',
                  hintStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
                  prefixIcon: const Icon(Icons.description, color: primaryColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: primaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: primaryColor, width: 2),
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
                    foregroundColor: Colors.white, 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3,
                  ),
                  onPressed: () {
                  BlocProvider.of<Appcubit>(context).add_newtask(
                  title_n: titleController.text,
                  description_n: descriptionController.text,
                  is_done_n: false,
                  );
                  Navigator.pop(context);
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.0),
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