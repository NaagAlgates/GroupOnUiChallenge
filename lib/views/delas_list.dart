import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:group_on_ui/helpers/constants.dart';
import 'package:group_on_ui/helpers/themes.dart';

class DealsList extends StatelessWidget{
  final url;
  final title;
  final location;
  final rating;
  final ratingsCount;
  final originalPrice;
  final offerPrice;
  final description;
  final status;
  DealsList(this.url,this.title,this.location,this.rating,this.ratingsCount,this.originalPrice,this.offerPrice,this.description,this.status);
  @override
  Widget build(BuildContext context) {
    var _width = Constants.getWidth(context);
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      child: Padding(
        padding:
        const EdgeInsets.only(top: 4.0, bottom: 4.0, right: 0.0, left: 0.0),
        child: Container(
          height: _width * 0.84,
          width: _width,
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Image.network(
                      url,
                      fit: BoxFit.fill,
                      height: _width * 0.5,
                      width: _width,
                    ),
                    Visibility(
                      visible: status != null,
                      child: Positioned(
                        bottom: 10.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(2.5),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              color: Colors.deepPurple,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(
                                      status!=null && status !="TRENDING" ? Icons.timelapse: Icons.trending_up,
                                      color:  Colors.white,
                                      size: _width *
                                          0.045,
                                    ),
                                    SizedBox(
                                      width: 6.0,
                                    ),
                                    Text(
                                      status != null ? status : '',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                          _width *
                                              0.031,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 14.0, bottom: 2.0, right: 8.0, left: 8.0),
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: _width * 0.041,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 0.0, bottom: 3.0, right: 8.0, left: 8.0),
                    child: Text(
                      location,
                      style: TextStyle(
                          fontSize: _width * 0.025,
                          color: Colors.black54),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 3.0, bottom: 3.0, right: 8.0, left: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Text(
                            rating.toString(),
                            style: TextStyle(
                                fontSize:
                                _width * 0.03,
                                color: Colors.black54),
                          ),
                        ),
                        RatingBar(
                          onRatingUpdate: null,
                          initialRating: rating,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: _width * 0.04,
                          itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Text(
                            "(${ratingsCount.toString()})",
                            style: TextStyle(
                                fontSize:
                                _width * 0.03,
                                color: Colors.black54),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 6.0, bottom: 3.0, right: 8.0, left: 6.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Visibility(
                          visible: originalPrice != -1,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 0.0, left: 0.0, right: 2.0, bottom: 0.0),
                            child: Text(
                              "\$${originalPrice != -1 ? originalPrice : ''}",
                              style: TextStyle(
                                  fontSize:
                                  _width * 0.05,
                                  color: Colors.black54,
                                  decoration: TextDecoration.lineThrough),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0, left: 2.0),
                          child: Text(
                            "\$$offerPrice",
                            style: TextStyle(
                                fontSize:
                                _width * 0.05,
                                color: groupOnThemeData.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Visibility(
                          visible: originalPrice != -1,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Container(
                                color: groupOnThemeData.primaryColorLight,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 3.5,bottom: 3.5, right: 6.0,left: 6.0),
                                  child: Text(
                                    originalPrice != -1
                                        ? "${(offerPrice / originalPrice * 100).toInt()}% OFF"
                                        : '',
                                    style: TextStyle(
                                        fontSize:
                                        _width *
                                            0.027,
                                        color: groupOnThemeData.primaryColorDark,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: description != null,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 2.0, bottom: 3.0, right: 8.0, left: 8.0),
                      child: Text(
                        description != null ? description : '',
                        style: TextStyle(
                            fontSize: _width * 0.03,
                            color: Colors.black54),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}