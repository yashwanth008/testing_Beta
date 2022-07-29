import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_alpha/Models/news_class.dart';
import 'package:test_alpha/Models/selectdata.dart';
import 'package:test_alpha/Servies/news_apiServies.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NewsApiServies client = NewsApiServies();
  List<CategorieModel> categories = <CategorieModel>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'NewsIndia',
          style: GoogleFonts.montserrat(
            color: Colors.blue,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),

      drawer: const Drawer(),
      // body:_isLoading ? Center(child: CircularProgressIndicator(),):
     body: Container(
        child: Column(
          children:<Widget>[
            const SizedBox(height: 15,),
            /// Categories
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 30,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CateTile(
                      categoryName: categories[index].categorieName,
                    );
                  }),
            ),


          ],
        ),
      ),
    );
  }
}

class CateTile extends StatelessWidget{
  final categoryName;
  const CateTile({super.key, this.categoryName});
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        height: 60,
        width: 120,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(25)
        ),
        margin:const EdgeInsets.only(right: 16),
        child: Text(
          categoryName,
          style: GoogleFonts.montserrat(
            color: Colors.black
          ),
        ),
      ),
    );
  }
}


