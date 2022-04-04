import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/data.dart';
import '../styles/icon_broken.dart';

class page3 extends StatefulWidget {

  @override
  State<page3> createState() => _page3State();
}

class _page3State extends State<page3> {
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children:
          [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(bottom: 3),
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black87.withOpacity(0.05),
                            spreadRadius: .5,
                            blurRadius: .5,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                            prefixIcon: Icon(IconBroken.Search, color: Colors.grey),
                            border: InputBorder.none,
                            hintText: 'Search',
                            hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 15)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color(0xFF2ecc71),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black87.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Icon(Icons.filter_list_rounded, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Container(
                height: 100,
                child: ListView.builder(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => BuildcategoriesItem(categories[index],index),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget BuildcategoriesItem(model,index) => GestureDetector(
    onTap: () {
      setState(() {
        selectedCategory=index;
        print(selectedCategory);
      });
    },
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
      padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
      margin: EdgeInsets.only(right: 10),
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        color: selectedCategory==index?Colors.blue:Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            spreadRadius: .5,
            blurRadius: .5,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            model['icon'],
            size: 25,
            color: Colors.black,
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: Text(
              model['name'],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 13, color: Colors.black),
            ),
          ),
          // Visibility(
          //     visible: selected,
          //     child: Container(
          //       width: double.infinity, height: 2,
          //       decoration: BoxDecoration(
          //         color: primary,
          //       ),
          //     ),
          //   ),
        ],
      ),
    ),
  );
}
