import 'package:flutter/material.dart';

import './products_manager.dart';
import 'edit_product_screen.dart';
import '../../models/product.dart';
import 'package:provider/provider.dart';

class UserProductListTile extends StatelessWidget{
  final Product product;

  const UserProductListTile(
    this.product, {
    super.key,
  });

  @override
  Widget build(BuildContext context){
    return ListTile(
      title: Text(product.title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: <Widget>[
            buildEditButton(context),
            buildDeleteButton(context),
          ],
        ),
      ),
    );
  }

  Widget buildDeleteButton(BuildContext context){
    return IconButton(
      icon: const Icon(Icons.delete),
      onPressed: () {
        // print('Delete product');
        context.read<ProductsManager>().deleteProduct(product.id!);
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            const SnackBar(
              content: Text(
                'Product deleted',
                textAlign: TextAlign.center,
              ),
            ),
          );
      },
      color: Theme.of(context).colorScheme.error,
    );
  }

  // Widget buildEditButton(BuildContext context){
  //   return IconButton(
  //     icon: const Icon(Icons.edit),
  //     onPressed: () {
  //       print('Go to edit product screen');
  //     },
  //     color: Theme.of(context).primaryColor,
  //   );
  // }
  Widget buildEditButton(BuildContext context){
    return IconButton(
      icon: const Icon(Icons.edit),
      onPressed: () {
        // print('Go to edit product screen');
        Navigator.of(context).pushNamed(
          EditProductScreen.routeName,
          arguments: product.id,
        );
      },
      color: Theme.of(context).primaryColor,
    );
  }
}