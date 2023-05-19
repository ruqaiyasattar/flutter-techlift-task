import 'dart:collection';

mixin Grade{
  num average_grade();
  //num total_average();
}

class Student {
  final String name;
  final int age;
  //final Map<String, LinkedHashMap<String, int>> semester;

  Student({
    required this.name,
    required this.age,
    //required this.semester,
  });

/*
  factory Student.fromJson(LinkedHashMap<String, dynamic> json){
    return Student(
        name: json['name'],
        age: json['age'],
        semester: json['semester'],
    );
  }
*/

  @override
  num average_grade(LinkedHashMap<String, String> grades) {
    num average = 0;
    var totalGrades = grades.length;

    for (var value in grades.values) {
      average = average + int.parse(value);
    }
    return average / totalGrades;
  }

}
