import 'package:flutter/material.dart';
import 'package:songsapp/screens/albumscreen.dart';
import 'package:songsapp/screens/bookscreen.dart';
import 'package:songsapp/screens/searchscreen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  List<Widget> pages = [];
  @override
  void initState() {
    super.initState();
    pages = [
      AlbumPage(
        onChangeIndex: (int i) {
          selectedIndex = i;
          updatePage();
        },
      ),
      const SearchPage(),
      const BookPage(),
    ];
  }

  void updatePage() {
    setState(() {});
  }

  void changeIndex(int i) {
    selectedIndex = i;
  }

  double getOpacity(int index) {
    return selectedIndex == index ? 1 : 0.5;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.velocity.pixelsPerSecond.dx < -0.01) {
          // print('Swiped left');
          if (selectedIndex < 2) {
            selectedIndex++;
            updatePage();
          }
        } else if (details.velocity.pixelsPerSecond.dx > 0.01) {
          // print('Swiped right');
          if (selectedIndex > 0) {
            selectedIndex--;
            updatePage();
          }
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: pages[selectedIndex],
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          color: Colors.black26,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  selectedIndex = 0;
                  updatePage();
                },
                child: Opacity(
                    opacity: getOpacity(0),
                    child: const Image(
                      image: AssetImage('assets/icons/albumbar.png'),
                      width: 4 * 10, // multiply by 10 to scale up by 7 times
                      height: 4 * 10, // multiply by 10 to scale up by 7 times
                    )),
              ),
              GestureDetector(
                onTap: () {
                  selectedIndex = 1;
                  updatePage();
                },
                child: Opacity(
                    opacity: getOpacity(1),
                    child: const Image(
                      image: AssetImage('assets/icons/searchbar.png'),
                      width: 4 * 10, // multiply by 10 to scale up by 7 times
                      height: 4 * 10, // multiply by 10 to scale up by 7 times
                    )),
              ),
              GestureDetector(
                onTap: () {
                  selectedIndex = 2;
                  updatePage();
                },
                child: Opacity(
                    opacity: getOpacity(2),
                    child: const Image(
                      image: AssetImage('assets/icons/bookbar.png'),
                      width: 4 * 10, // multiply by 10 to scale up by 7 times
                      height: 4 * 10, // multiply by 10 to scale up by 7 times
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
