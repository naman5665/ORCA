import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:women_job/models/catalog.dart';
import 'ItemWidget.dart';
import 'main.dart';

class HomeScreen extends StatefulWidget {
  final Item item;

  const HomeScreen({Key key,  this.item}) :super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson = await rootBundle.loadString("assets/catalog.json");
    final decodeData = jsonDecode(catalogJson);
    var productData = decodeData["jobs"];
    CatalogModel.items = List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Orca" , style: TextStyle(color: Colors.black),),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text("Tina Mistry"),
                accountEmail: Text("abc@gmail.com"),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Account"),
              subtitle: Text("Edit Personal Details"),
              trailing: Icon(Icons.edit),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Sign Out"),
              onTap: () {
                int count = 2;
                Navigator.of(context).popUntil((_) => count-- <= 0);
              },
            )
          ],
        ),
      ),

      body: Column(
        children: [

          SizedBox(height: 20.0,),

          Center(child: Text("Recommended Jobs" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 30 , fontStyle: FontStyle.italic),)),

          SizedBox(height: 12.0,),

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16.0),
              scrollDirection: Axis.vertical,
              itemCount: CatalogModel.items.length,
              itemBuilder: (context,index){
                return ItemWidget(
                  item: CatalogModel.items[index],
                );
              },
            ),
          )

        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
           showSearch(context: context, delegate: DataSearch());
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(height: 50.0,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}

class DataSearch extends SearchDelegate<String>{



  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: (){
        query = "";
      },)
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      )

    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults

  }

  @override
  Widget buildSuggestions(BuildContext context) {

    List<Item> l = CatalogModel.items;
    // TODO: implement buildSuggestions
    return  ListView.builder(
      itemCount: CatalogModel.items.length,
      itemBuilder: (context,index){
        return ItemWidget(
          item: CatalogModel.items[index]
        );
      },
    );
  }
}
