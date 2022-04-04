import 'package:block/styles/icon_broken.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../color.dart';
import '../constant/constant.dart';
import '../data/data.dart';

class page2 extends StatefulWidget {

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  int selectedCompany = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

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
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                child: Text("Matched Properties", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
              ),
              SizedBox(height: 20,),

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
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                child: Text("Companies", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0,right: 12),
                child: Container(
                  height: 100,
                  child: ListView.builder(
                    itemCount: companies.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => BuildcompaniesItems(companies[index],index),
                  ),
                ),
              ),
              SizedBox(height: 20,
              ),
              Container(
                padding:  const EdgeInsets.only(left: 12.0,right: 12),
                  child: ListView.builder(itemBuilder: (context, index) => BuildbrokersItems(brokers[index]),itemCount: brokers.length,shrinkWrap: true,physics:NeverScrollableScrollPhysics(),)),
              SizedBox(
                height: 100,
              ),




            ],
          ),
        ),
      ),
    );
  }

  Widget BuildcompaniesItems(model,index) => GestureDetector(
    onTap: () {
      setState(() {
        selectedCompany=index;

      });
    },
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
      padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
      margin: EdgeInsets.only(right: 10),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF2ecc71).withOpacity(0.1),
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
          Expanded(child: Text(model["type"], style: TextStyle(fontSize: 12, color: darker),)),

           Visibility(
               visible: selectedCompany==index?true:false,
               child: Container(
                 width: double.infinity, height: 2,
                 decoration: BoxDecoration(
                   color: primary,
                 ),
               ),
             ),
        ],
      ),
    ),
  );
  Widget BuildbrokersItems(model)=> Container(
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: shadowColor.withOpacity(0.1),
          spreadRadius: .5,
          blurRadius: 1,
          offset: Offset(0, 1), // changes position of shadow
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 35, height: 50,
              child: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(model['image']),
              ),
            ),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(model["name"], style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),),
                SizedBox(height: 3,),
                Text(model["type"],  style: TextStyle(fontSize: 12, color: Colors.grey),),
              ],
            )
          ],
        ),
        SizedBox(height: 10,),
        Text(
          model["description"],
          style: TextStyle(height: 1.5, color: darker),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            Icon(Icons.star, size: 16, color: yellow,),
            Icon(Icons.star, size: 16, color: yellow,),
            Icon(Icons.star, size: 16, color: yellow,),
            Icon(Icons.star, size: 16, color: yellow,),
            Icon(Icons.star_outline, size: 16, color: yellow,),
          ],
        )
      ],
    ),
  );

}
