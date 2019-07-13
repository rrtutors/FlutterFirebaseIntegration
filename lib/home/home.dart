import 'package:flutter/material.dart';
import 'package:flutter_firestroe/databases/UserDatabase.dart';
import 'package:flutter_firestroe/models/user.dart';

class Homepage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return HomeState();
  }

}

class HomeState extends State<Homepage>{
  Size size;
  User user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UserDatabase.instance.getUserData().then((result){
      setState(() {
        user=result;
      });

    });
  }
  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    return Scaffold(
    backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height,

            decoration:BoxDecoration(

                gradient: LinearGradient(
                  colors: [Colors.deepOrange,Colors.orange/*,const Color(0XFF388e3c)*/,],

                ),
                borderRadius: BorderRadius.only(

                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )
            ) ,
          ),
          Scaffold(
            appBar: AppBar(
              title: Text("Home"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                )
              ),
              backgroundColor: Colors.deepOrange,
            ),
            backgroundColor: Colors.transparent,
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Column(

                    mainAxisAlignment: MainAxisAlignment.center,

                    children: <Widget>[
                         Center(
                          child: (user==null)?null:Text("Welcome User "+user.name,
                            style:TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ) ,),
                        ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: RaisedButton(
                            onPressed: (){
                              UserDatabase.instance.deleteUser(user.email).then((res){
                              if(res==1)
                              {
                                  Navigator.pushReplacementNamed(context, "/login");
                              }

                              });

                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),

                            ),
                            color:Colors.pink,
                            child: Text("Logout", style: TextStyle(color: Colors.white
                            ),)
                        ),
                      )
                    ],
                  ),

                ],
              ),
            ),
          ),
        ],

      )
    );
  }

}