class Category {
  final String name;
  final String productCount;
  final String thumbnailImage;

  Category({
    required this.name,
    required this.productCount,
    required this.thumbnailImage,
  });
}

final categories = [
  Category(
    name: 'T-SHIRT',
    productCount: '300',
    thumbnailImage: 'assets/13.PNG',
  ),
  Category(
    name: 'SHOES',
    productCount: '400',
    thumbnailImage: 'assets/10.PNG',
  ),
  Category(
    name: 'HODDIE',
    productCount: '120',
    thumbnailImage: 'assets/8.PNG',
  ),
  Category(
    name: 'JEANS',
    productCount: '500',
    thumbnailImage: 'assets/12.PNG',
  ),
  Category(
    name: 'GLOVES',
    productCount: '100',
    thumbnailImage: 'assets/11.PNG',
  ),
  Category(
    name: 'SOCKS',
    productCount: '120',
    thumbnailImage: 'assets/14.PNG',
  ),
];
