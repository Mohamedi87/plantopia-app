import 'package:flutter/material.dart';
import 'package:plantopia/constants/constants.dart';
import 'package:plantopia/models/plants.dart';
import 'package:plantopia/widgets/plant_widget.dart';

class CartPage extends StatefulWidget {
  final List<Plant> addedToCartPlants;
  const CartPage({super.key, required this.addedToCartPlants});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: widget.addedToCartPlants.isEmpty
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    child: Image.asset('assets/images/add-cart.png'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Your Cart Is Emty',
                    style: TextStyle(
                        color: Constants.primaryColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 18.0),
                  )
                ],
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
              height: size.height,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.addedToCartPlants.length,
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return PlantWidget(
                            index: index, plantList: widget.addedToCartPlants);
                      },
                    ),
                  ),
                  Column(
                    children: [
                      Divider(
                        thickness: 1.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Totals',style: TextStyle(
                            color: Constants.primaryColor,
                            fontSize: 23.0,
                            fontWeight: FontWeight.w300,
                          ),),
                          Text(r'$110',style: TextStyle(
                            fontSize: 24.0,
                            color: Constants.primaryColor,
                            fontWeight: FontWeight.bold
                          ),)
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
    );
  }
}
