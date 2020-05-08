
import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Cart',
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 5),
          Card(
            margin: EdgeInsets.all(10),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'TOTAL :',
                    style: Theme.of(context).textTheme.body2.copyWith(
                        color: Theme.of(context).primaryColor, fontSize: 20),
                  ),
                  Chip(
                    label: Text('\$${cart.totalAmount}'),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  OutlineButton(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 5,
                    ),
                    borderSide: BorderSide(
                      width: 2,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {},
                    child: Text(
                      'CHECKOUT',
                      style: Theme.of(context).textTheme.body2.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, i) => CartItem(
                cart.items.values.toList()[i].id,
                cart.items.keys.toList()[i],
                cart.items.values.toList()[i].title,
                cart.items.values.toList()[i].price,
                cart.items.values.toList()[i].quantity,
                cart.items.values.toList()[i].imageUrl,
              ),
              itemCount: cart.items.length,
            ),
          ),
        ],
      ),
    );
  }
}
