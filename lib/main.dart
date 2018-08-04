import 'package:flutter/material.dart';
import 'package:shop_list_details/model/item_model.dart';
import 'package:shop_list_details/services/list_item_details_apge.dart';
import 'package:shop_list_details/utils/rating_information.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Demo(),
    );
  }
}

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    List<Item> _items = items;
    var count = 0;
    final color=const Color(0xFFE0E0E0);
    var w=MediaQuery.of(context).size.width;
    var h=MediaQuery.of(context).size.height;
    Widget _buildBody1(int index) {
      return GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>DetailsPage(index: index,)),
          );
        },
        child: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
          child: new Stack(
            children: <Widget>[
              Padding(
                child: new Container(
                  height: MediaQuery.of(context).size.height * .20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.black87.withOpacity(0.8),
                  ),
                ),
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .05,
                  //bottom: MediaQuery.of(context).size.height*.004
                ),
              ),
              new Container(
                alignment: Alignment.topLeft,
                height: MediaQuery.of(context).size.height * .22,
                width: MediaQuery.of(context).size.width * .5,
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .07,
                  right: MediaQuery.of(context).size.width * .50,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.transparent,
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/${items[index].imageUrl}",
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              new Positioned(
                //bottom: MediaQuery.of(context).size.height * .04,
                left: MediaQuery.of(context).size.width * .50,
                top: MediaQuery.of(context).size.height * .06,
                right: MediaQuery.of(context).size.width * .05,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text("\u{20B9} ${items[index].price}",style: TextStyle(color: Colors.white,fontSize: h*.025,fontWeight: FontWeight.bold,),),
                    SizedBox(height: MediaQuery.of(context).size.height*.005,),
                    RatingInformation(star:items[index].stars),
                    SizedBox(height: MediaQuery.of(context).size.height*.001,),
                    Text(
                      items[index].itemName,
                      style: TextStyle(
                          color: color,
                          fontSize: h*.018,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*.008,),
                    Text(items[index].itemType,style: TextStyle(color: color,fontSize: h*.014,
                        fontWeight: FontWeight.w600),),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget _buildBody2(int index) {
      return GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>DetailsPage(index: index,)),
          );
        },
        child: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
          child: new Stack(
            children: <Widget>[
              Padding(
                child: new Container(
                  height: MediaQuery.of(context).size.height * .20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.black87.withOpacity(0.8),
                  ),
                ),
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .05,
                ),
              ),
              new Container(
                alignment: Alignment.topRight,
                height: MediaQuery.of(context).size.height * .22,
                width: MediaQuery.of(context).size.width * .5,
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .50,
                  right: MediaQuery.of(context).size.width * .07,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.transparent,
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/${items[index].imageUrl}",
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              new Positioned(
                top: MediaQuery.of(context).size.height * .065,
                //bottom: MediaQuery.of(context).size.height * .04,
                right: MediaQuery.of(context).size.width * .50,
                left: MediaQuery.of(context).size.width * .05,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text("\u{20B9} ${items[index].price}",style: TextStyle(color: Colors.white,fontSize: h*.025,fontWeight: FontWeight.bold,),),
                    SizedBox(height: MediaQuery.of(context).size.height*.005,),
                    RatingInformation(star:items[index].stars),
                    SizedBox(height: MediaQuery.of(context).size.height*.005,),
                    Text(
                      items[index].itemName,
                      style: TextStyle(
                          color: color,
                          fontSize: h*.018,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*.008,),
                    Text(items[index].itemType,style: TextStyle(color: color,fontSize: h*.014,
                        fontWeight: FontWeight.w600),),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget _buildBody() {
      //print(_items.length);
      return ListView.builder(
        itemCount: _items.length,
        itemBuilder: (BuildContext context,int index){
          return index%2==0?_buildBody1(index):_buildBody2(index);
        },
      );
    }
    bool flag=false;
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
      ),
      body: Container(
        color: Colors.black54,
          child: _buildBody()
      ),
    );
  }
}
