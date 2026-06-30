import 'package:flutter_bloc/flutter_bloc.dart';
import 'Tasks.dart';
import 'States.dart';

class Appcubit extends Cubit<States>{
  List<Tasks> to_do=[];

  Appcubit():super(Intial_tasks());
   

  void add_newtask({required String title_n, required String description_n,  required bool is_done_n}){
     to_do.add(
      Tasks(title:title_n,description: description_n,is_done: is_done_n)
     );

     emit(Updated_tasks());
  }

  void deleteTask({required String title_n}) {
    to_do.removeWhere((Tasks) =>
    Tasks.title==title_n);
  emit(Updated_tasks());
}

  void display_task({required String title_n, required String description_n,required bool is_done_n}){
      to_do.forEach((Tasks) =>
        print(Tasks));

     emit(Updated_tasks());
  }

  void changeTaskState(int index) {
  to_do[index].is_done = !to_do[index].is_done;
  emit(Updated_tasks());
}
}

