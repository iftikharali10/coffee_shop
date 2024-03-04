import 'package:coffee_shop/components/coffee_tile.dart';
import 'package:coffee_shop/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/coffee.dart';
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  // remove cart item 

  void removeFromCart (Coffee coffee) {
    Provider.of<Coffeeshop>(context,listen: false).removeItemFromCart(coffee);
  }

  // pay button
  void payNow() {
    /*
    Fill out your payment services here 
    */
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Coffeeshop>(builder: (context, value, child) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            // Heading
            Text("Your Cart",
            style: TextStyle(fontSize: 20),
            ),
            // List of Cart Items
            Expanded(child: ListView.builder(
              itemCount: value.userCart.length,
              itemBuilder: (context, index) {
              // get individual coffees
              Coffee eachCoffee = value.userCart[index];
              
              // return coffee tile 
              return CoffeTile(
                coffee: eachCoffee,
                 onPressed: () => removeFromCart(eachCoffee),
                  icon: Icon(Icons.delete),
                  );
            },
            ),
            
            
            ),
            // pay button
            GestureDetector(
              onTap: payNow,
              child: Container(
                padding: const EdgeInsets.all(25),
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.brown,
                borderRadius: BorderRadius.circular(12)),
                child: const Center(
                  child: Text("Pay Now",
                  style: TextStyle(color: Colors.white),),
                ),
                
              ),
            )

          ],
        ),
      ),
    ),);
  }
}