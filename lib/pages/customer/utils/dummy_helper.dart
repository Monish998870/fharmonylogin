import '../app/data/models/category_model.dart';
import '../app/data/models/product_model.dart';
import 'constants.dart';

class DummyHelper {
  const DummyHelper._();

  static const _ginderDescription = 'Ginger is a flowering plant whose rhizome, ginger root or ginger, is widely used as a spice and a folk medicine.';
  static const _bellPepperRedDescription = 'Red bell peppers are sweet, crisp vegetables packed with vitamin C, antioxidants, and used in salads, stir-fries, or roasted.';
  static const _freshLettuceDescription = 'Lettuce is a leafy green vegetable known for its crisp texture, refreshing taste, and use in salads, wraps, and sandwiches.';
  static const _butternutSquashDescription = 'Butternut squash is a versatile winter vegetable with a sweet, nutty flavor, perfect for soups, roasts, or pureed dishes.';
  static const _organicCarrotsDescription = 'Organic carrots are crunchy, nutritious root vegetables rich in beta-carotene, vitamin A, and ideal for snacks, stews, or juicing.';
  static const _freshBroccoliDescription = 'Broccoli is a nutrient-dense cruciferous vegetable, high in fiber and vitamins, commonly steamed, stir-fried, or eaten raw.';
  static const _cherryTomatoDescription = 'Cherry tomatoes are small, juicy fruits with a sweet-tart flavor, perfect for salads, snacks, or adding color to dishes.';
  static const _freshSpinachDescription = 'Spinach is a nutrient-rich leafy green vegetable, high in iron and vitamins, commonly used in salads, smoothies, or cooked dishes.';

  static const _appleDescription = 'Apples are crisp, juicy fruits available in various flavors, rich in fiber and vitamins, enjoyed raw, baked, or in desserts.';
  static const _bananaDescription = 'Bananas are soft, sweet fruits rich in potassium and energy, commonly eaten fresh or used in smoothies, desserts, and baking.';
  static const _lemonDescription = 'Lemons are tangy, citrus fruits high in vitamin C, often used for flavoring drinks, marinades, dressings, and desserts.';
  static const _custardAppleDescription = 'Custard apples are creamy, sweet fruits with a rich flavor, enjoyed fresh or used in desserts, smoothies, and beverages.';

  static const _riceDescription = 'Rice is a versatile staple grain, available in various types, commonly boiled, steamed, or fried, and used in diverse cuisines.';
  static const _wheatDescription = 'Wheat is a globally cultivated grain used to produce flour for bread, pasta, and other staples, rich in carbohydrates and fiber.';
  static const _brownRiceDescription = 'Brown rice is a whole-grain alternative to white rice, retaining its bran layer, rich in fiber, nutrients, and a nutty flavor.';
  static const _cornDescription = 'Corn is a sweet, starchy vegetable, often eaten fresh, roasted, or processed into flour, syrup, and other food products.';

  static const _chickenMeatDescription = 'Chicken is a versatile, lean protein source, widely used in global cuisines, suitable for grilling, frying, roasting, or curries.';
  static const _goatMeatDescription = 'Goat is a lean, nutritious meat, rich in iron and protein, often used in curries, stews, barbecues, or grilled dishes.';
  static const _crabMeatDescription = 'Crab is a succulent shellfish with sweet, tender meat, enjoyed in soups, curries, or as a delicacy in seafood dishes.';
  static const _fishMeatDescription = 'Fish is a nutrient-rich protein source, high in omega-3 fatty acids, often grilled, fried, baked, or used in soups and curries.';


  static List<Map<String, String>> cards = [
    {'icon': Constants.lotus, 'title': '100%', 'subtitle': 'Organic'},
    {'icon': Constants.calendar, 'title': '1 Year', 'subtitle': 'Expiration'},
    {'icon': Constants.favourites, 'title': '4.8 (256)', 'subtitle': 'Reviews'},
    {'icon': Constants.matches, 'title': '80 kcal', 'subtitle': '100 Gram'},
  ];

  static List<CategoryModel> categories = [
    CategoryModel(id: 1, title: 'Fruits', image: Constants.apple),
    CategoryModel(id: 2, title: 'Vegetables', image: Constants.broccoli),
    CategoryModel(id: 3, title: 'Grains', image: Constants.grains),
    CategoryModel(id: 4, title: 'Meats', image: Constants.meats),
  ];

