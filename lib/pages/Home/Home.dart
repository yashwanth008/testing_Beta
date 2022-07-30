import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_alpha/Secret/businessCode.dart';
import 'package:test_alpha/Models/items.dart';

class Home extends StatefulWidget {
  final String? businessName;
  String? url;
  Home({this.businessName});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Items> _Content = <Items>[];
  bool _isloading = true;

  Future<List<Items>> fetchContent() async {
    var response = await http.get(Uri.parse(widget.url!));
    print(response.body);
    var contents = <Items>[];

    if (response.statusCode == 200) {
      var contentsJson = json.decode(response.body);
      for (var contentJson in contentsJson) {
        contents.add(Items.fromJson(contentJson));
        print(contentJson["product_name"]);
        print(contentJson["sku_id"]);
      }
      //print(contents);
    }
    return contents;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BuisnessCode obj = BuisnessCode();
    String? urlCode = obj.Code[widget.businessName];
    widget.url =
    "https://api.test.esamudaay.com/api/v1/businesses/$urlCode/report";
    fetchContent().then((value) {
      setState(() {
        _isloading = false;
        _Content.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.businessName}"),
      ),
      body: _isloading
          ? const Center(
        child:  CircularProgressIndicator(),
      )
          : Padding(
          padding:EdgeInsets.fromLTRB(2,15,2, 0),
      child:ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text(_Content[index].business!),
                  Text(_Content[index].product!),
                  Text("${_Content[index].id}"),
                  // ListView.builder(
                  //     itemCount: 10,
                  //     itemBuilder: (context, index) {
                  //       return Text("hello");
                  //     })
                ],
              ),
            ),
          );
        },
        itemCount: _Content.length,
      ),)
    );
  }
}
