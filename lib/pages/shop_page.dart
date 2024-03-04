import 'package:coffee_shop/components/coffee_tile.dart';
import 'package:coffee_shop/models/coffee.dart';
import 'package:coffee_shop/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  // add coffee to cart 
  void addToCart (Coffee coffee) {

    //add to cart 
    Provider.of<Coffeeshop> (context,listen: false).addItemToCart(coffee);
    // let the user know that it got added to the cart 
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text("Successfully Added To The Cart"),
    ),);
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<Coffeeshop>(builder: (context, value, child) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            // Heading message
            Text(
              "How would you like your coffee?",
              style: TextStyle(fontSize: 20),
              ),

              const SizedBox(height: 25,),

              // List Of Coffees To Buy
              Expanded(child: ListView.builder(
                itemCount: value.coffeeShop.length,
                itemBuilder: (context, index) {
                // Get individual Coffee  
               Coffee eachCoffee = value.coffeeShop[index];

                // return tile for each coffee 
                return CoffeTile(coffee: eachCoffee,
                icon: Icon(Icons.add),
                onPressed: () => addToCart(eachCoffee),);
              }))
          ],
        ),
      ),
    ),);
  }
}