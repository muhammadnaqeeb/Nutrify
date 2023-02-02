import 'package:flutter/material.dart';
import 'package:nutrify/services/networking.dart';

import '../widgets/information_container.dart';

class GetNutritionScreen extends StatefulWidget {
  const GetNutritionScreen({super.key});

  @override
  State<GetNutritionScreen> createState() => _GetNutritionScreenState();
}

class _GetNutritionScreenState extends State<GetNutritionScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   getFoodData();
  // }

  var FoodDataDecoded;
  Future getFoodData(String query) async {
    const Center(
      child: CircularProgressIndicator(
        color: Colors.black,
      ),
    );
    NetworkHelper networkHelper = NetworkHelper(query);
    FoodDataDecoded = await networkHelper.getData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Food Analysis",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          ),
          const Text(
              "Analysis of food item based on the nutrition present in it."),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              suffixIcon: IconButton(
                color: Colors.black,
                icon: const Icon(Icons.send_rounded),
                onPressed: () async {
                  await getFoodData(controller.text);
                },
              ),
              hintText: "Enter food with Quantity",
              suffixIconColor: Colors.deepOrange,
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(20)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FoodDataDecoded != null
              ? Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: InformationContainer(
                            title: "Calories",
                            emoji: "🔥",
                            value:
                                FoodDataDecoded["calories"].toStringAsFixed(1),
                            type: "kcal",
                            color: Colors.black,
                            secondaryColor: Colors.black12,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: InformationContainer(
                            title: "Carbs",
                            emoji: "💪",
                            value: FoodDataDecoded["totalNutrients"]["CHOCDF"]
                                    ["quantity"]
                                .toStringAsFixed(1),
                            type: "grams",
                            color: Colors.yellow,
                            secondaryColor: Colors.yellow[100],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InformationContainer(
                            title: "Proteins",
                            emoji: "🪢",
                            value: FoodDataDecoded["totalNutrients"]["PROCNT"]
                                    ["quantity"]
                                .toStringAsFixed(1),
                            type: "grams",
                            color: Colors.blue,
                            secondaryColor: Colors.blue[100],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: InformationContainer(
                            title: "Fat",
                            emoji: "🍬",
                            value: FoodDataDecoded["totalNutrients"]["FAT"]
                                    ["quantity"]
                                .toStringAsFixed(1),
                            type: "grams",
                            color: Colors.red,
                            secondaryColor: Colors.red[100],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InformationContainer(
                            title: "Iron",
                            emoji: "🧇",
                            value: FoodDataDecoded["totalNutrients"]["FE"]
                                    ["quantity"]
                                .toStringAsFixed(1),
                            type: "grams",
                            color: Colors.red,
                            secondaryColor: Colors.red[100],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: InformationContainer(
                            title: "Calcium",
                            emoji: "🦴",
                            value: FoodDataDecoded["totalNutrients"]["CA"]
                                    ["quantity"]
                                .toStringAsFixed(1),
                            type: "grams",
                            color: Colors.deepPurple,
                            secondaryColor: Colors.deepPurple[100],
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Enter food and it's quantity, like",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("    ⚈ 1 cup rice"),
                    Text("    ⚈ 10 oz chickpeas, etc."),
                  ],
                ),
          const SizedBox(
            height: 20,
          ),
          FoodDataDecoded != null
              ? Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        minimumSize: const Size(150, 50),
                      ),
                      child: const Text(
                        "Track",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                )
              : const Text(""),
          const SizedBox(
            height: 80,
          )
        ],
      ),
    );
  }
}