  static List<ProductModel> bestproducts = [
    ProductModel(
      id: 1,
      image: Constants.bellPepper,
      name: 'Bell Pepper Red',
      quantity: 0,
      price: 5.99,
      description: _bellPepperRedDescription
    ),
    ProductModel(
      id: 2,
      image: Constants.goatMeat,
      name: 'Goat Meat',
      quantity: 0,
      price: 44.99,
      description: _goatMeatDescription
    ),

  ];
/*
  static List<ProductModel> vegetablesproducts = [
    ProductModel(
        id: 1,
        image: Constants.bellPepper,
        name: 'Bell Pepper Red',
        quantity: 0,
        price: 5.99,
        description: _bellPepperRedDescription
    ),
    ProductModel(
        id: 3,
        image: Constants.ginger,
        name: 'Arabic Ginger',
        quantity: 0,
        price: 4.99,
        description: _ginderDescription
    ),
    ProductModel(
      id: 4,
      image: Constants.cabbage,
      name: 'Fresh Lettuce',
      quantity: 0,
      price: 3.99,
      description: _freshLettuceDescription,
    ),
    ProductModel(
      id: 5,
      image: Constants.pumpkin,
      name: 'Butternut Squash',
      quantity: 0,
      price: 8.99,
      description:_butternutSquashDescription,
    ),
    ProductModel(
      id: 6,
      image: Constants.carrot,
      name: 'Organic Carrots',
      quantity: 0,
      price: 5.99,
      description:_organicCarrotsDescription,
    ),
    ProductModel(
      id: 7,
      image: Constants.freshbroccoli,
      name: 'Fresh Broccoli',
      quantity: 0,
      price: 3.99,
      description: _freshBroccoliDescription,
    ),
    ProductModel(
      id: 8,
      image: Constants.tomatoes,
      name: 'Cherry Tomato',
      quantity: 0,
      price: 5.99,
      description: _cherryTomatoDescription,
    ),
    ProductModel(
      id: 9,
      image: Constants.spinach,
      name: 'Fresh Spinach',
      quantity: 0,
      price: 2.99,
      description: _freshSpinachDescription,
    ),
  ];

  static List<ProductModel> fruitsproducts = [
    ProductModel(
        id: 1,
        image: Constants.redapple,
        name: 'Apple',
        quantity: 0,
        price: 5.99,
        description: _appleDescription
    ),
    ProductModel(
        id: 3,
        image: Constants.banana,
        name: 'Banana',
        quantity: 0,
        price: 4.99,
        description: _bananaDescription
    ),
    ProductModel(
      id: 4,
      image: Constants.lemon,
      name: 'Lemon',
      quantity: 0,
      price: 3.99,
      description: _lemonDescription,
    ),
    ProductModel(
      id: 5,
      image: Constants.custardapple,
      name: 'Custard Apple',
      quantity: 0,
      price: 8.99,
      description:_custardAppleDescription,
    ),
      ];

  static List<ProductModel> grainsproducts = [
    ProductModel(
        id: 1,
        image: Constants.rice,
        name: 'Rice',
        quantity: 0,
        price: 5.99,
        description: _riceDescription
    ),
    ProductModel(
        id: 3,
        image: Constants.wheat,
        name: 'Wheat',
        quantity: 0,
        price: 4.99,
        description: _wheatDescription
    ),
    ProductModel(
      id: 4,
      image: Constants.brownrice,
      name: 'Brown Rice',
      quantity: 0,
      price: 3.99,
      description: _brownRiceDescription,
    ),
    ProductModel(
      id: 5,
      image: Constants.corn,
      name: 'Corn',
      quantity: 0,
      price: 8.99,
      description:_cornDescription,
    ),
  ];

  static List<ProductModel> meatsproducts = [
    ProductModel(
        id: 1,
        image: Constants.chickenMeat,
        name: 'Chicken',
        quantity: 0,
        price: 5.99,
        description: _chickenMeatDescription
    ),
    ProductModel(
        id: 3,
        image: Constants.goatMeat,
        name: 'Goat',
        quantity: 0,
        price: 4.99,
        description: _goatMeatDescription
    ),
    ProductModel(
      id: 4,
      image: Constants.fishMeat,
      name: 'Fish',
      quantity: 0,
      price: 3.99,
      description: _fishMeatDescription,
    ),
    ProductModel(
      id: 5,
      image: Constants.crabMeat,
      name: 'crab',
      quantity: 0,
      price: 8.99,
      description:_crabMeatDescription,
    ),
  ];


 */

