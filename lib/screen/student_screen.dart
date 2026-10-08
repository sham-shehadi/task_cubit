import 'package:flutter/material.dart';
import '../widget/student_card.dart';
import '../model/student.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cubit_student_cubit.dart';
import '../cubit/cubit_student_state.dart';
class StudentsScreen extends StatelessWidget {
 // static final students = [
   // Student(name: 'Alex Johnson', id: '10023'),
    //Student(name: 'Maria Garcia', id: '10045'),
  //  Student(name: 'Sam Smith', id: '10088'),
  //];
  const StudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFFF5F5F7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Class 10-A Students', style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<StudentsCubit, StudentsState>(
        builder: (context, state) {
          return ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: state.students.length,
            itemBuilder: (context, index) {
              final student = state.students[index];
              return Dismissible(
              key: ValueKey(student.id),
               direction: DismissDirection.endToStart,
              background: Container(alignment: Alignment.centerRight,
                color: Colors.red, child:Icon(Icons.delete, color: Colors.white,),
              ),
              onDismissed: (direction) {
                context.read<StudentsCubit>().deleteStudent(student.id);
              },
              child: StudentCard(student: student,
              ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:  Color(0xFF1557E8), shape: CircleBorder(),
          onPressed: () {
          context.read<StudentsCubit>().addStudent();
        },
        child: Icon(
          Icons.add, color: Colors.white, size: 32,
        ),
      ),
    );
  }
}