import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:group_on_ui/helpers/themes.dart';

TextEditingController _controller = new TextEditingController();
FocusNode _focusNode = new FocusNode();

Widget searchView(BuildContext context) {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.only(top: 8.0,right: 8.0,left: 8.0,bottom: 3.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(2.5),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.96,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 4.0,top: 5.5),
                            child: Icon(
                              Icons.search,
                              color: groupOnThemeData.primaryColor,
                              size: MediaQuery.of(context).size.width * 0.05,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height,
                          child: Center(
                            child: TextFormField(
                              maxLength: 14,
                              controller: _controller,
                              focusNode: _focusNode,
                              textInputAction: TextInputAction.search,
                              onFieldSubmitted: (newValue){
                                _controller.clear();
                                FocusScope.of(context).unfocus();
                              },
                              maxLines: 1,
                              autocorrect: false,
                              obscureText: false,
                              style: TextStyle(
                                  fontSize:  MediaQuery.of(context).size.width * 0.037,
                                  color: groupOnThemeData.primaryColor),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search Groupon",
                                hintStyle: TextStyle(
                                    fontSize:  MediaQuery.of(context).size.width * 0.037,
                                    color: _focusNode.hasFocus
                                        ? Colors.grey[500]
                                        : groupOnThemeData.primaryColor),
                                counterText: '',
                                contentPadding: EdgeInsets.zero,
                              ),
                              autofocus: false,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    log("Search Clicked");
                  },
                ),
                VerticalDivider(
                  color: Colors.grey,
                  indent: 4.0,
                  endIndent: 4.0,
                ),
                InkWell(
                  child: Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: Colors.grey[500],
                          size: MediaQuery.of(context).size.width * 0.04,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        Text(
                          "Sydney, NSW",
                          style: TextStyle(
                              color: Colors.grey[600], fontSize: MediaQuery.of(context).size.width * 0.03,),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    log("Nearby Clicked");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
