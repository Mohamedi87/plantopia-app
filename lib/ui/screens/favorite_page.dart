import 'package:flutter/material.dart';
import 'package:plantopia/constants/constants.dart';
import 'package:plantopia/models/plants.dart';
import 'package:plantopia/widgets/plant_widget.dart';

class FavoritePage extends StatefulWidget {
  final List<Plant> favoritesPlants;
  const FavoritePage({super.key, required this.favoritesPlants});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: widget.favoritesPlants.isEmpty
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    child: Image.asset('assets/images/favorited.png'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Your Favorited Plants',
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
              child: ListView.builder(
                itemCount: widget.favoritesPlants.length,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return PlantWidget(
                      index: index, plantList: widget.favoritesPlants);
                },
              ),
            ),
    );
  }
}
