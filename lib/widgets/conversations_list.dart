import 'package:flutter/material.dart';

const imageUrl = "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60";

class ConversationList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ConversationListState();
  }
}

class _ConversationListState extends State<ConversationList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ConversationListItem();
      },
      itemCount: 21,
    );
  }
}

class ConversationListItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ConversationListItemState();
  }
}

class _ConversationListItemState extends State<ConversationListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: <Widget>[
          _buildConversationImage(),
          _buildTitleAndLatestMessage(),      
        ],
      ),
    );
  }

  _buildTitleAndLatestMessage() {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildConverastionTitle(),
          Container(height: 2,),
          Row(
            children: <Widget>[
              _buildLatestMessage(),
              Container(width: 4,),
              Center(
                child: Text('.')),
              Container(width: 4,),
              _buildTimeOfLatestMessage()
            ],
          )
        ],
      ),
    );
  }

  _buildConverastionTitle() {
    return Text(
      'John Smith',
      style: TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold
      ),
    );
  }
  
  _buildLatestMessage() {
    return Text(
      'Hello',
      style: TextStyle(
        color: Colors.grey.shade700
      ),
    );
  }

  _buildTimeOfLatestMessage() {
    return Text(
      '1:21PM',
      style: TextStyle(
        color: Colors.grey.shade700
      )
    );
  }

  _buildConversationImage() {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(imageUrl)
        )
      ),
    );
  }
}
