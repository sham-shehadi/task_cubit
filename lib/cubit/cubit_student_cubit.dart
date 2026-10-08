import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/student.dart';
import 'cubit_student_state.dart';

class StudentsCubit extends Cubit<StudentsState> {
StudentsCubit() : super(  StudentsState(
  students: [Student(name: 'Alex Johnson', id: '10023'),
     Student(name: 'Maria Garcia', id: '10045'), Student(name: 'Sam Smith', id: '10088'),
   ],
),);
void addStudent() {
  final newStudent = Student(
    name: 'new dtudent',
    id: '10088',
  );

  emit(StudentsState(students: [...state.students, newStudent],),);
}
void deleteStudent(String id) {
  final updatedstudent = state.students.where((student) => student.id != id).toList();

  emit(StudentsState(students: updatedstudent),
  );
}
}