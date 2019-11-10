import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:group_on_ui/helpers/themes.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  ScrollController scrollController = new ScrollController();
  bool isVisible = true;

  @override
  initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (isVisible)
          setState(() {
            isVisible = false;
          });
      }
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!isVisible)
          setState(() {
            isVisible = true;
          });
      }
    });
  }

  /*Future readJSON() async {
    String data = await DefaultAssetBundle.of(context).loadString("assets/dashboard.json");
    final jsonResult = json.decode(data);
    log(jsonResult);
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: <Widget>[
          new CustomScrollView(
            controller: scrollController,
            shrinkWrap: true,
            slivers: <Widget>[
              new SliverPadding(
                padding: const EdgeInsets.only(
                    left: 6.0, right: 6.0, bottom: 6.0, top: 70.0),
                sliver: new SliverList(
                  delegate: new SliverChildListDelegate(
                    <Widget>[
                      dealsList(
                          context,
                          "https://homepages.cae.wisc.edu/~ece533/images/monarch.png",
                          "Butterfly",
                          "Sydney \u00B7 1.4 km",
                          3.5,
                          6408,
                          240,
                          13,
                          '38% off - Large Fruit or Veggie Juice',
                          'NEW'),
                      dealsList(
                          context,
                          "https://homepages.cae.wisc.edu/~ece533/images/mountain.png",
                          "Mountain Trips",
                          "Sydney \u00B7 0.4 km",
                          4.5,
                          78,
                          20,
                          13,
                          null,
                          'ALMOST GONE'),
                      dealsList(
                          context,
                          "https://homepages.cae.wisc.edu/~ece533/images/tulips.png",
                          "Tulips",
                          "Sydney \u00B7 0.9 km",
                          3.0,
                          1248,
                          70,
                          53,
                          'Valid on all flowers',
                          null),
                      dealsList(
                          context,
                          "https://homepages.cae.wisc.edu/~ece533/images/pool.png",
                          "Pool Games",
                          "Sydney \u00B7 1.9 km",
                          5.0,
                          8996,
                          -1,
                          99,
                          null,
                          null),
                      dealsList(
                          context,
                          "https://homepages.cae.wisc.edu/~ece533/images/peppers.png",
                          "Cheap Peppers",
                          "Sydney \u00B7 0.0 km",
                          2.5,
                          14796,
                          -1,
                          3,
                          'Valid only on Fridays',
                          'FAST SELLING'),
                      dealsList(
                          context,
                          "https://homepages.cae.wisc.edu/~ece533/images/airplane.png",
                          "Fly Above",
                          "Sydney \u00B7 30.0 km",
                          2.5,
                          3629,
                          788,
                          707,
                          'Valid only on all packages above 15,000 feet',
                          null),
                    ],
                  ),
                ),
              ),
            ],
          ),
          AnimatedContainer(
              duration: Duration(milliseconds: 100),
              height: isVisible ? 60.0 : 0.0,
              child: appMenu(context, this)),
        ],
      ),
    );
  }
}

Widget appMenu(BuildContext context, TickerProvider provider) {
  AnimationController _controller = AnimationController(
    vsync: provider,
    duration: const Duration(milliseconds: 300),
  );
  final Animation<RelativeRect> relativeRectTween = RelativeRectTween(
    begin: RelativeRect.fromLTRB(300.0, 0, 0, 0),
    end: new RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
  ).animate(
      new CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack));

  _controller.forward();
  return Container(
    width: MediaQuery.of(context).size.width,
    //height: Platform.isIOS ?  MediaQuery.of(context).size.height*0.055: MediaQuery.of(context).size.height*0.075 ,
    height: MediaQuery.of(context).size.width * 0.11,
    color: groupOnThemeData.primaryColor,
    child: Stack(
      children: <Widget>[
        PositionedTransition(
          rect: relativeRectTween,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 8.0, bottom: 8.0, top: 6.0, right: 8.0),
            child: ListView(
              physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      top: 4.0, bottom: 4.0, right: 4.0, left: 2.0),
                  child: menuList(context, "Beauty & Spa", Icons.star_border),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 4.0, bottom: 4.0, right: 4.0, left: 2.0),
                  child: menuList(context, "Restaurants", Icons.restaurant),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 4.0, bottom: 4.0, right: 4.0, left: 2.0),
                  child: menuList(context, "Shopping", Icons.shopping_basket),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 4.0, bottom: 4.0, right: 4.0, left: 2.0),
                  child: menuList(
                      context, "Things to do", Icons.confirmation_number),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 4.0, bottom: 4.0, right: 4.0, left: 2.0),
                  child: menuList(context, "Travel", Icons.airplanemode_active),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 2.0, bottom: 2.0, right: 4.0, left: 2.0),
                  child: menuList(
                      context, "Health & Fitness", Icons.fitness_center),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget dealsList(
    BuildContext context,
    String url,
    String title,
    String location,
    double rating,
    int ratingsCount,
    int originalPrice,
    int offerPrice,
    String description,
    String status) {
  return ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    child: Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0, right: 0.0,left: 0.0),
      child: Container(
        height: MediaQuery.of(context).size.width * 0.84,
        width: MediaQuery.of(context).size.width,
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
                    height: MediaQuery.of(context).size.width * 0.5,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Visibility(
                    visible: status!=null,
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
                                    Icons.timelapse,
                                    color: Colors.white,
                                    size: MediaQuery.of(context).size.width * 0.045,
                                  ),
                                  SizedBox(width: 6.0,),
                                  Text(status!=null?status:'',style: TextStyle(
                                      color: Colors.white,
                                      fontSize: MediaQuery.of(context).size.width * 0.031, fontWeight: FontWeight.bold),)
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
                        fontSize: MediaQuery.of(context).size.width * 0.041,
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
                        fontSize: MediaQuery.of(context).size.width * 0.025,
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
                              fontSize: MediaQuery.of(context).size.width * 0.03,
                              color: Colors.black54),
                        ),
                      ),
                      RatingBar(
                        initialRating: rating,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: MediaQuery.of(context).size.width * 0.04,
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
                              fontSize: MediaQuery.of(context).size.width * 0.03,
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
                        visible: originalPrice!=-1,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 0.0, left: 0.0, right: 2.0, bottom: 0.0),
                          child: Text(
                            "\$${originalPrice!=-1?originalPrice:''}",
                            style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width * 0.05,
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
                              fontSize: MediaQuery.of(context).size.width * 0.05,
                              color: groupOnThemeData.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Visibility(
                        visible: originalPrice!=-1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Container(
                              color: groupOnThemeData.primaryColorLight,
                              child: Padding(
                                padding: const EdgeInsets.all(4.5),
                                child: Text(
                                  originalPrice!=-1?"${(offerPrice / originalPrice * 100).toInt()}% OFF":'',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width * 0.03,
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
                visible: description!=null,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 2.0, bottom: 3.0, right: 8.0, left: 8.0),
                    child: Text(
                      description!=null?description:'',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.03,
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

Widget menuList(BuildContext context, String title, IconData icon) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(2.5),
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Platform.isIOS ? Colors.white38 : Colors.white,
          width: MediaQuery.of(context).size.width * 0.003,
        ),
        color: Colors.transparent,
      ),
      child: Center(
          child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    icon,
                    color: Colors.white,
                    size: MediaQuery.of(context).size.width * 0.040,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.014,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.031),
                  ),
                ],
              ))),
    ),
  );
}
