import 'package:flutter/material.dart';

const imageUrl =
    "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60";

class StoriesList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StoriesListState();
  }
}

class _StoriesListState extends State<StoriesList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        if (index == 0) {
          return AddToYourStoryButton();
        }
        if (index <= 10) {
          return StoryListItem(
            viewed: false,
          );
        } else {
          return StoryListItem(
            viewed: true,
          );
        }
      },
      itemCount: 21,
    );
  }
}

class StoryListItem extends StatefulWidget {
  bool viewed;

  StoryListItem({super.key, required this.viewed});

  @override
  State<StatefulWidget> createState() {
    return _StoryListItemState();
  }
}

class _StoryListItemState extends State<StoryListItem> {
  _buildBorder() {
    if (widget.viewed) {
      return null;
    } else {
      return Border.all(color: Colors.blue, width: 3);
    }
  }

  _getTextStyle() {
    if (widget.viewed) {
      return _viewedStoryListItemTextStyle();
    } else {
      return _notViewedStoryListItemTextStyle();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: _buildBorder(),
                  image: DecorationImage(image: NetworkImage(imageUrl))),
            ),
            Container(
              height: 8.0,
            ),
            Text(
              'Abc',
              softWrap: true,
              style: _getTextStyle(),
            ),
          ],
        ),
        Container(
          width: 12.0,
        )
      ],
    );
  }
}

class AddToYourStoryButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          children: [
            Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                  // borderRadius: BorderRadius.circular(5.0)
                ),
                child: Icon(
                  Icons.add,
                  size: 35.0,
                )),
            Container(
              height: 8.0,
            ),
            Text('Your story', style: _viewedStoryListItemTextStyle()),
          ],
        ),
        Container(
          width: 12.0,
        )
      ],
    );
  }
}

_notViewedStoryListItemTextStyle() {
  return TextStyle(
      fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold);
}

_viewedStoryListItemTextStyle() {
  return TextStyle(fontSize: 12, color: Colors.grey);
}
