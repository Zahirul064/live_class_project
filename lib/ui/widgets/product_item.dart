import 'package:flutter/material.dart';
import 'package:live_class_project/ui/screens/update_product_screen.dart';

import '../../models/product.dart';

class ProductItem extends StatelessWidget {
  Product product;
  VoidCallback? onDeleteTab;

  ProductItem({super.key, required this.product, this.onDeleteTab});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        leading: Image.network(
          product.image ?? '',
          height: 100,
          width: 70,
        ),
        title: Text(product.productName ?? 'Unknown'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Product Code: ${product.productCode ?? 'Unknown'}'),
            Text('Quantity: ${product.quantity ?? 'Unknown'}'),
            Text('Price: ${product.unitPrice ?? 'Unknown'}'),
            Text('Total Price: ${product.totalPrice ?? 'Unknown'}'),
          ],
        ),
        trailing: Wrap(
          children: [
            IconButton(
                onPressed: onDeleteTab, // TODO: implement delete product api
                icon: const Icon(Icons.delete_outline),
              color: Colors.red,
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  UpdateProductScreen.name,
                  arguments: product,
                );
              },
              icon: const Icon(Icons.edit_outlined),
            ),
          ],
        ),
      ),
    );
  }
}

