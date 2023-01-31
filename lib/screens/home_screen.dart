import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../widgets/information_container.dart';
import '../widgets/neutrition_indicator.dart';
import '../widgets/workList.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 0),
      child: Column(
        children: [
          Container(
            height: 210,
            padding: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: Color(0xFF000000),
              boxShadow: [
                // BoxShadow(
                //   color: Colors.grey[200]!,
                //   blurRadius: 5,
                //   offset: Offset(4, 8), // Shadow position
                // ),
              ],
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "1456 kcal",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                          Text("Consumed",
                              style: TextStyle(color: Colors.white70)),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: CircularPercentIndicator(
                        radius: 60.0,
                        lineWidth: 10.0,
                        animation: true,
                        animationDuration: 1000,
                        percent: 0.7,
                        center: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "2875",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                            Text("kcal",
                                style: TextStyle(color: Colors.white70)),
                          ],
                        ),
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: Colors.deepOrange,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "1246 kcal",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                          Text(
                            "Remaining",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    Expanded(
                      child: NeutrtionIndicators(
                        label: "P",
                        total: 115,
                        consume: 30,
                        color: Colors.deepOrange,
                      ),
                    ),
                    Expanded(
                      child: NeutrtionIndicators(
                        label: "C",
                        total: 85,
                        consume: 65,
                        color: Colors.deepOrange,
                      ),
                    ),
                    Expanded(
                      child: NeutrtionIndicators(
                        label: "F",
                        total: 312,
                        consume: 105,
                        color: Colors.deepOrange,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: InformationContainer(
                  title: "Intake",
                  emoji: "🍟",
                  value: 568,
                  type: "kcal",
                  color: Colors.blue,
                  secondaryColor: Colors.blue[100],
                ),
              ),
              const SizedBox(
                width: 18,
              ),
              Expanded(
                child: InformationContainer(
                  title: "Burned",
                  emoji: "🔥",
                  value: 786,
                  type: "kcal",
                  color: Colors.deepOrange,
                  secondaryColor: Colors.deepOrange[100],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Tasks to do",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              WorkList(
                title: "Walking",
                icon: const Icon(
                  Icons.directions_walk_rounded,
                  color: Colors.white,
                ),
                ontap: () {
                  print("walking");
                },
              ),
              const SizedBox(
                height: 14,
              ),
              WorkList(
                title: "Football",
                icon: const Icon(
                  Icons.sports_basketball,
                  color: Colors.white,
                ),
                ontap: () {
                  print("Football");
                },
              ),
              const SizedBox(
                height: 14,
              ),
              WorkList(
                title: "Water",
                icon: const Icon(
                  Icons.water_drop_rounded,
                  color: Colors.white,
                ),
                ontap: () {
                  print("Water");
                },
              ),
              const SizedBox(
                height: 14,
              ),
              WorkList(
                title: "Gym",
                icon: const Icon(
                  Icons.sports,
                  color: Colors.white,
                ),
                ontap: () {
                  print("Gym");
                },
              ),
              const SizedBox(
                height: 14,
              ),
            ],
          )
        ],
      ),
    );
  }
}
