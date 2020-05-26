

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:miastudios/firestore__.dart';
import 'package:firebase/firebase.dart';

void main() {  
  FIRESTORE.initFS();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mia Developers',
      theme: ThemeData(
        fontFamily: 'GoogleSans',
        primarySwatch:Colors.grey,
        //visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Mia Developers'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  TabController tabController;
  double width,height;
  var explainIt = ' here. \nWe Aspiring Developers solved many Business and Enterprise Solutions all over the world. Currently looking for partners to speed up the work.'
      ' ';
  var google = 'GoogleSans';
  var year = '2020';
  var name = '';
  var mail = '';
  var note = '';
  DateTime dob = DateTime(1999,9,9);
  TextEditingController emailcon = new TextEditingController();
  TextEditingController notecon = new TextEditingController();
  bool show = false;
  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return MaterialApp(
      title: widget.title,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  title: Row(
                    children: <Widget>[
                      Row(
            children: <Widget>[
              ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                                                  child: Container(
                                    color: Color.fromARGB(230, 255, 255, 255),
                                      padding: EdgeInsets.all(2),
                                      width: 32,
                                        height: 32,
                                        child:Image.network('https://firebasestorage.googleapis.com/v0/b/mia-studios.appspot.com/o/xcode.png?alt=media&token=0484439d-ff9d-40b1-ae38-a1de96016e37',fit: BoxFit.fill,)
                                        ),
                                  ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      
                                      Text(' Mia',style: TextStyle(fontWeight:FontWeight.w700,color:Color.fromARGB(230, 255, 255, 255),fontFamily: 'GoogleSans'),),
                                      Text('developers',style: TextStyle(color:Colors.white70,fontFamily: 'GoogleSans'),),
                                    ],
                                  ),
       Text(' '+name+'Since '+year,style: TextStyle(fontSize: 10,color:Colors.white,fontFamily: 'GoogleSans'),),

                ],
              ),
            ],
          ),
                      Flexible(child: Container(),flex:100),
                      Column(
                                  children: <Widget>[
                                    IconButton(
                                      icon: show?Icon(Icons.close,color: Colors.white,):
                                          Icon(Icons.send,color:Colors.white),
                                      onPressed: (){
                                        setState(() {
                                          show=!show;
                                        });
                                      },
                                    ),
                                    show?Container():Text('Reach us',style: TextStyle(fontFamily: 'GoogleSans',fontSize: 10,color: Colors.white),),
                                  ],
                                ),
            
                    ],
                  ),
                  actions: <Widget>[
                    
                  ],
                  floating: true,
                  expandedHeight: 36,
                  backgroundColor: Colors.black,
                ),
                SliverList(delegate: SliverChildBuilderDelegate(
                    (context,index){
                      return Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              
                              AnimatedOpacity(
                                opacity: show?1:0,
                                duration: Duration(milliseconds: 500),
                                child: AnimatedContainer(
                                  margin:EdgeInsets.only(left: 4,right:12) ,
                                  width: show?312:0,
                                  height: show?512:0,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeInExpo,
                                  child: Container(
                                    padding:EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16)
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        TextField(
                                          style: TextStyle(fontFamily: google),
                                          cursorWidth: 10,
                                          cursorColor: Colors.blue[100],
                                          cursorRadius: Radius.circular(4),
                                          decoration: InputDecoration(
                                            labelText: 'Name',
                                            labelStyle: TextStyle(fontFamily: google),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8),
                                              borderSide: BorderSide(color: Colors.black54,width: 2)
                                            ),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(8),
                                                  borderSide: BorderSide(color: Colors.blue,width: 2)
                                              )
                                          ),
                                          onChanged: (v){
                                            setState(() {
                                              name = v;
                                            });
                                          },
                                        ),
                                        SizedBox(height: 10,),
                                        TextField(
                                          style: TextStyle(fontFamily: google),
                                          cursorWidth: 10,
                                          cursorColor: Colors.blue[100],
                                          cursorRadius: Radius.circular(4),
                                          controller: emailcon,
                                          decoration: InputDecoration(
                                              labelText: 'Mail ID',
                                              labelStyle: TextStyle(fontFamily: google),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(8),
                                                  borderSide: BorderSide(color: Colors.black54,width: 2)
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(8),
                                                  borderSide: BorderSide(color: Colors.blue,width: 2)
                                              )
                                          ),
                                          textInputAction: TextInputAction.done,
                                          onChanged: (v){
                                            mail = v;
                                          },
                                        ),
                                        SizedBox(height: 10,),
                                        
                                        TextField(
                                          style: TextStyle(fontFamily: google),
                                          cursorWidth: 10,
                                          cursorColor: Colors.blue[100],
                                          cursorRadius: Radius.circular(4),
                                          maxLines: 3,
                                          minLines: 1,
                                          controller: notecon,
                                          decoration: InputDecoration(
                                              labelText: 'Note',
                                              labelStyle: TextStyle(fontFamily: google),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(8),
                                                  borderSide: BorderSide(color: Colors.black54,width: 2)
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(8),
                                                  borderSide: BorderSide(color: Colors.blue,width: 2)
                                              )
                                          ),
                                          textInputAction: TextInputAction.done,
                                        ),
                                        SizedBox(height: 10,),
                                        Flexible(
                                          flex: 10,
                                          fit:FlexFit.tight,
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text('“',style: TextStyle(fontFamily: google,fontSize: 30),),
                                                    Text('We don\'t trade lives Captain',style: TextStyle(fontFamily: google),),
                                                    Text('”',style: TextStyle(fontFamily: google,fontSize: 30),),
                                                  ],
                                                ),
                                                Text('- Vision',style: TextStyle(fontFamily: google,fontWeight: FontWeight.w700,fontSize: 10),),
                                              ],
                                            ),
                                          ),
                                        ),

                                        Row(
                                          children: <Widget>[
                                            Flexible(flex: 10,child: Container(),),
                                            CupertinoButton(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Icon(Icons.done),
                                                  Text('Submit',style: TextStyle(fontFamily: google),),
                                                ],
                                              ),
                                              color: Colors.blue,
                                              onPressed: (){
                                                FIRESTORE.firestore.
                                                collection('forms').
                                                document(DateTime.now().millisecondsSinceEpoch.toString()).setData({
                                                  'name':name,
                                                  'mail':mail,
                                                  'dob': Timestamp.fromDate(dob),
                                                  'note':notecon.text
                                                });
                                                setState(() {
                                                  show = false;
                                                });
                                                Scaffold.of(context).showSnackBar(SnackBar(
                                                  content: Text('Your Response has been recorded',style: TextStyle(fontFamily: google),),
                                                ));
                                              },
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin:EdgeInsets.only(right: 8,left: 16),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Hey! There',style: TextStyle(fontSize: 24,color: Colors.white,fontFamily: google),),
                                SizedBox(height: 12,),
                                RichText(
                                  textAlign: TextAlign.start,
                                    text: TextSpan(
                                    children: [
                                      TextSpan(text: 'We\'re happy to have ',style: TextStyle(fontSize: 14,color: Colors.white,fontFamily: google)),
                                      TextSpan(text: 'You',style: TextStyle(fontSize: 16,color: Colors.blue,fontWeight: FontWeight.w700,fontFamily: google)),
                                      TextSpan(text: explainIt,style: TextStyle(fontSize: 14,color: Colors.white,fontFamily: google)),
                                    ]
                                ))
                              ],
                            ),
                          ),
                          whatWeDo(),
                          steveQoate(),
                          howWeDo(),
                          footer()
                        ],
                      );
                    },
                  childCount: 1
                ))
              ],
            ),
            copyWrite()
          ],
        ),
      ),
    );
  }
  
  whatWeDo(){
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('What we do',style: TextStyle(fontSize: 24,color: Colors.white70,fontFamily: google)),
          SizedBox(height: 10,),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                              child: Container(
                                color: Colors.white,
                                alignment: Alignment.center,
                    width: 48,
                    height: 48,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.web),
                        Text('www.',style: TextStyle(fontFamily: google,fontSize: 11,fontWeight: FontWeight.w700),)
                      ],
                    )
                      
                  ),
              ),
              SizedBox(width: 10,),
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                  child: Container(
                  width: 48,
                  height: 48,
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: Text('iOS',style: TextStyle(fontFamily: google,fontSize: 20),)
                ),
              ),
              SizedBox(width: 10,),
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                  child: Container(
                  width: 48,
                  height: 48,
                  color: Colors.white,
                  child: Image(image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/mia-studios.appspot.com/o/linux.jpg?alt=media&token=16728eb8-8c88-494f-a33b-1e2bb64bbcf8'),fit: BoxFit.fitHeight,)
                ),
              ),
              SizedBox(width: 10,),
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                  child: Container(
                  width: 48,
                  height: 48,
                  padding: EdgeInsets.all(5),
                  color: Colors.white,
                  child: Image(image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/mia-studios.appspot.com/o/android.jpg?alt=media&token=e4c9cf19-81b9-4c70-8b29-a4650d015ccb'),fit: BoxFit.fitHeight,)
                ),
              ),
              SizedBox(width: 10,),
              Container(
                  width: 48,
                  height: 48,
                  child: Image(image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/mia-studios.appspot.com/o/macos.png?alt=media&token=9bde9fef-c797-4c0e-853d-f1e798a27ecf'),fit: BoxFit.fitHeight,)
              ),
            ],
          ),
        ],
      ),
    );
  }
  steveQoate(){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: 156,
          height: 156,
          child: Image.network('https://firebasestorage.googleapis.com/v0/b/mia-studios.appspot.com/o/steve.jpg?alt=media&token=6439d5c1-220f-4576-9274-f78c243375d5',fit: BoxFit.fitWidth,)
        ),
        Container(
          width: width*0.5,
          child: RichText(
            overflow: TextOverflow.fade,
            textAlign: TextAlign.start,
            softWrap: true,
            text:TextSpan(
              children:[
              TextSpan(text:'“',style: TextStyle(fontFamily: google,fontSize: 30,color: Colors.white),),
              TextSpan(text:'Design is not just what it looks like and feels like. Design is how it works.',style: TextStyle(fontFamily: google,color: Colors.white)),
              TextSpan(text:'”',style: TextStyle(fontFamily: google,fontSize: 20,color: Colors.white)),
              TextSpan(text:'\n\n\t\t\t- Steve Jobs',style: TextStyle(fontFamily: google,color: Colors.white)),
            ]
            ),
          ),
        ),
      ],
    );
  }
  howWeDo(){
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Text('How we do',style: TextStyle(fontSize: 24,color: Colors.white70,fontFamily: google)),
          SizedBox(height: 10,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5),
                width: 64,
                child: Image(image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/mia-studios.appspot.com/o/sketch.png?alt=media&token=d6e672fd-f59f-4a63-bd09-cdd3d592c311'),fit: BoxFit.fitWidth,)
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                width: width*0.6,
                child: RichText(
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.start,
                  softWrap: true,
            text:TextSpan(
              children:[
              TextSpan(text:'We use ',style: TextStyle(fontFamily: google,color: Colors.white)),
              TextSpan(text:'Sketch ',style: TextStyle(fontWeight: FontWeight.w700,fontFamily: google,color: Colors.white)),
              TextSpan(text:'for prototyping your Application requirements as per your need and \nDesign the Graphical components of the User Interface',style: TextStyle(fontFamily: google,color: Colors.white)),
            ]
            ),
          ),
        ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 64,
                child: Image(image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/mia-studios.appspot.com/o/vscode.png?alt=media&token=25c77d4f-b186-4861-8f32-18e9f861eecb'),fit: BoxFit.fitWidth,)
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                width: width*0.6,
                child: RichText(
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.start,
                  softWrap: true,
            text:TextSpan(
              children:[
              TextSpan(text:'Code ',style: TextStyle(fontWeight: FontWeight.w700,fontFamily: google,color: Colors.white)),
              TextSpan(text:'is one of our favourite IDE, We use code for both front-end and back-end solution and It helps us to Deliver on time.',style: TextStyle(fontFamily: google,color: Colors.white)),
            ]
            ),
          ),
        ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 64,
                padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: Image(image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/mia-studios.appspot.com/o/chrome.png?alt=media&token=c5629655-3005-4462-bc6c-3ac73136ae27'),fit: BoxFit.fitHeight,)
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                width: width*0.6,
                child: RichText(
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.start,
                  softWrap: true,
            text:TextSpan(
              children:[
              TextSpan(text:'Chrome ',style: TextStyle(fontWeight: FontWeight.w700,fontFamily: google,color: Colors.white)),
              TextSpan(text:'helps us to test our Web apps sufficiently across multiple platforms.',style: TextStyle(fontFamily: google,color: Colors.white)),
            ]
            ),
          ),
        ),
            ],
          ),
        ],
      ),
    );
  }
  footer(){
    return Container(
      decoration: BoxDecoration(
        color:Colors.white10,
        borderRadius:BorderRadius.only(topLeft:Radius.circular(16),topRight:Radius.circular(16),)
      ),
      padding: EdgeInsets.fromLTRB(8, 8, 8, 24),
      margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children:[
              Text('Subash R',style: TextStyle(color:Colors.white60,fontFamily: google,fontWeight: FontWeight.w700),),
              Text('Founder, Mia Inc.\nsubash1327@icloud.com',textAlign: TextAlign.end,style: TextStyle(color:Colors.white60,fontFamily: google,fontSize: 10),),
            ]
          ),
          Container(width: 0.5,height:46,color: Colors.white54,
          margin: EdgeInsets.fromLTRB(8, 0, 8, 0),),
          Row(
            children: <Widget>[
              ClipRRect(
                                    borderRadius: BorderRadius.circular(14),
                                                                  child: Container(
                                    color: Colors.white,
                                      padding: EdgeInsets.all(2),
                                      width: 28,
                                        height: 28,
                                        child:Image.network('https://firebasestorage.googleapis.com/v0/b/mia-studios.appspot.com/o/xcode.png?alt=media&token=0484439d-ff9d-40b1-ae38-a1de96016e37',fit: BoxFit.fill,)
                                        ),
                                  ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      
                                      Text(' Mia',style: TextStyle(fontWeight:FontWeight.w700,color:Colors.white70,fontFamily: 'GoogleSans'),),
                                      Text('developers',style: TextStyle(color:Colors.white60,fontFamily: 'GoogleSans'),),
                                    ],
                                  ),
       Text(' Since 2020',style: TextStyle(fontSize: 8,color:Colors.white60,fontFamily: 'GoogleSans'),),

                ],
              ),
            ],
          ),
          
        ]
      ),
    );
  }
  copyWrite(){
    return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    color: Colors.black87,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                      Text('©',style: TextStyle(color: Colors.white,fontSize: 12),),
                      Text(' Copyright 2020, Mia Inc.',style: TextStyle(fontSize: 8,color: Colors.white,fontFamily: google),)
                    ],),
                  )
                ],
              ),
            );
  }
  static Future<dynamic> loadImage(BuildContext context, String image) async {
    var url = await storage().ref(image).getDownloadURL();
    return url;
  }
}
