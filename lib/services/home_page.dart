import 'package:flutter/material.dart';
import 'package:shop_list_details/model/item_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<Item> _items=items;
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context,index){
        null;
      },
    );
  }
}
