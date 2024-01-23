import 'dart:async';

import 'package:advance_mobile/app/DB/database.dart';
import 'package:flutter/material.dart';
import 'package:advance_mobile/app/config/style.dart';
import 'package:advance_mobile/app/config/dimens.dart';
import 'package:advance_mobile/app/features/Home/ChildScreen/home_slider.dart';
import 'package:advance_mobile/app/features/Home/ChildScreen/home_product.dart';
import 'package:advance_mobile/app/features/Home/ChildScreen/MyBottomNavigationBar.dart';
import 'package:advance_mobile/app/model/mode.dart';
import 'package:advance_mobile/app/DB/database.dart';

List<Category>? categories;
List<Product>? products;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ShopfeeDatabase.instance.init();
  insertData();

  categories = await ShopfeeDatabase.instance.getCategories();

  products = await ShopfeeDatabase.instance.getProducts();

  runApp(const MyApp());
}

void insertData() async {
  final List<Category> list_category = [
    Category(
        category_id: "1",
        name: 'Coffee',
        imageUrl:
            'http://res.cloudinary.com/dtvnsczg8/image/upload/v1696581433/drinks/admin/category/Cappuccino.png'),
    Category(
        category_id: "2",
        name: 'Latte',
        imageUrl:
            'http://res.cloudinary.com/dtvnsczg8/image/upload/v1696581459/drinks/admin/category/Latte.png'),
    Category(
        category_id: "3",
        name: 'Frosty',
        imageUrl:
            'http://res.cloudinary.com/dtvnsczg8/image/upload/v1696581582/drinks/admin/category/Milktea.png'),
    Category(
        category_id: "4",
        name: 'Mocha',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shopfee-12b03.appspot.com/o/category%2Fic_mocha.png?alt=media&token=6deee7f5-e219-4a3d-9caa-3c85e74d6483'),
    Category(
        category_id: "5",
        name: 'Tea',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shopfee-12b03.appspot.com/o/category%2Fic_tea%201.png?alt=media&token=a4aeb02c-46b3-4779-8344-061140609765'),
  ];
  // Insert Category
  for (Category category in list_category) {
    Category? existingCategory =
        await ShopfeeDatabase.instance.getCategoryById(category.category_id);

    if (existingCategory == null) {
      await ShopfeeDatabase.instance.insertCategory(category);
    } else {
      print('Category with ID ${category.category_id} already exists');
    }
  }

  //Data product
  final List<Product> list_product = [
    Product(
        id: 'a',
        name: "Ice Chocolate",
        description:
            "Not as sweet as Faint Silver or Milk Coffee, Ice Chocolate has a quieter, more poetic flavor. People often have to sit for a long time to fully feel the sweet aroma, the faint scent of cocoa and the smooth bitterness sliding down the palate.",
        category_id: "1",
        imageUrl:
            "http://res.cloudinary.com/dtvnsczg8/image/upload/v1696606751/drinks/admin/product/Cappuccino%2021.png",
        sizeList: [
          SizeModel(id: "a", size: "Small", price: 15, product_id: "a"),
          SizeModel(id: "b", size: "Medium", price: 20, product_id: "a"),
          SizeModel(id: "c", size: "Large", price: 25, product_id: "a")
        ],
        toppingList: [
          Topping(id: "a", name: "Pudding", price: 5, product_id: "a"),
          Topping(id: "b", name: "Popping boba", price: 5, product_id: "a")
        ]),
    Product(
        id: '653dd34922fa526a636da625',
        name: "Oolong Grilled Cream Cheese",
        description:
            "In particular, immediately conquer cheese lovers with the soft, salty cheese foam layer. It's even more delicious with pure grilled Oolong jelly, crunchy and chewy.",
        category_id: "2",
        imageUrl:
            "http://res.cloudinary.com/dtvnsczg8/image/upload/v1696607040/drinks/admin/product/Macchiato%2011.png",
        sizeList: [
          SizeModel(
              id: "a1",
              size: "Small",
              price: 15,
              product_id: "653dd34922fa526a636da625"),
          SizeModel(
              id: "b1",
              size: "Medium",
              price: 20,
              product_id: "653dd34922fa526a636da625"),
          SizeModel(
              id: "c1",
              size: "Large",
              price: 25,
              product_id: "653dd34922fa526a636da625")
        ],
        toppingList: [
          Topping(
              id: "a1",
              name: "Pudding",
              price: 5,
              product_id: "653dd34922fa526a636da625"),
          Topping(
              id: "b1",
              name: "Popping boba",
              price: 5,
              product_id: "653dd34922fa526a636da625")
        ]),
    Product(
        id: '653dd36322fa526a636da626',
        name: "Faint Silver",
        description:
            "Faint Silver is \"Cup of white milk with a little coffee\". This drink is very suitable for those who want to experience the bitter taste of coffee while also enjoying the sweet and fatty taste of milk.",
        category_id: "1",
        imageUrl:
            "http://res.cloudinary.com/dtvnsczg8/image/upload/v1696607062/drinks/admin/product/Macchiato%2021.png",
        sizeList: [
          SizeModel(
              id: "a2",
              size: "Small",
              price: 20,
              product_id: "653dd36322fa526a636da626"),
          SizeModel(
              id: "b2",
              size: "Medium",
              price: 25,
              product_id: "653dd36322fa526a636da626"),
          SizeModel(
              id: "c2",
              size: "Large",
              price: 30,
              product_id: "653dd36322fa526a636da626")
        ],
        toppingList: [
          Topping(
              id: "a2",
              name: "Pudding",
              price: 5,
              product_id: "653dd36322fa526a636da626"),
          Topping(
              id: "b2",
              name: "Popping boba",
              price: 5,
              product_id: "653dd36322fa526a636da626")
        ]),
    Product(
        id: '653dd39f22fa526a636da628',
        name: "Roasted Oolong Latte",
        description:
            "This is a healthy drink that helps you stay awake smoothly and relieve stress.",
        category_id: "2",
        imageUrl:
            "http://res.cloudinary.com/dtvnsczg8/image/upload/v1696607137/drinks/admin/product/Milktea%2021.png",
        sizeList: [
          SizeModel(
              id: "a3",
              size: "Small",
              price: 15,
              product_id: "653dd39f22fa526a636da628"),
          SizeModel(
              id: "b3",
              size: "Medium",
              price: 20,
              product_id: "653dd39f22fa526a636da628"),
          SizeModel(
              id: "c3",
              size: "Large",
              price: 25,
              product_id: "653dd39f22fa526a636da628")
        ],
        toppingList: [
          Topping(
              id: "a3",
              name: "Pudding",
              price: 5,
              product_id: "653dd39f22fa526a636da628"),
          Topping(
              id: "b3",
              name: "Popping boba",
              price: 5,
              product_id: "653dd39f22fa526a636da628")
        ]),
    Product(
        id: '6569940e754404378a043303',
        name: "Crafted Coffee",
        description:
        "Cold-brewed coffee with a splash of milk and real sugar; served over ice.",
        category_id: "1",
        imageUrl: "http://res.cloudinary.com/dtvnsczg8/image/upload/v1701417996/drinks/admin/product/Crafted%20Cappuchino_1701417992710.png",
        sizeList: [
          SizeModel(
              id: "a4",
              size: "Small",
              price: 10,
              product_id: "6569940e754404378a043303"),
          SizeModel(
              id: "b4",
              size: "Medium",
              price: 25,
              product_id: "6569940e754404378a043303"),
          SizeModel(
              id: "c4",
              size: "Large",
              price: 20,
              product_id: "6569940e754404378a043303")
        ],
        toppingList: [
          Topping(
              id: "a4",
              name: "Pudding",
              price: 5,
              product_id: "6569940e754404378a043303"),
          Topping(
              id: "b4",
              name: "Sugar",
              price: 5,
              product_id: "6569940e754404378a043303")
        ]),
  ];

  for (Product product in list_product) {
    Product? existingProduct =
        await ShopfeeDatabase.instance.getProductById(product.id!);

    if (existingProduct == null) {
      await ShopfeeDatabase.instance.insertProduct(Product(
          id: product.id,
          name: product.name,
          imageUrl: product.imageUrl,
          description: product.description,
          category_id: product.category_id));
      for (SizeModel sizeModel in product.sizeList!) {
        SizeModel? existingSize =
            await ShopfeeDatabase.instance.getSizeById(sizeModel.id);
        if (existingSize == null) {
          await ShopfeeDatabase.instance.insertSizeModel(SizeModel(
              id: sizeModel.id,
              size: sizeModel.size,
              price: sizeModel.price,
              product_id: sizeModel.product_id));
        } else {
          print('size with ID ${sizeModel.id} already exists');
        }
      }
      for (Topping topping in product.toppingList!) {
        Topping? existingToppping =
            await ShopfeeDatabase.instance.getToppingById(topping.id);
        if (existingToppping == null) {
          await ShopfeeDatabase.instance.insertTopping(Topping(
              id: topping.id,
              name: topping.name,
              price: topping.price,
              product_id: topping.product_id));
        } else {
          print('Toppping with ID ${topping.id} already exists');
        }
      }
    } else {
      print('Product with ID ${product.id} already exists');
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  late MyBottomNavigationBar myBottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool isScrolled) {
          return [
            SliverAppBar(
              snap: true,
              automaticallyImplyLeading: false,
              floating: true,
              toolbarHeight: 70,
              title: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: TextField(
                          enabled: false,
                          style: AppStyle.smallTextStyle,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(8),
                            suffixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16)),
                            hintText: "What would you like to drink today?",
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(Icons.notifications_none_outlined)
                  ],
                ),
              ),
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(1),
                child: Divider(height: 1),
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: AppDimen.spacing,
              ),
              const HomeSlider(),
              const SizedBox(
                height: AppDimen.spacing,
              ),
              Column(
                children: [
                  Container(
                    height: 80,
                    child: Scrollbar(
                      thickness: 1,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => InkWell(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: AppDimen.spacing),
                                  child: Column(
                                    children: [
                                      Image(
                                        image: NetworkImage(
                                            categories![index].imageUrl),
                                        width: 60,
                                        height: 60,
                                      ),
                                      Text(
                                        categories![index].name,
                                        style: AppStyle.mediumTextStyleDark,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(),
                          itemCount: categories!.length),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppDimen.screenPadding),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Outstanding Products",
                        style: AppStyle.mediumTitleStyleDark,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: products!.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppDimen.screenPadding),
                      child: HomeProduct(products![index]),
                    ),
                    separatorBuilder: (context, int index) => const Divider(
                      height: 8,
                      thickness: 0.75,
                    ),
                  ),
                  const SizedBox(
                    height: 68,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      // floatingActionButtonLocation:
      // FloatingActionButtonLocation.miniCenterFloat,
      // floatingActionButton: const HomeFloatAction(),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
