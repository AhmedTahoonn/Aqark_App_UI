import 'package:block/data/data.dart';
import 'package:block/styles/icon_broken.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../color.dart';
import '../constant/constant.dart';
import '../data/data.dart';
import '../data/data.dart';
import '../data/data.dart';

class page1 extends StatefulWidget {
  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            Text('HELLO!',
              style: TextStyle(
                fontSize: 12,
                color: AppBarColor,

              ),
            ),
            Text('Aqark',
              style: TextStyle(
                fontSize: 15,
                color:AppBarColor,
              ),
            ),
          ],
        ),
        actions:
        [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/user.png'),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
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
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(fontSize: 14, color: Color(0xFF3E4249)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CarouselSlider(
                options: CarouselOptions(
                  height: 240,
                  initialPage: 0,
                  viewportFraction: .8,
                  disableCenter: true,
                  enableInfiniteScroll: true,
                  reverse: false,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(
                    seconds: 3,
                  ),
                  autoPlayAnimationDuration: Duration(
                    seconds: 3,
                  ),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                ),
                items: List.generate(
                  populars.length,
                  (index) =>Container(
                    width: double.infinity,
                    height: 240,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: shadowColor.withOpacity(0.1),
                          spreadRadius: .5,
                          blurRadius: 1,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Container(
                        width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1, blurRadius: 1,
                                offset: Offset(0, 1), // changes position of shadow
                              ),
                            ],
                            image: DecorationImage(
                                image: NetworkImage( populars[index]['image']),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Positioned(
                            right: 20, top: 138,

                            child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.red,

                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: shadowColor.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: Offset(0, 1), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Icon(populars[index]['is_favorited']?Icons.favorite : Icons.favorite_border, color: Colors.white, size: 15,))),
                        Positioned(
                          left: 15, top: 160,

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(populars[index]["name"], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color: Colors.black),),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  Icon(Icons.place_outlined, color: darker, size: 13,),
                                  SizedBox(width: 3,),
                                  Text(populars[index]["location"], style: TextStyle(fontSize: 13, color: darker),),
                                ],
                              ),
                              SizedBox(height: 5,),
                              Text(populars[index]["price"], style: TextStyle(fontSize: 15, color: primary, fontWeight: FontWeight.w500),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ) ,
                )),
            SizedBox(height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Recommended", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                  Text("See all", style: TextStyle(fontSize: 14, color: darker),),
                ],
              ),
            ),
            SizedBox(height: 20,
            ),

            CarouselSlider(
                options: CarouselOptions(
                  height: 130,

                  initialPage: 0,
                  viewportFraction: .8,
                  disableCenter: true,
                  enableInfiniteScroll: true,
                  reverse: false,
                  enlargeCenterPage: true,
                  autoPlay: false,
                  autoPlayInterval: Duration(
                    seconds: 3,
                  ),
                  autoPlayAnimationDuration: Duration(
                    seconds: 3,
                  ),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                ),
                items: List.generate(recommended.length, (index) => Container(
                    width: 130, height: 130,
                    margin: EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: shadowColor.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1, blurRadius: 1,
                                offset: Offset(0, 1), // changes position of shadow
                              ),
                            ],
                            image: DecorationImage(
                                image: NetworkImage( recommended[index]['image']),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                          width: double.infinity, height: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black.withOpacity(.8),
                                    Colors.white.withOpacity(.01),
                                  ]
                              )
                          ),
                        ),
                        Positioned(
                          bottom: 12, left: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(recommended[index]["name"], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  Icon(Icons.place_outlined, color: Colors.white, size: 13,),
                                  SizedBox(width: 3,),
                                  Text(recommended[index]["location"], style: TextStyle(fontSize: 13, color: Colors.white,),),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                )),

            ),
            SizedBox(height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Recent", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                  Text("See all", style: TextStyle(fontSize: 14, color: darker),),
                ],
              ),
            ),
            SizedBox(height: 20,
            ),

            Container(
              height: 100,
              width: 360,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 100,
                  initialPage: 0,
                  viewportFraction: .8,
                  disableCenter: true,
                  enableInfiniteScroll: true,
                  reverse: false,
                  enlargeCenterPage: true,
                  autoPlay: false,
                  autoPlayInterval: Duration(
                    seconds: 3,
                  ),
                  autoPlayAnimationDuration: Duration(
                    seconds: 3,
                  ),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                ),
                items: List.generate(recents.length, (index) =>Container(

                  margin: EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: shadowColor.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(

                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 1, blurRadius: 1,
                              offset: Offset(0, 1), // changes position of shadow
                            ),
                          ],
                          image: DecorationImage(
                              image: NetworkImage( recommended[index]['image']),
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(width: 15,),
                      Expanded(
                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(recents[index]["name"], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),
                            SizedBox(height: 5,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.place_outlined, size: 13,),
                                SizedBox(width: 3,),
                                Expanded(child: Text(recents[index]["location"], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12,),)),
                              ],
                            ),
                            SizedBox(height: 5,),
                            Text(recents[index]["price"], style: TextStyle(fontSize: 13, color: primary, fontWeight: FontWeight.w500),)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                ),

              ),
            ),
            SizedBox(
              height: 50,
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
