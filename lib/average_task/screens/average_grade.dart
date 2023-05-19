/*
import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:techlift_flutter/average_task/model/student.dart';
import 'package:techlift_flutter/average_task/model/widgets/subjects.dart';

  LinkedHashMap<String, int> gradeMap = LinkedHashMap();

  // Add elements to the map
  gradeMap['English'] = 80;
  gradeMap['Urdu'] = 20;
  gradeMap['Maths'] = 90;
  gradeMap['Computers'] = 88;

  var student = Student(
    'Rayan',
    4,
    myMap,
  );

  print('-----Average of Grades---');

  print(student.average_grade());


class GradeScreen extends HookWidget {
  const GradeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final grade = useState();
    final grades = LinkedHashMap<String, int>();
    grades['English'] = 20;
    grades['Maths'] = 20;
    grades['Computer Science'] = 20;
    grades['Urdu'] = 20;

    final grades2 = LinkedHashMap<String, int>();
    grades2['Software Engineering'] = 20;
    grades2['OOPS'] = 20;
    grades2['AI'] = 20;
    grades2['Urdu'] = 20;

    final gradeCard = <String, LinkedHashMap<String, int>>{
      'Semester 1': grades,
      'Semester 2' :grades2,
    };

//for sending model data in decoding format
    String jsonStr = '{"property1": "value1", "property2": 123}';
    Map<String, dynamic> jsonMap = json.decode(jsonStr);
//
    Student showStudent = Student(
        name: 'Rayan',
        age: 21,
        semester: gradeCard,
    );


    Iterable<LinkedHashMap<String, int>> semester(){
      Iterable<LinkedHashMap<String, int>> semesters;
      for(var sem in showStudent.semester.values) {
        semesters = sem as Iterable<LinkedHashMap<String, int>>;
      }
      return semesters;
    }



    return Scaffold(
      appBar: AppBar(
        title:  Text('${showStudent.name} Grade Card'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ClipRect(
            child: Banner(
              //message: showStudent.semester.keys.first,
              location: BannerLocation.topStart,
              color: Colors.green,
              child: Card(
                child: Column (
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const SizedBox(height: 1,),
                    Subjects(label: showStudent.semester.values.first.keys.take(1).first),
                    Subjects(label: showStudent.semester.values.first.keys.take(2).elementAt(1)),
                    Subjects(label: showStudent.semester.values.first.keys.take(3).elementAt(2)),
                    Subjects(label: showStudent.semester.values.first.keys.take(4).elementAt(3)),
                    Center(
                    child: ElevatedButton(
                      onPressed: (){
                        //mygrad();
                        //print(mygrad().toString());
                      },
                      child: Text('Average'),
                    ),
                  ),
                    const SizedBox(height: 20),
                    const Center(
                    child:  Text(' My Grade'),
                  ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
*/
