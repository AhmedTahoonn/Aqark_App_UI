import 'package:block/styles/icon_broken.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class page5 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white.withOpacity(0.8),
        title: Text(
          'SETTINGS',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children:
        [
          Center(
            child: CircleAvatar(
              radius: 30,
              backgroundImage:  AssetImage('assets/user.png'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text('Tahoon',
          style: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500
          ),
          ),
          SizedBox(
            height: 20,
          ),
          Card(
            margin: EdgeInsets.only(right: 15,left: 15),

            child: Column(
              children:
              [
                ListTile(
                  leading: Icon(IconBroken.Profile,color: Colors.orange,),
                  title: Text('Profile',style: TextStyle(
                      fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic
                  )),
                  trailing: Icon(Icons.arrow_forward_ios_sharp,color: Colors.black,size: 18,),
                ),
                Divider(
                  color: Colors.grey,
                  height: 1,
                ),
                ListTile(
                  leading: Icon(IconBroken.Notification,color: Colors.blue,),
                  title: Text('Notification',style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic
                  )),
                  trailing: Icon(Icons.arrow_forward_ios_sharp,color: Colors.black,size: 18,),
                ),
                Divider(
                  color: Colors.grey,
                  height: 1,
                ),
                ListTile(
                  leading: Icon(IconBroken.Lock,color: Colors.green,),
                  title: Text('Change Password',style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic
                  )),
                  trailing: Icon(Icons.arrow_forward_ios_sharp,color: Colors.black,size: 18,),
                ),

              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Card(
            margin: EdgeInsets.only(right: 15,left: 15),

            child: Column(
              children:
              [
                ListTile(
                  leading: Icon(Icons.nightlight_round,color: Colors.black,),
                  title: Text('Appearance',style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic
                  )),
                  trailing: Icon(Icons.arrow_forward_ios_sharp,color: Colors.black,size: 18,),
                ),
                Divider(
                  color: Colors.grey,
                  height: 1,
                ),
                ListTile(
                  leading: Icon(IconBroken.Heart,color: Colors.red,),
                  title: Text('Favourites',style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic
                  )),
                  trailing: Icon(Icons.arrow_forward_ios_sharp,color: Colors.black,size: 18,),
                ),
                Divider(
                  color: Colors.grey,
                  height: 1,
                ),
                ListTile(
                  leading: Icon(IconBroken.Shield_Done,color: Colors.grey,),
                  title: Text('Privacy Policy',style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic
                  )),
                  trailing: Icon(Icons.arrow_forward_ios_sharp,color: Colors.black,size: 18,),
                ),

              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Card(
            margin: EdgeInsets.only(right: 15,left: 15),

            child: ListTile(
              leading: Icon(IconBroken.Logout,color: Colors.red,),
              title: Text('Log Out',style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic
              ),
              ),
              trailing: Icon(Icons.arrow_forward_ios_sharp,color: Colors.black,size: 18,),
            ),

          ),


        ],
      ),
    );
  }
}
