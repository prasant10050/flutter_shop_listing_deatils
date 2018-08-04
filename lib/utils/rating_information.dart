import 'package:flutter/material.dart';
import 'package:shop_list_details/model/item_model.dart';

class RatingInformation extends StatefulWidget {
  final double star;
  final int review;

  RatingInformation({this.star, this.review});

  @override
  _RatingInformationState createState() => _RatingInformationState();
}

class _RatingInformationState extends State<RatingInformation> {
  final color=const Color(0xFFE0E0E0);
  Widget _buildRatingBar(ThemeData themeData,double num){
    var stars=<Widget>[];
    for(var i=1;i<=5;i++){
      var color=i<=num?themeData.accentColor:Colors.white70;
      var star=Icon(
        Icons.star,
        color: color,
        size: 18.0,
      );
      stars.add(star);
    }
    return Row(children: stars,);
  }
  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    var textTheme=theme.textTheme;
    var ratingCaptionStyle=textTheme.caption.copyWith(color: Colors.black45);

    /*var numericRating=Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          movie.rating.toString(),
          style: textTheme.title.copyWith(
            fontWeight: FontWeight.w400,
            color: theme.accentColor,
          ),
        ),
        SizedBox(height: 4.0,),
        Text(
          'Ratings',
          style: ratingCaptionStyle,
        ),
      ],
    );*/

    var starRating_and_review=Flexible(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildRatingBar(theme,widget.star),
          SizedBox(width: MediaQuery.of(context).size.width*.03,),
          Text(
            "${widget.review} Reviews",
            style: TextStyle(
                color: Colors.white70,
                fontSize: 15.0,
                fontFamily: "LatoRegular"
            ),
          ),
        ],
      ),
    );
    var starRating=Flexible(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildRatingBar(theme,widget.star),
          //_review(),
        ],
      ),
    );
    var _returnStarRatingWithReview=Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        starRating_and_review,
      ],
    );
    var _returnStarRating=Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        starRating,
      ],
    );
    Widget _build(){
      if(widget.review!=null){
        return _returnStarRatingWithReview;
      }else{
        return _returnStarRating;
      }
    }

    return _build();

  }
}
