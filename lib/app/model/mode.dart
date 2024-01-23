class Category {
  final String category_id;
  final String name;
  final String imageUrl;

  Category(
      {required this.name, required this.imageUrl, required this.category_id});

  Map<String, dynamic> toMap() {
    return {'category_id': category_id, 'name': name, 'imageUrl': imageUrl};
  }
}

class Topping {
  final String id;
  final String name;
  final double price;
  final String product_id;

  Topping(
      {required this.id,
      required this.name,
      required this.price,
      required this.product_id});

  Map<String, dynamic> toMap() {
    return {"id": id, 'name': name, 'price': price, 'product_id': product_id};
  }
}

class SizeModel {
  final String id;
  final String size;
  final double price;
  final String product_id;

  SizeModel(
      {required this.id,
      required this.size,
      required this.price,
      required this.product_id});

  Map<String, dynamic> toMap() {
    return {"id": id, 'size': size, 'price': price, 'product_id': product_id};
  }
}

class Product {
  final String? id;
  final String? name;
  final String? imageUrl;
  final List<SizeModel>? sizeList;
  final String? description;
  final List<Topping>? toppingList;
  final String? category_id;

  Product(
      {required this.id,
      this.sizeList,
      this.description,
      this.toppingList,
      this.name,
      this.imageUrl,
      this.category_id});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'description': description,
      'category_id': category_id,
    };
  }
}
