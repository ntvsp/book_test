class Book {
  String pathImage, title;

  Book({required this.pathImage, required this.title});
}

List<Book> listBook = [
  Book(pathImage: "assets/images/book3.png", title: "Khoa học & đời sống"),
  Book(pathImage: "assets/images/book3.png", title: "Tâm lý học"),
  Book(pathImage: "assets/images/book3.png", title: "Tâm lý học"),
  Book(pathImage: "assets/images/book3.png", title: "Khoa học & đời sống"),
  Book(pathImage: "assets/images/book3.png", title: "Khoa học & đời sống"),
  Book(pathImage: "assets/images/book3.png", title: "Vật lý"),
];

class Category {
  String title, pathImage;
  Category({required this.title, required this.pathImage});
}

List<Category> listCategory = [
  Category(title: "Tâm lý học", pathImage: "assets/images/books 1.png"),
  Category(
      title: "Khoa học & đời sống",
      pathImage: "assets/images/open-book (1) 1.png"),
  Category(
      title: "Khoa học & đời sống", pathImage: "assets/images/open-book 1.png"),
  Category(title: "Tâm lý", pathImage: "assets/images/open-book 1.png"),
  Category(title: "Văn học", pathImage: "assets/images/book3.png"),
  Category(title: "Toán học", pathImage: "assets/images/books 1.png"),
  Category(title: "Sinh học", pathImage: "assets/images/book3.png"),
  Category(title: "Lý học", pathImage: "assets/images/open-book (1) 1.png"),
  Category(title: "Tâm lý học", pathImage: "assets/images/open-book (1) 1.png"),
  Category(title: "Tâm lý học", pathImage: "assets/images/open-book 1.png"),
  Category(title: "Tâm lý học", pathImage: "assets/images/open-book 1.png"),
  Category(title: "Tâm lý học", pathImage: "assets/images/open-book 1.png"),
  Category(title: "Tâm lý học", pathImage: "assets/images/open-book 1.png"),
];
