import 'dart:io';
import 'dart:math';
void main(){
  List<Map<String,dynamic>> Students =[];
  Map<String,dynamic> s1={
    'Name':'Mahmoud',
    'Age' : 21,
    'Grades' :[88,86,91,75],
  };

  Students.add(s1);

  Map<String,dynamic> s2={
    'Name':'Ahmed',
    'Age' : 60,
    'Grades' :[75,89,97,85],
  };
  
  Students.add(s2);

  Map<String,dynamic> s3={
    'Name':'Abdelghani',
    'Age' : 100,
    'Grades' :[87,77,99,79],
  };
  
  Students.add(s3);

  Students[1]['Age']=59;
  Students[2]['Name']='Mohammed';

  Students.forEach((student) {
  List<int> grades = student['Grades'];
  int total = 0;

  grades.forEach((grade) {
    total += grade;
  });

  double average = total / grades.length;
  print('Average grades of ${student['Name']} = $average');
});
}