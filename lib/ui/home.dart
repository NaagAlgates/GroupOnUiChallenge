import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:group_on_ui/helpers/constants.dart';
import 'package:group_on_ui/helpers/themes.dart';

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
  @override
  Widget build(BuildContext context) {
    var _height = Constants.getHeight(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            controller: scrollController,
            shrinkWrap: true,
            slivers: <Widget>[
              SliverPadding(
                padding: EdgeInsets.only(
                    left: _height * 0.008,
                    right: _height * 0.008,
                    bottom: _height * 0.008,
                    top: _height * 0.05),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                      Constants.dealsList
                  ),
                ),
              ),
            ],
          ),
          AnimatedContainer(
              duration: Duration(milliseconds: 100),
              height: isVisible ? _height * 0.046 : 0.0,
              child: appMenu(context, this)),
        ],
      ),
    );
  }
}

Widget appMenu(BuildContext context, TickerProvider provider) {
  var _width = Constants.getWidth(context);
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
    width: _width,
    color: groupOnThemeData.primaryColor,
    child: Stack(
      children: <Widget>[
        PositionedTransition(
          rect: relativeRectTween,
          child: Padding(
            padding: EdgeInsets.only(top: 2.0,bottom: 8.0,right: 8.0,left: 6.0),
            child: ListView(
              physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: Constants.bouncingMenuList,
            ),
          ),
        ),
      ],
    ),
  );
}
