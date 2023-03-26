import 'package:flutter/material.dart';

import 'widgets/app_bar_network_rounded_image.dart';
import 'widgets/app_bar_title.dart';
import 'widgets/conversations_list.dart';
import 'widgets/search_bar.dart';
import 'widgets/stories_list.dart';

const imageUrl =
    "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60";

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      backgroundColor: Colors.white,
    );
  }

  _body() {
    return Column(
      children: <Widget>[
        Container(
          height: 15,
          color: Colors.white,
        ),
        MessengerAppBar(
          title: 'Chats',
          actions: <Widget>[Icon(Icons.camera_alt), Icon(Icons.edit)],
        ),
        _buildRootListView(),
      ],
    );
  }

  _buildRootListView() {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildSearchBar();
          } else if (index == 1) {
            return _buildStoriesList();
          } else {
            return ConversationListItem();
          }
        },
        itemCount: 21,
      ),
    );
  }

  _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: SearchBar(),
    );
  }

  _buildStoriesList() {
    return Container(
        height: 100,
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: StoriesList());
  }
}

class MessengerAppBar extends StatelessWidget {
  List actions = [];
  String title;

  MessengerAppBar({super.key, required this.actions, this.title = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 16.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppBarNetworkRoundedImage(
                  imageUrl: imageUrl,
                ),
              ),
              Container(
                width: 8.0,
              ),
              AppBarTitle(
                text: title,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: actions
                  .map((c) => Container(
                        padding: EdgeInsets.only(left: 16.0),
                        child: c,
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
