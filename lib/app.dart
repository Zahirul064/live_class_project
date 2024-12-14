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
      title: 'Crud App',
      home: const ProductListScreen(),
      theme: buildThemeData(),
      darkTheme: _darkThemeData(),
      themeMode: ThemeMode.system, // Adjust to ThemeMode.dark for testing
    );
  }

  ThemeData buildThemeData() {
    return ThemeData(
      colorSchemeSeed: Colors.blue,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
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
          textStyle:
          const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
      ),
    );
  }

  ThemeData _darkThemeData() {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: Colors.purple,
        secondary: Colors.deepOrange,
        surface: Colors.grey[850]!,
        error: Colors.red,
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        onSurface: Colors.white,
        onError: Colors.white,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.purple,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.purple),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepOrange),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white70),
        titleLarge: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}