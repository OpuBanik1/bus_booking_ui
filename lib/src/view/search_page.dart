import 'package:bus_booking/src/view/my_bus.dart';
import 'package:bus_booking/src/view/search.dart';
import 'package:flutter/material.dart';

class SearchTicket extends StatefulWidget {
  const SearchTicket({super.key});

  @override
  State<SearchTicket> createState() => _SearchTicketState();
}

class _SearchTicketState extends State<SearchTicket> {
  List pages = const [Search(), Mybus()];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 18,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 20,
              child: Image.asset(
                'lib/icons/bus-station.png',
                color: Colors.grey,
              ),
            ),
            label: "Stops",
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 20,
              child: Image.asset(
                'lib/icons/travel.png',
                color: Colors.grey,
              ),
            ),
            label: "My Tickets",
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 20,
              child: Image.asset(
                'lib/icons/bus.png',
                color: Colors.grey,
              ),
            ),
            label: "My Bus",
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 20,
              child: Image.asset(
                'lib/icons/user.png',
                color: Colors.grey,
              ),
            ),
            label: "Profile",
          )
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
