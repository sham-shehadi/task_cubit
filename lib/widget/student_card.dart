import 'package:flutter/material.dart';
import '../model/student.dart';

class StudentCard extends StatelessWidget {
  final Student student;
  const StudentCard({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Card(color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
      child:  Padding(padding: EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(radius: 30, backgroundColor: Color(0xFFE8EEFF), child:Icon(Icons.person,color:Colors.grey,)
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(student.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                    ),),
                  Text(
                    student.id, style: TextStyle(fontSize: 16, color: Colors.grey,
                    ),),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey,),
          ],
        ),
      ),
    );
  }
}