  static List<ProductModel> products = [

    ProductModel(
        id: 1,
        image: Constants.bellPepper,
        name: 'Bell Pepper Red',
        quantity: 0,
        price: 5.99,
        description: _bellPepperRedDescription
    ),
    ProductModel(
      id: 2,
      image: Constants.spinach,
      name: 'Fresh Spinach',
      quantity: 0,
      price: 2.99,
      description: _freshSpinachDescription,
    ),
    ProductModel(
        id: 3,
        image: Constants.ginger,
        name: 'Arabic Ginger',
        quantity: 0,
        price: 4.99,
        description: _ginderDescription
    ),
    ProductModel(
      id: 4,
      image: Constants.cabbage,
      name: 'Fresh Lettuce',
      quantity: 0,
      price: 3.99,
      description: _freshLettuceDescription,
    ),
    ProductModel(
      id: 5,
      image: Constants.pumpkin,
      name: 'Butternut Squash',
      quantity: 0,
      price: 8.99,
      description:_butternutSquashDescription,
    ),
    ProductModel(
      id: 6,
      image: Constants.carrot,
      name: 'Organic Carrots',
      quantity: 0,
      price: 5.99,
      description:_organicCarrotsDescription,
    ),
    ProductModel(
      id: 7,
      image: Constants.freshbroccoli,
      name: 'Fresh Broccoli',
      quantity: 0,
      price: 3.99,
      description: _freshBroccoliDescription,
    ),
    ProductModel(
      id: 8,
      image: Constants.tomatoes,
      name: 'Cherry Tomato',
      quantity: 0,
      price: 5.99,
      description: _cherryTomatoDescription,
    ),

    ProductModel(
        id: 9,
        image: Constants.redapple,
        name: 'Apple',
        quantity: 0,
        price: 5.99,
        description: _appleDescription
    ),
    ProductModel(
        id: 10,
        image: Constants.banana,
        name: 'Banana',
        quantity: 0,
        price: 4.99,
        description: _bananaDescription
    ),
    ProductModel(
      id: 11,
      image: Constants.lemon,
      name: 'Lemon',
      quantity: 0,
      price: 3.99,
      description: _lemonDescription,
    ),
    ProductModel(
      id: 12,
      image: Constants.custardapple,
      name: 'Custard Apple',
      quantity: 0,
      price: 8.99,
      description:_custardAppleDescription,
    ),
    ProductModel(
        id: 13,
        image: Constants.rice,
        name: 'Rice',
        quantity: 0,
        price: 5.99,
        description: _riceDescription
    ),
    ProductModel(
        id: 14,
        image: Constants.wheat,
        name: 'Wheat',
        quantity: 0,
        price: 4.99,
        description: _wheatDescription
    ),
    ProductModel(
      id: 15,
      image: Constants.brownrice,
      name: 'Brown Rice',
      quantity: 0,
      price: 3.99,
      description: _brownRiceDescription,
    ),
    ProductModel(
      id: 16,
      image: Constants.corn,
      name: 'Corn',
      quantity: 0,
      price: 8.99,
      description:_cornDescription,
    ),
    ProductModel(
        id: 17,
        image: Constants.chickenMeat,
        name: 'Chicken',
        quantity: 0,
        price: 5.99,
        description: _chickenMeatDescription
    ),
    ProductModel(
        id: 18,
        image: Constants.goatMeat,
        name: 'Goat',
        quantity: 0,
        price: 4.99,
        description: _goatMeatDescription
    ),
    ProductModel(
      id: 19,
      image: Constants.fishMeat,
      name: 'Fish',
      quantity: 0,
      price: 3.99,
      description: _fishMeatDescription,
    ),
    ProductModel(
      id: 20,
      image: Constants.crabMeat,
      name: 'crab',
      quantity: 0,
      price: 8.99,
      description:_crabMeatDescription,
    ),
  ];
}