import 'dart:io';

void main(){
  List<Map<String,dynamic>> Books=[];
  List<Map<String,dynamic>> Reviews=[];
  for(int i=0;i<3;i++){
   print('Enter detiels for book ${i+1}');

   print("Enter identifier number :");
   String? input1 = stdin.readLineSync();
   print("Enter Title :");
   String? input2 = stdin.readLineSync();
   print("Enter Rating :");
   String? input3 = stdin.readLineSync();
   double number = double.parse(input3!); 
   Map<String,dynamic> b={
    'ISBN':input1,
    'Title' : input2,
    'Rating' :number,
  };
  Books.add(b);
  }

  for(int i=0;i<3;i++){
   print('Enter detiels for Review ${i+1}');

   print("Enter Book ISBN :");
   String? input1 = stdin.readLineSync();
   print("Enter Reviewer name :");
   String? input2 = stdin.readLineSync();
   print("Enter Review text :");
   String? input3 = stdin.readLineSync();
   Map<String,dynamic> r={
  'ISBN':input1,
  'Reviewer':input2,
  'Text':input3,
};
  Reviews.add(r);
  }
  
  print('----------------------------------');
  print('Now What do you want?');
  print('1- Add/Update Books');
  print('2- View specific book reviews');
  print('3- Get book Recommendations');
  String? choice = stdin.readLineSync();

  if (choice == '1') {
    print('Enter ISBN of the book you want to add/update:');
    String? isbn = stdin.readLineSync();
    var existingBookIndex = Books.indexWhere((book) => book['ISBN'] == isbn);
    if (existingBookIndex != -1) {
      print("Enter new Title:");
      String? title = stdin.readLineSync();
      print("Enter new Rating:");
      double rating = double.parse(stdin.readLineSync()!);
      Books[existingBookIndex]['Title'] = title;
      Books[existingBookIndex]['Rating'] = rating;
      print('Book updated successfully.');
    } else {
      print("Enter Title:");
      String? title = stdin.readLineSync();
      print("Enter Rating:");
      double rating = double.parse(stdin.readLineSync()!);
      Books.add({
        'ISBN': isbn,
        'Title': title,
        'Rating': rating,
      });
      print('Book added successfully.');
    }
  } 
  else if (choice == '2') {
    print('Enter ISBN of the book you want to see reviews for:');
    String? isbn = stdin.readLineSync();
    var bookReviews = Reviews.where((review) => review['ISBN'] == isbn).toList();
    if (bookReviews.isEmpty) {
      print('No reviews found for this book.');
    } else {
      bookReviews.forEach((review) {
        print('Reviewer: ${review['Reviewer']}');
        print('Review: ${review['Text']}');
        print('-------------------');
      });
    }
  } 
  else if (choice == '3') {
    print('Enter ISBN of the book you want a recommendation for:');
    String? isbn = stdin.readLineSync();
    var book = Books.firstWhere(
      (book) => book['ISBN'] == isbn,
      orElse: () => {},
    );
    if (book.isEmpty) {
      print('Book not found.');
    } else {
      double rating = book['Rating'];
      final recommendation = switch (rating) {
        < 5 => 'Not Recommended',
        >= 5 && < 8 => 'Recommended',
        >= 8 => 'Highly Recommended',
        _ => 'No Rating'
      };
      print('Recommendation: $recommendation');
    }
  } 
  else {
    print('Wrong Option!');
  }
}