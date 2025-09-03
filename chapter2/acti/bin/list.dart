// import 'dart:io';

// void main(){
//   var li=[];
//   for (int i=0;i<=10;i++){
//     li.add('Index $i');
//   }
//   stdout.write('The full list:');
//   f(li);
//   stdout.write('Last index removed:');
//   li.removeLast();
//   f(li);
//   stdout.write('Specific index (5) removed:');
//   li.removeAt(5);
//   f(li);
//   stdout.write("Added value in(5) index:");
//   li.insert(5,111);
//   f(li);
// }
// void f(li){
//   print(li);
// }
import 'dart:io';

void main() {
  print('Enter the Number of students to register:');
  int n = int.parse(stdin.readLineSync()!);

  List<Student> students = [];
  for (int i = 1; i <= n; i++) {
    print('Enter student $i details: ');

    print('Enter the ID: ');
    String id = stdin.readLineSync()!;

   print('Enter the Name: ');
    String name = stdin.readLineSync()!;

    print('Enter the Address: ');
    String address = stdin.readLineSync()!;

    print('Enter the Phone Number: ');
    String phone = stdin.readLineSync()!;

    print("Enter the Father's Name: ");
    String father = stdin.readLineSync()!;

   print("Enter the Mother's Name: ");
    String mother = stdin.readLineSync()!;

    
    students.add(Student(
      id: id,
      name: name,
      address: address,
      phone: phone,
      father: father,
      mother: mother,
    ));
  }


  while (true) {
    print('\n------------------------------');
    print('Options');
    print('1. View all students');
    print('2. View student by ID');
    print('3. Delete student by ID');
    print('4. Exit');
    print('------------------------------');
    stdout.write('Choose an Option: ');

    String? input = stdin.readLineSync();
    if (input == null) continue;

    int r = int.parse(stdin.readLineSync()!);

    switch (r) {
      case 1:
        if (students.isEmpty) {
          print('No students registered.');
        } else {
          for (var student in students) {
            print('Id: ${student.id}');
            print('Name: ${student.name}');
            print('Address: ${student.address}');
            print('Phone Number: ${student.phone}');
            print('Father name: ${student.father}');
            print('Mother name: ${student.mother}');
            print('------------------------------');
          }
        }
        break;

      case 2:
        stdout.write('Enter student ID : ');
        String studentId = stdin.readLineSync()!;

        
        var fStudent = students.firstWhere(
          (student) => student.id == studentId,
          
        );

        if (fStudent != null) {
          print('------------------------------');
          print('Student Details:');
          print('Id: ${fStudent.id}');
          print('Name: ${fStudent.name}');
          print('Address: ${fStudent.address}');
          print('Phone Number: ${fStudent.phone}');
          print('Father name: ${fStudent.father}');
          print('Mother name: ${fStudent.mother}');
          print('------------------------------');
        } else {
          print('Error: No student found with ID $studentId');
        }
        break;

      case 3:
       
       stdout.write('Enter student ID : ');
        String stuId = stdin.readLineSync()!;

        
      students.removeWhere((item) => item.id =='$stuId' ) ;
          print('Student deleted sucessfully');

          
      
        
        break;
      
      case 4:
        print('Exiting program. Goodbye!');
        return; 
      
      default:
        print('Invalid option. Please choose a number from 1 to 4.');
        break;
    }
  }
}


class Student {
  String id;
  String name;
  String address;
  String phone;
  String father;
  String mother;

  Student({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.father,
    required this.mother,
  });
}