import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp_state_management_provider/list_product.dart';
import 'provider/products_provider.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductsProvider()..getProducts(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Provider',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.blueAccent,
          leading: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          title: const Text(
            'Online Store',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            Row(
              children: [
                const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                IconButton(
                  onPressed: (() {}),
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Consumer<ProductsProvider>(
          builder: (context, value, child) {
            if (value.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.blueGrey,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) {
                  return ListProduct(product: value.products[index]);
                },
                itemCount: value.products.length,
              ),
            );
          },
        )

        );
  }
}
