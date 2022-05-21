import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/src/foundation/key.dart';

import 'package:flutter/src/widgets/framework.dart';

class GeodesicList extends StatefulWidget {
  const GeodesicList({Key? key}) : super(key: key);

  @override
  State<GeodesicList> createState() => _GeodesicListState();
}

bool isShowSearchTextField = false;
String bodyTitle = 'TeenDog!';

class _GeodesicListState extends State<GeodesicList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      bottomNavigationBar: bottomNavigation(),
      body: _body(),
    );
  }

  CurvedNavigationBar bottomNavigation() {
    return CurvedNavigationBar(
        buttonBackgroundColor: Colors.deepOrange,
        animationCurve: Curves.fastOutSlowIn,
        height: 50,
        backgroundColor: Colors.transparent,
        color: Colors.orangeAccent,
        items: const [
          Icon(
            Icons.settings,
            color: Colors.white,
          ),
          Icon(
            Icons.favorite_border_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.account_circle_rounded,
            color: Colors.white,
          )
        ],
        onTap: (value) {
          setState(() {
            if (value == 0) {
              bodyTitle = 'Sttings';
            }
            if (value == 1) {
              bodyTitle = 'Home page TinDog';
            }
            if (value == 2) {
              bodyTitle = 'User';
            }
          });
        });
  }

  Widget _body() => Center(
        child: Text(bodyTitle,
            style: const TextStyle(
                color: Colors.grey, fontSize: 32, fontWeight: FontWeight.bold)),
      );

  AppBar _appBar() => AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: isShowSearchTextField
            ? const TextField(
                decoration:
                    InputDecoration(hintText: 'search', labelText: 'search'),
              )
            : const Text(
                'TinDog',
                style: TextStyle(color: Colors.orange),
              ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            setState(() {
              if (isShowSearchTextField = true) {
                isShowSearchTextField = false;
              } else {
                isShowSearchTextField = true;
              }
            });
          },
          icon: const Icon(
            Icons.search,
            color: Colors.deepOrange,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border_outlined,
              color: Colors.deepOrange,
            ),
          )
        ],
      );
}
