import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void openPage(BuildContext context, int index) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "Fitness Time",
          style: GoogleFonts.montserrat(
            textStyle: const TextStyle(
                color: Colors.white, letterSpacing: .5, fontSize: 26),
          ),
        ),
        centerTitle: true,
        actions: const [
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://randomuser.me/api/portraits/women/44.jpg'),
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
              title: const Text('Your activity'),
              onTap: () => openPage(context, 0),
            ),
            ListTile(
              title: const Text('Diet and receipts'),
              onTap: () => openPage(context, 1),
            ),
            ListTile(
              title: const Text('About this app'),
              onTap: () => openPage(context, 2),
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
              padding: const EdgeInsets.all(5),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "More details",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
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
            Card(
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: ListTile(
                leading: Icon(
                  Icons.directions_run,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                title: const Text("Running"),
                subtitle: const Text("Yesterday, 18:20"),
                trailing: const Text(
                  "7,300km",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: ListTile(
                leading: Icon(
                  Icons.directions_run,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                title: const Text("Running"),
                subtitle: const Text("15 Oct 2023, 13:45"),
                trailing: const Text(
                  "6,550km",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: ListTile(
                leading: Icon(
                  Icons.directions_run,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                title: const Text("Running"),
                subtitle: const Text("10 Oct 2023, 19:02"),
                trailing: const Text(
                  "8,300km",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            //const SizedBox(height: 10),
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
          )
        ],
      ),
    );
  }
}