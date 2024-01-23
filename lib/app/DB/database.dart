import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:advance_mobile/app/model/mode.dart';

import '../features/Home/main.dart';

class ShopfeeDatabase {
  static const DB_NAME = 'shopfee.db';
  static const DB_VERSION = '1';
  static Database? _database;

  ShopfeeDatabase._internal();

  static final ShopfeeDatabase instance = new ShopfeeDatabase._internal();

  // Insert a Category into the database
  Future<void> insertCategory(Category category) async {
    final db = await _database;
    await db?.insert('category', category.toMap());
  }

  // Insert a Topping into the database
  Future<void> insertTopping(Topping topping) async {
    final db = await _database;
    await db?.insert('topping', topping.toMap());
  }

  // Insert a SizeModel into the database
  Future<void> insertSizeModel(SizeModel sizeModel) async {
    final db = await _database;
    await db?.insert('size_model', sizeModel.toMap());
  }

  // Insert a Product into the database
  Future<void> insertProduct(Product product) async {
    final db = await _database;
    await db?.insert('product', product.toMap());
  }

  // Get all categories from the database
  Future<List<Category>> getCategories() async {
    final db = await _database;
    if (db == null) {
      throw Exception('Database not initialized');
    }
    final List<Map<String, dynamic>> maps = await db.query('category');
    return List.generate(maps.length, (i) {
      return Category(
        category_id: maps[i]['category_id'],
        name: maps[i]['name'],
        imageUrl: maps[i]['imageUrl'],
      );
    });
  }

  // Get all toppings from the database
  Future<List<Topping>> getToppings() async {
    final db = await _database;
    if (db == null) {
      throw Exception('Database not initialized');
    }
    final List<Map<String, dynamic>> maps = await db.query('topping');
    return List.generate(maps.length, (i) {
      return Topping(
        id: maps[i]['id'],
        name: maps[i]['name'],
        price: maps[i]['price'],
        product_id: maps[i]['product_id'],
      );
    });
  }

  // Get all size models from the database
  Future<List<SizeModel>> getSizeModels() async {
    final db = await _database;
    if (db == null) {
      throw Exception('Database not initialized');
    }
    final List<Map<String, dynamic>> maps = await db.query('size_model');
    return List.generate(maps.length, (i) {
      return SizeModel(
        id: maps[i]['id'],
        size: maps[i]['size'],
        price: maps[i]['price'],
        product_id: maps[i]['product_id'],
      );
    });
  }

  // Get all products from the database
  Future<List<Product>> getProducts() async {
    final db = await _database;
    if (db == null) {
      throw Exception('Database not initialized');
    }
    final List<Map<String, dynamic>> productMaps = await db.rawQuery('''
      SELECT
        product.id AS product_id,
        product.name AS product_name,
        product.description AS product_description,
        product.category_id AS product_category_id,
        product.imageUrl AS product_imageUrl,
        size_model.id AS size_id,
        size_model.size AS size_size,
        size_model.price AS size_price,
        topping.id AS topping_id,
        topping.name AS topping_name,
        topping.price AS topping_price
      FROM product
      LEFT JOIN size_model ON product.id = size_model.product_id
      LEFT JOIN topping ON product.id = topping.product_id
    ''');
    final List<Product> products = [];

    for (var row in productMaps) {
      // Extract product information
      String productId = row['product_id'];
      String productName = row['product_name'];
      String productDescription = row['product_description'];
      String productCategoryId = row['product_category_id'];
      String productImageUrl = row['product_imageUrl'];

      // Check if the product already exists in the list
      Product existingProduct = products.firstWhere(
        (product) => product.id == productId,
        orElse: () => Product(
          id: productId,
          name: productName,
          description: productDescription,
          category_id: productCategoryId,
          imageUrl: productImageUrl,
          sizeList: [],
          toppingList: [],
        ),
      );
      if (row['size_id'] != null) {
        SizeModel size = SizeModel(
          id: row['size_id'],
          size: row['size_size'],
          price: row['size_price'],
          product_id: productId,
        );
        existingProduct.sizeList?.add(size);
      }

      // Extract topping information and add to the product
      if (row['topping_id'] != null) {
        Topping topping = Topping(
          id: row['topping_id'],
          name: row['topping_name'],
          price: row['topping_price'],
          product_id: productId,
        );
        existingProduct.toppingList?.add(topping);
      }
      if (!products.contains(existingProduct)) {
        products.add(existingProduct);
      } else {
        int index = products.indexOf(existingProduct);
        products[index] = existingProduct;
      }
    }

    return products;
  }

  //get category by id
  Future<Category?> getCategoryById(String categoryId) async {
    final db = await _database;
    List<Map<String, dynamic>> maps = await db!.query(
      'category',
      where: 'category_id = ?',
      whereArgs: [categoryId],
    );

    if (maps.isNotEmpty) {
      return Category(
        category_id: maps[0]['category_id'],
        name: maps[0]['name'],
        imageUrl: maps[0]['imageUrl'],
      );
    } else {
      return null;
    }
  }

  //get category by id
  Future<Product?> getProductById(String productId) async {
    final db = await _database;
    List<Map<String, dynamic>> maps = await db!.query(
      'product',
      where: 'id = ?',
      whereArgs: [productId],
    );

    if (maps.isNotEmpty) {
      return Product(
          id: maps[0]['id'],
          name: maps[0]['name'],
          imageUrl: maps[0]['imageUrl']);
    } else {
      return null;
    }
  }

  //get toppping by id
  Future<Topping?> getToppingById(String id) async {
    final db = await _database;
    List<Map<String, dynamic>> maps = await db!.query(
      'topping',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Topping(
          id: maps[0]['id'],
          name: maps[0]['name'],
          product_id: maps[0]['product_id'],
          price: maps[0]['price']);
    } else {
      return null;
    }
  }

  //get size by id
  Future<SizeModel?> getSizeById(String id) async {
    final db = await _database;
    List<Map<String, dynamic>> maps = await db!.query(
      'size_model',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return SizeModel(
          id: maps[0]['id'],
          size: maps[0]['size'],
          product_id: maps[0]['product_id'],
          price: maps[0]['price']);
    } else {
      return null;
    }
  }

  init() async {
    // String path = join(await getDatabasesPath(), DB_NAME);
    // await deleteDatabase(path);
    //
    // print('Database deleted');

    _database = await openDatabase(join(await getDatabasesPath(), DB_NAME),
        version: 1, onCreate: (db, version) async {
      // Create Category table
      await db.execute('''
      CREATE TABLE category (
        category_id TEXT PRIMARY KEY,
        name TEXT,
        imageUrl TEXT
      )
    ''');

      // Create Topping table
      await db.execute('''
      CREATE TABLE topping (
        id TEXT PRIMARY KEY,
        name TEXT,
        price REAL,
        product_id TEXT,
        FOREIGN KEY (product_id) REFERENCES product(id)
      )
    ''');

      // Create SizeModel table
      await db.execute('''
      CREATE TABLE size_model (
        id TEXT PRIMARY KEY,
        size TEXT,
        price REAL,
        product_id TEXT,
        FOREIGN KEY (product_id) REFERENCES product(id)
      )
    ''');

      // Create Product table
      await db.execute('''
      CREATE TABLE product (
        id TEXT PRIMARY KEY,
        name TEXT,
        imageUrl TEXT,
        description TEXT,
        category_id TEXT,
        FOREIGN KEY (category_id) REFERENCES category(category_id)
      )
    ''');
    });
  }
}
