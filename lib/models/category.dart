class Category {
  final String id;
  final String name;
  final String icon;

  Category({
    required this.id,
    required this.name,
    required this.icon,
  });
}

final List<Category> categories = [
  Category(id: 'c1', name: 'Dogs', icon: '🐶'),
  Category(id: 'c2', name: 'Cats', icon: '🐱'),
  Category(id: 'c3', name: 'Birds', icon: '🐦'),
  Category(id: 'c4', name: 'Fish', icon: '🐠'),
  Category(id: 'c5', name: 'Rabbits', icon: '🐰'),
];
