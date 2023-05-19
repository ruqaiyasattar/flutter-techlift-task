import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:techlift_flutter/average_task/model/student.dart';
import 'dart:collection';
import 'package:techlift_flutter/average_task/widgets/subjects.dart';


class GradeWidget extends HookWidget {
  const GradeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //saves averages of sem1,2 and total of these two
    num averageSem1 = 0;
    num averageSem2 = 0;
    num averageAll = 0;
    //

    //these are changeNotifiers or states for reflect average value when change
    var averageValue = useState<num>(averageSem1);

    var averageValueSemTwo = useState<num>(averageSem2);

    var averageValueBoth = useState<num>(averageAll);
    //

    //for now created two objects
    Student stu = Student(name: 'Rayan', age: 24);

    Student stu2 = Student(name: 'Rayan', age: 24);

    //list for CustomFormField
    final formFields = <Subjects>[]; //for semester 1
    //

    final labelText = ['English', 'Urdu', 'Computer Science', 'Maths'];

    //for 1st semester => assigning labels to form field then add customFormField
    for (int i = 0; i < labelText.length; i++) {
      final controller = useCustomFormField();
      formFields.add(Subjects(label: labelText[i], controller: controller));
    }

    //1st sem => list of values taking from fields and save here
    final formData = useState<LinkedHashMap<String, String>>(LinkedHashMap<String, String>());

    //1st sem => saving values from fields controller to above map
    void addValuesToMap() {
      for (int i = 0; i < formFields.length; i++) {
        final controller = formFields[i].controller;
        formData.value[labelText[i]] = controller.value;
      }
      averageValue.value = stu.average_grade(formData.value);
      averageSem1 = stu.average_grade(formData.value);
    }

    final formFields2 = <Subjects>[]; //for semester 2

    final labelText2ndSem = ['OOP', 'Networking', 'AI', 'Data Science'];

    //for 2nd semester
    for (int i = 0; i < labelText2ndSem.length; i++) {
      final controller = useCustomFormField();
      formFields2.add(Subjects(label: labelText2ndSem[i] ,controller: controller));
    }

    //2nd sem
    final secFormData = useState<LinkedHashMap<String, String>>(LinkedHashMap<String, String>());

    //2nd sem
    void addValuesToMapForSecSem() {
      for (int i = 0; i < formFields2.length; i++) {
        final controller = formFields2[i].controller;
        secFormData.value[labelText2ndSem[i]] = controller.value;
      }

      averageValueSemTwo.value = stu2.average_grade(secFormData.value);
      averageSem2 = stu2.average_grade(secFormData.value);
    }

    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('${stu.name} Grade Card'),
              ClipRect(
                child: Banner(
                  message: 'Semester 1',
                  location: BannerLocation.topStart,
                  color: Colors.green,
                  child: Card(
                    elevation: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                          ...formFields,
                          ElevatedButton(
                            onPressed: () {
                              addValuesToMap();// Output the current contents of the LinkedHashMap
                            },
                            child: const Text(
                              'Calculate Average',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            width: 200,
                            child: Divider(
                              color: Colors.blue,
                              thickness: 3.2,
                            ),
                          ),
                           Padding(
                             padding: const EdgeInsets.all(12.0),
                             child: Text(
                              'Average Grade: ${averageValue.value.toString()}',
                              style: const TextStyle(fontSize: 24),
                             ),
                           ),
                        ],
                      ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ClipRect(
                child: Banner(
                  message: 'Semester 2',
                  location: BannerLocation.topStart,
                  color: Colors.green,
                  child: Card(
                    elevation: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...formFields2,
                        ElevatedButton(
                          onPressed: () {
                            addValuesToMapForSecSem();// Output the current contents of the LinkedHashMap
                          },
                          child: const Text(
                            'Calculate Average',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          width: 200,
                          child: Divider(
                            color: Colors.blue,
                            thickness: 3.2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            'Average Grade: ${averageValueSemTwo.value.toString()}',
                            style: const TextStyle(fontSize: 24),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(

                onPressed: () {
                  averageAll = (averageValue.value + averageValueSemTwo.value)/ 2;
                  averageValueBoth.value = averageAll;
                  // Output the current contents of the LinkedHashMap
                },
                child: const Text(
                  'Calculate Average',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                width: 200,
                child: Divider(
                  color: Colors.blue,
                  thickness: 3.2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Total Semesters Average: ${averageValueBoth.value.toString()}',
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ],
          ),
        ),
      );
  }
}

ValueNotifier<String> useCustomFormField() {
  return useState<String>('');
}

num? useGrossAverage(var aver1, var aver2){
  return (aver1 + aver2) / 2;
}
