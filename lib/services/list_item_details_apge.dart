import 'package:flutter/material.dart';
import 'package:shop_list_details/model/item_model.dart';
import 'package:shop_list_details/utils/rating_information.dart';

class DetailsPage extends StatefulWidget {
  final int index;

  DetailsPage({this.index});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<Item> _items = items;

  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
    var h=MediaQuery.of(context).size.height;
    final imageContainer = Container(
      child: Image.asset(
        "assets/${_items[widget.index].imageUrl}",
        fit: BoxFit.fill,
        //color: Colors.yellow,
        //colorBlendMode: BlendMode.color,
        //height: MediaQuery.of(context).size.height * .4,
      ),
      constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height * .4),
    );

    final price_first_child = new Container(
      decoration: BoxDecoration(
        color: Colors.deepOrange[400],
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0)),
      ),
    );

    final price_second_child = Text(
      "\u{20B9} ${_items[widget.index].price}",
      style: TextStyle(
        color: Colors.white,
        fontSize: h*.021,
        fontWeight: FontWeight.bold,
      ),
    );
    final priceContainer = Container(
      height: MediaQuery.of(context).size.height * .1,
      width: MediaQuery.of(context).size.width * .60,
      child: Stack(
        children: <Widget>[
          price_first_child,
          price_second_child,
        ],
        alignment: Alignment(0.0, 0.0),
      ),
    );

    final _item_name = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Flexible(
          child: Text(
            "${_items[widget.index].itemName}",
            style: TextStyle(
              color: Colors.white,
              fontSize: h*.026,
              fontFamily: "OpenSansBold",
            ),
          ),
        ),
        Icon(Icons.favorite,color: Colors.red,),
      ],
    );

    final _ratingStarWithReview = Column(
      //mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        RatingInformation(
            star: _items[widget.index].stars,
            review: _items[widget.index].reviews),
      ],
    );
    Widget _buildSquareShape(double width, double height, Color color) {
      return Container(
        height: height,
        width: width,
        color: color,
      );
    }

    final _buildSquares = Container(
      width: MediaQuery.of(context).size.width * .4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildSquareShape(w*0.12, h*0.055, Colors.yellow),
          _buildSquareShape(w*0.10, h*0.045, Colors.deepOrangeAccent),
          _buildSquareShape(w*0.08, h*0.035, Colors.greenAccent),
        ],
      ),
    );
    final _detailsHeading = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Details",
          style: TextStyle(
              fontSize: h*.025, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
      ],
    );

    final _addToCartButtons = GestureDetector(
      onTap: () {},
      child: Container(
        height: MediaQuery.of(context).size.height * .07,
        width: MediaQuery.of(context).size.width * .53,
        decoration: BoxDecoration(
          color: Colors.yellow[600],
          borderRadius: BorderRadius.circular(5.0),
        ),
        alignment: Alignment.center,
        child: Text(
          "ADD TO CART",
          style: TextStyle(
              color: Colors.white, fontSize: h*.020, fontWeight: FontWeight.bold),
        ),
      ),
    );
    final _orderNowButtons = GestureDetector(
      onTap: () {},
      child: Container(
        height: MediaQuery.of(context).size.height * .07,
        width: MediaQuery.of(context).size.width * .34,
        decoration: BoxDecoration(
          color: Colors.deepOrange[400],
          borderRadius: BorderRadius.circular(5.0),
        ),
        alignment: Alignment.center,
        child: Text(
          "ORDER NOW",
          style: TextStyle(
              color: Colors.white, fontSize: h*.019, fontWeight: FontWeight.bold),
        ),
      ),
    );
    final _order_and_cart_buttons = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _addToCartButtons,
        _orderNowButtons,
      ],
    );
    Widget _buildOperatorButton(String type,Color color,Color textColor){
      return GestureDetector(
        child: Chip(
          label: Text(type,style: TextStyle(color: textColor,fontSize: h*.020),textAlign: TextAlign.center,),
          backgroundColor: color,
        ),
        onTap: (){

        },
      );
    }
    Widget _buildOperatorValueButton(){
      return Chip(
        backgroundColor: Colors.yellow[600],
        label: Text("1",style: TextStyle(color: Colors.white,fontSize: h*.018,fontWeight: FontWeight.bold),),
      );
    }
    final _orderValue=Container(
      width: w*.21,
      height: h*.040,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.grey[800],
      ),
      child: Stack(
        children: <Widget>[
          _buildOperatorButton("-",Colors.grey[800],Colors.white70),
          Positioned(
            left: w*.11,
            top: 0.0,
            bottom: 0.0,
            child: _buildOperatorButton("+",Colors.grey[800],Colors.white),
          ),
          Positioned(
            left: w*.057,
            //right: 15.0,
            top: 0.0,
            bottom: 0.0,
            child: _buildOperatorValueButton(),
          ),
        ],
      ),
    );
    final detailContainer = Container(
      height: MediaQuery.of(context).size.height*.6,
      /*constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height * .6),*/
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _item_name,
            _ratingStarWithReview,
            _buildSquares,
            _orderValue,
            _detailsHeading,
            _order_and_cart_buttons,
          ],
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Details Page"),
      ),
      body: Container(
        color: Colors.black,
        child: Stack(
          children: <Widget>[
            imageContainer,
            Positioned(
              top: MediaQuery.of(context).size.height * .32,
              left: MediaQuery.of(context).size.width * .40,
              child: priceContainer,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                0.0,
                MediaQuery.of(context).size.height * .39,
                0.0,
                0.0,
              ),
              child: detailContainer,
            ),
            //detailContainer,
          ],
        ),
      ),
    );
  }
}
