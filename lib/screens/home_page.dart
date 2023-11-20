import 'package:fitness_time/screens/profile_page.dart';
import 'package:fitness_time/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> activities = [
    {"title": "Running", "date": "Yesterday, 18:20", "distance": "7,300 km"},
    {"title": "Running", "date": "15 Oct 2023, 13:45", "distance": "8,000 km"},
    {"title": "Running", "date": "10 Oct 2023, 19:02", "distance": "6,350 km"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 4.0,
        title: Text(
          "Fitness Time",
          style: GoogleFonts.montserrat(
            textStyle: const TextStyle(
                color: Colors.white, letterSpacing: .5, fontSize: 26),
          ),
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
            child: const Hero(
              tag: 'profileImage',
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://randomuser.me/api/portraits/women/44.jpg'),
              ),
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Toolbox',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text('Your profile'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
            ),
            ListTile(
                title: const Text('Diet and receipts'),
                onTap: () {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          'Still unavailable. Stay tuned for app updates!'),
                      duration: Duration(seconds: 3),
                    ),
                  );
                }),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, top: 20.0, right: 20.0, bottom: 10.0),
              child: Text("Hello Diana,",
                  style: Theme.of(context).textTheme.headlineMedium),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, bottom: 10.0, right: 20.0),
              child: Text("Eat 5 times a day and stay hydrated during the day",
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
            Padding(
              padding: const EdgeInsets.all(2),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "More details",
                  style: TextStyle(
                    color: AppStyles.celticblue,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "The last activities",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  var activity = activities[index];
                  return Dismissible(
                    //key: Key(activity["title"]! + activity["date"]!),
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      setState(() {
                        activities.removeAt(index);
                      });
                    },
                    background: Container(
                      color: AppStyles.lavender_pink,
                    ),
                    child: Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      child: ListTile(
                        leading: Icon(
                          Icons.run_circle_outlined,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                        title: Text(activity["title"]!),
                        subtitle: Text(activity["date"]!),
                        trailing: Text(
                          activity["distance"]!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: CircularPercentIndicator(
                    radius: 120.0,
                    lineWidth: 13.0,
                    animation: true,
                    percent: 0.7,
                    center: const Text(
                      "70.0%",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    footer: const Text(
                      "Monthly objective",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17.0),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 2) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ProfilePage()));
          }
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Find',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// dismissible para quitar actividad
//statefullwidget para slidebar
