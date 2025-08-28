import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Student {
  String name;
  double id;
  String dept;
  double cgpa;
  Student({required this.name,required this.id,required this.dept, required this.cgpa});
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  final List<Student> studentList = [
    Student(name: "John", id: 101, dept: "CSE", cgpa: 8.6),
    Student(name: "David", id: 201, dept: "ECE", cgpa: 9.8),
    Student(name: "Raja", id: 102, dept: "CSE", cgpa: 7.5),
    Student(name: "Samson", id: 301, dept: "ECM", cgpa: 6.9),
    Student(name: "Allen", id: 401, dept: "Biomedical", cgpa: 9.2),
    Student(name: "Santhosh", id: 501, dept: "Food Processing", cgpa: 5.5),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dynamic List View",
      home: Scaffold(
        appBar: AppBar(title: Text("Students Details"),
        backgroundColor: Colors.blue,
        ),
        body: ListView.builder(
          itemCount: studentList.length,
          itemBuilder: (context, index){
            final student = studentList[index];
            return Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    child: Text(student.name[0]),
                  ),
                  title: Text(student.name),
                  subtitle: Text("Dept:${student.dept}, Student ID:${student.id}"),
                  trailing: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: (){
                      showDialog(
                        context: context, 
                        builder: (context) => AlertDialog(
                          title: Text("Student Details"),
                          content: Text("Student Name: ${student.name}, CGPA: ${student.cgpa}"),
                          actions: [
                            TextButton(onPressed: () => Navigator.pop(context), child: Text("Ok"))
                          ],
                        )
                      );
                    }, 
                    child: Text("Show Details")),
                    onTap: (){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("${student.name} is selected."),
                          duration: Duration(seconds: 1),
                        )
                      );
                    },
                ),
                Divider()
              ],
            );
          },
        ),
      ),
    );
  }
}