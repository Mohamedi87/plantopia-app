import 'package:flutter/material.dart';
import 'package:plantopia/constants/constants.dart';
import 'package:plantopia/models/plants.dart';
import 'package:plantopia/widgets/plant_feature.dart';

class DetailPage extends StatefulWidget {
  final int plantId;
  const DetailPage({super.key, required this.plantId});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> _plantList = Plant.plantList;

    bool toggleIsFavorited(bool isFavorited) {
      return !isFavorited;
    }

    bool toggleIsSelected(bool isSelected) {
      return !isSelected;
    }

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Constants.primaryColor.withOpacity(.15)),
                    child: Icon(
                      Icons.close,
                      color: Constants.primaryColor,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint('favorites');
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Constants.primaryColor.withOpacity(.15)),
                    child: IconButton(
                      color: Constants.primaryColor,
                      onPressed: () {
                        setState(() {
                          bool isFavorated = toggleIsFavorited(
                              _plantList[widget.plantId].isFavorated);
                          _plantList[widget.plantId].isFavorated = isFavorated;
                        });
                      },
                      icon: _plantList[widget.plantId].isFavorated
                          ? const Icon(Icons.favorite)
                          : const Icon(Icons.favorite_border),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: Container(
              height: size.height * 0.8,
              width: size.width * 0.8,
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 0,
                    child: SizedBox(
                      height: 350,
                      child: Image.asset(
                        _plantList[widget.plantId].imageURL,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 0,
                    child: SizedBox(
                      height: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PlantFeature(
                            title: "Size",
                            plantFeature: _plantList[widget.plantId].size,
                          ),
                          PlantFeature(
                            title: "Humidity",
                            plantFeature:
                                _plantList[widget.plantId].humidity.toString(),
                          ),
                          PlantFeature(
                            title: "Temperature",
                            plantFeature: _plantList[widget.plantId]
                                .temperature
                                .toString(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.5,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
              height: size.height * 0.5,
              width: size.width,
              decoration: BoxDecoration(
                color: Constants.primaryColor.withOpacity(0.4),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _plantList[widget.plantId].plantName,
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Constants.primaryColor,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            r'$' + _plantList[widget.plantId].price.toString(),
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Constants.blackColor,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            _plantList[widget.plantId].rating.toString(),
                            style: TextStyle(
                                fontSize: 30.0, color: Constants.primaryColor),
                          ),
                          Icon(
                            Icons.star,
                            size: 30.0,
                            color: Constants.primaryColor,
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Expanded(
                    child: Text(
                      _plantList[widget.plantId].decription,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        height: 1.5,
                        fontSize: 18.0,
                        color: Constants.blackColor.withOpacity(0.7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: size.width * 0.9,
        height: 50,
        child: Row(
          children: [
            Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                    color: Constants.primaryColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 1),
                          blurRadius: 5,
                          color: _plantList[widget.plantId].isSelected
                              ? Constants.primaryColor.withOpacity(0.5)
                              : Colors.white)
                    ]),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      bool isSelected = toggleIsSelected(
                          _plantList[widget.plantId].isSelected);
                      _plantList[widget.plantId].isSelected = isSelected;
                    });
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    color: _plantList[widget.plantId].isSelected
                        ? Constants.primaryColor
                        : Colors.white,
                  ),
                )),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Constants.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 5,
                      color: Constants.primaryColor.withOpacity(0.3),
                    )
                  ]),
              child: const Center(
                child: Text(
                  'BUY NOW',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
