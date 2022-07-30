import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:test_alpha/components/BusinessCard.dart';

class Carousal extends StatefulWidget {
  List<String>? buisnesses;
  @override
  State<Carousal> createState() => _CarousalState();
}

class _CarousalState extends State<Carousal> {
  @override
  Widget build(BuildContext context) {
    List<String>? buisnesses = [
      "Ravada Stores",
      "vaishnavi",
      "zara",
      "Test_Udipi",
      "Damon_Liquer_shop",
    ];

    return Scaffold(
      backgroundColor: Color.fromRGBO(53, 133, 139, 1),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Color.fromRGBO(7, 34, 39, .5), // Change Custom Drawer Icon Color
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        centerTitle: true,
        title: Text(
            "Carousal",
          style: GoogleFonts.montserrat(fontSize: 20.0,color: Colors.white10),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      drawer: Drawer(
        child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Color.fromRGBO(7, 34, 39, .7)),
            accountName: Text(
                "Adithya Balanand",
              style: GoogleFonts.montserrat(fontWeight: FontWeight.w400,fontSize: 15),
            ),

            accountEmail: Text(
                "Test@gmail.com",
              style: GoogleFonts.montserrat(fontWeight: FontWeight.w400,fontSize: 15),
            ),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.orange,
              child: Text(
                "A",
                style: TextStyle(fontSize: 40.0),
              ),
            ),

          ),
          ListTile(
            leading: const Icon(Icons.home,color: Colors.white70),
            title: Text(
              "Home",
           style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white70),
          ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading:const Icon(Icons.settings,color: Colors.white70),
            title: Text(
                "Settings",
              style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white70),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.contacts,color: Colors.white70), title: Text(
              "Contact Us",
            style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white70),
          ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),),
      body: Column(
        children: [
          const SizedBox(height: 125,),
          CarouselSlider(
            options: CarouselOptions(height: 300.0,autoPlay: true),
            items: buisnesses.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return BusinessCard(
                    business: i,
                  );
                },
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
