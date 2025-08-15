import 'dart:io';
import 'dart:math';

void main() {
  List<Books> books = [];
  for (int i = 0; i < 3; i++) {
    print('Enter details for book ${i + 1}');
    print("Enter identifier number :");
    String? isbn = stdin.readLineSync();
    print("Enter Title :");
    String? title = stdin.readLineSync();
    print("Enter Rating :");
    String? input = stdin.readLineSync();
    double rating = double.parse(input!);
    Books b = Books(ISBN: isbn!, Title: title!, Rating: rating);
    books.add(b);
  }

  List<Reviews> reviews = [];
  for (int i = 0; i < 3; i++) {
    print('Enter details for Review ${i + 1}');
    print("Enter identifier number :");
    String? isbn = stdin.readLineSync();
    print("Enter reviewer name :");
    String? name = stdin.readLineSync();
    print("Enter review text :");
    String? text = stdin.readLineSync();
    Reviews r = Reviews(ISBN: isbn!, reviewerName: name!, reviewText: text!);
    reviews.add(r);
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
    int index = findBookIndex(books, isbn!);
    if (index != -1) {
      print("Enter new Title:");
      String? title = stdin.readLineSync();
      print("Enter new Rating:");
      double rating = double.parse(stdin.readLineSync()!);
      books[index].Title = title!;
      books[index].Rating = rating;
      print('Book updated successfully.');
    } else {
      print("Enter Title :");
      String? title = stdin.readLineSync();
      print("Enter Rating :");
      String? input = stdin.readLineSync();
      double rating = double.parse(input!);
      Books b = Books(ISBN: isbn, Title: title!, Rating: rating);
      books.add(b);
      print('Book added successfully.');
    }
  } else if (choice == '2') {
    print('Enter ISBN of the book you want to see reviews for:');
    String? isbn = stdin.readLineSync();
    int index = findReviewIndex(reviews, isbn!);
    if (index != -1) {
      print('Reviewer: ${reviews[index].reviewerName}');
      print('Review: ${reviews[index].reviewText}');
      print('-------------------');
    } else {
      print('No reviews found for this book.');
    }
  } else if (choice == '3') {
    print('Enter ISBN of the book you want a recommendation for:');
    String? isbn = stdin.readLineSync();
    int index = findBookIndex(books, isbn!);
    if (index != -1) {
      double rating = books[index].Rating;
      final recommendation = switch (rating) {
        < 5 => 'Not Recommended',
        >= 5 && < 8 => 'Recommended',
        >= 8 => 'Highly Recommended',
        _ => 'No Rating'
      };
    } else {
      print('Book not found.');
    }
  } else {
    print('Wrong input !');
  }
}

class Books {
  String ISBN;
  String Title;
  double Rating;

  Books({
    required this.ISBN,
    required this.Title,
    required this.Rating,
  });
}

class Reviews {
  String ISBN;
  String reviewerName;
  String reviewText;

  Reviews({
    required this.ISBN,
    required this.reviewerName,
    required this.reviewText,
  });
}




int findBookIndex(List<Books> books, String isbn) {
  for (int i = 0; i < books.length; i++) {
    if (books[i].ISBN == isbn) {
      return i;
    }
  }
  return -1;
}

int findReviewIndex(List<Reviews> reviews, String isbn) {
  for (int i = 0; i < reviews.length; i++) {
    if (reviews[i].ISBN == isbn) {
      return i;
    }
  }
  return -1;
}