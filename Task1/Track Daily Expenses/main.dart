import 'dart:io';
import 'dart:math';

void main() {
  List<Map<String, dynamic>> expenses = [];
  print("Enter number of items : ");
  String? input = stdin.readLineSync();
  int? num = int.parse(input!);
  for (int i = 0; i < num; i++) {
    print('Enter Category :');
    String? category = stdin.readLineSync();
    print('Enter description :');
    String? description = stdin.readLineSync();
    print('Enter date :');
    String? date = stdin.readLineSync();
    print('Enter amount :');
    String? input1 = stdin.readLineSync();
    int amount = int.parse(input1!);
    if (amount < 0) {
      amount = 0;
    }
    Map<String, dynamic> ex = {
      "Category": category,
      "description": description,
      "date": date,
      "amount": amount,
    };
    expenses.add(ex);
  }

  print("All the expenses");
  if (expenses.isEmpty) {
    print("No expenses found.");
  } else {
    for (var e in expenses) {
      print(
        "Category: ${e['Category']}, Description: ${e['description']}, Date: ${e['date']}, Amount: ${e['amount']}",
      );
    }
  }
}
