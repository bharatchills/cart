// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ListModel.dart';

void main() {
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class Product {
  Product({required this.name, required this.price});

  final String name;
  final double price;
}

final _products = [
  Product(name: 'iPhone', price: 999),
  Product(name: 'cookie', price: 2),
  Product(name: 'ps5', price: 500),
];

final productsProvider = Provider<List<Product>>((ref) {
  return _products;
});

final subTotalProvider = StateProvider((ref) => 0);
final shoppingCost = StateProvider((ref) => 0);
final taxesProvider = StateProvider((ref) => 0);

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsProvider);

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffF5F4F5),
        appBar: AppBar(
          backgroundColor: Color(0xff5D8C99),
          title: Center(child: Text("Shopping Cart")),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: Colors.white,
                  child: Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 100,
                                child: Image.network(
                                    "https://img.freepik.com/premium-photo/running-shoes-white-background_10541-635.jpg?w=200"),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(products[index].name),
                                  Row(
                                    children: [
                                      Text(products[index].price.toString()),
                                      TextButton(
                                          onPressed: () {},
                                          child: Icon(Icons.add)),
                                      Text("0"),
                                      TextButton(
                                          onPressed: () {},
                                          child: Icon(Icons.remove)),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        );
                      },
                      itemCount: products.length,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.white,
                  child: Column(children: [
                    ListTile(
                      leading: Text("Subtotal"),
                      trailing: Text(
                          ref.watch(subTotalProvider.state).state.toString()),
                    ),
                    ListTile(
                      leading: Text("Shopping Cost"),
                      trailing:
                          Text(ref.watch(shoppingCost.state).state.toString()),
                    ),
                    ListTile(
                      leading: Text("Taxes"),
                      trailing:
                          Text(ref.watch(taxesProvider.state).state.toString()),
                    ),
                    ListTile(
                      leading: Text("Total"),
                      trailing: Text((ref.watch(subTotalProvider.state).state +
                              ref.watch(shoppingCost.state).state +
                              ref.watch(taxesProvider.state).state)
                          .toString()),
                    ),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
