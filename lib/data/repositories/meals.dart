import 'package:locabite/data/models/chef.dart';
import 'package:locabite/data/models/driver.dart';
import 'package:locabite/data/models/meal.dart';
import 'package:locabite/data/models/order.dart';
import 'package:locabite/data/models/payment_model.dart';

final List<Meal> meals = [
  Meal(
    id: '8058947523872',
    title: 'Pepper soup',
    description:
        'pepper soup is sweetest soup one can ever taste for life. i tell you the truth i lie not.',
    units: 4,
    availabilityStatus: true,
    chef: 'faveites',
    price: 3999,
    image: 'assets/images/food1.jpeg',
  ),
  Meal(
    id: '8058843983872',
    title: 'Ogbono Soup',
    description:
        'Ogbono soup is sweetest soup one can ever taste for life. i tell you the truth i lie not.',
    units: 4,
    availabilityStatus: false,
    chef: 'mybites',
    price: 3999,
    image: 'assets/images/food2.jpeg',
  ),
  Meal(
    id: '8058947523872',
    title: 'Jollof Spaghetti',
    description:
        'Jollof Spaghetti is sweetest meal one can ever taste for life. i tell you the truth i lie not.',
    units: 5,
    availabilityStatus: false,
    chef: 'faveites',
    price: 3999,
    image: 'assets/images/food3.jfif',
  ),
  Meal(
    id: '8058037523872',
    title: 'Vegetable Soup and Akpo',
    description:
        'Vegetable Soup and Akpo is sweetest meal one can ever taste for life. i tell you the truth i lie not.',
    units: 6,
    availabilityStatus: true,
    chef: 'faveites',
    price: 3999,
    image: 'assets/images/food4.jpeg',
  ),
];
List<Chef> chefs = [
  Chef(
    address: 'ugbolyu stri kdsjf',
    lastName: 'obi',
    firstName: 'favour',
    bio: 'kdsa;lfjajfalalkj',
    brandName: 'favorucookies',
    email: 'favouroghenevwoke@gmail.com',
    id: '87257982958-092',
    image: 'assets/images/brandimage.jpg',
    phoneNumber: '08086170563',
    accountName: 'Obi Frank',
    accountNo: 46733738383838,
    
  ),
];

List<Driver> drivers = [
  Driver(
    id: 'jfdhaskjah',
    firstName: 'johnny',
    lastName: 'okezie',
    email: 'johnny@gmail.com',
    phoneNumber: '834483948398493',
    vehicleLicenseNo: '234ii33',
    accountName: 'johnny okezie',
    accountNo: 238283282929,
  ),
];

List<Order> get orders => [
  jollofRiceOrder,
  mixedMealOrder,
  soupOrder,
  breakfastOrder,
  partyOrder,
];

Order get jollofRiceOrder => Order(
  orderId: '18948474793hdju',
  orderDate: DateTime.now().subtract(const Duration(hours: 2)),
  items: [
    OrderItem(name: 'Jollof Rice', quantity: 2, price: 1800.00),
    OrderItem(name: 'Grilled Chicken', quantity: 2, price: 1200.00),
    OrderItem(name: 'Chapman Drink', quantity: 2, price: 600.00),
  ],
  subtotal: 3600.00,
  deliveryFee: 500.00,
  orderStatus: 'completed',
  // time: ,
  total: 4050.00,
);

Order get mixedMealOrder => Order(
  orderId: '189484hfak93999t',
  orderDate: DateTime.now().subtract(const Duration(days: 1)),
  items: [
    OrderItem(name: 'Fried Rice', quantity: 1, price: 2200.00),
    OrderItem(name: 'Beef Stir Fry', quantity: 1, price: 1800.00),
    OrderItem(name: 'Spring Rolls', quantity: 3, price: 300.00),
    OrderItem(name: 'Mango Juice', quantity: 2, price: 400.00),
  ],
  subtotal: 4700.00,
  deliveryFee: 600.00,
  orderStatus: 'completed',

  total: 5488.00,
);

Order get soupOrder => Order(
  orderId: '1894847479388u3',
  orderDate: DateTime.now().subtract(const Duration(days: 3)),
  items: [
    OrderItem(name: 'Pounded Yam', quantity: 1, price: 1500.00),
    OrderItem(name: 'Egusi Soup', quantity: 1, price: 2500.00),
    OrderItem(name: 'Assorted Meat', quantity: 1, price: 1200.00),
    OrderItem(name: 'Palm Wine', quantity: 1, price: 1000.00),
  ],
  subtotal: 6200.00,
  deliveryFee: 700.00,
  total: 6648.00,
  orderStatus: 'completed',
);

Order get breakfastOrder => Order(
  orderId: '18948474793999t',
  orderDate: DateTime.now().subtract(const Duration(days: 7)),
  items: [
    OrderItem(name: 'Yam and Egg Sauce', quantity: 1, price: 1200.00),
    OrderItem(name: 'Akara (6 pcs)', quantity: 1, price: 600.00),
    OrderItem(name: 'Pap', quantity: 1, price: 400.00),
    OrderItem(name: 'Tea', quantity: 2, price: 200.00),
  ],
  subtotal: 2400.00,
  deliveryFee: 400.00,
  orderStatus: 'completed',

  total: 2796.00,
);

Order get partyOrder => Order(
  orderId: '18948yui993999t',
  orderDate: DateTime.now().subtract(const Duration(days: 15)),
  items: [
    OrderItem(name: 'Small Chops Platter', quantity: 2, price: 8000.00),
    OrderItem(name: 'Jollof Rice (Large)', quantity: 1, price: 5000.00),
    OrderItem(name: 'Fried Rice (Large)', quantity: 1, price: 5000.00),
    OrderItem(name: 'Grilled Chicken (20 pcs)', quantity: 1, price: 6000.00),
    OrderItem(name: 'Soft Drinks Pack', quantity: 1, price: 3000.00),
  ],
  subtotal: 27000.00,
  deliveryFee: 1500.00,
  orderStatus: 'completed',
  total: 27580.00,
);
