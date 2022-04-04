import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/data.dart';

class page4 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white.withOpacity(0.8),
          title: Text(
            'Chats',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      body: ListView.separated(itemBuilder: (context, index) => BuildChatsItem(chats[index]), separatorBuilder:(context,index)=>Divider(
        color: Colors.grey,
      ), itemCount: chats.length)

    );
  }
  Widget BuildChatsItem(model)=>Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children:
      [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(model['image']),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Text(model['name']),
              SizedBox(
                height: 10,
              ),
              Text(model['description'],overflow: TextOverflow.ellipsis,maxLines: 1,),

            ],
          ),
        ),
        Text(model['time']),
      ],
    ),
  );
}
