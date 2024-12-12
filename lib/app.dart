import 'package:flutter/material.dart';
import 'package:live_class_project/models/product.dart';
import 'package:live_class_project/ui/screens/add_new_product_screen.dart';
import 'package:live_class_project/ui/screens/product_list_screen.dart';
import 'package:live_class_project/ui/screens/update_product_screen.dart';

class CRUDApp extends StatelessWidget {
  const CRUDApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        late Widget widget;
        if (settings.name == '/') {
          widget = const ProductListScreen();
        } else if (settings.name == AddProductScreen.name) {
          widget = const AddProductScreen();
        } else if (settings.name == UpdateProductScreen.name) {
          final Product product = settings.arguments as Product;
          widget = UpdateProductScreen(product: product);
        }

        return MaterialPageRoute(
          builder: (context) {
            return widget;
          },
        );
      },
      theme: ThemeData(
          colorSchemeSeed: Colors.blue,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            backgroundColor: Colors.blue,
            iconTheme: IconThemeData(
                color: Colors.white
            ),
            titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.brown),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.brown),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.brown),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              foregroundColor: Colors.white,
              textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
              ),
            ),
          )
      ),
    );
  }
}