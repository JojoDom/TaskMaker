class IntroModel {
  final String title;
  final String content;
  final String image;

  IntroModel({required this.title, required this.content, required this.image});
}

List<IntroModel> intro = [
  IntroModel(title: 'Plan', content: 'Plan your day', image: 'person.jpg'),
  IntroModel(title: 'Schedule', content: 'Schedule tasks on the go', image: 'person.jpg'),
  IntroModel(title: 'Do it', content: 'Do it', image: 'person.jpg'),
];
