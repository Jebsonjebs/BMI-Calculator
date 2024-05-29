import 'package:flutter/material.dart';

void main(){
  runApp(
      MaterialApp(
        home: MyApp(),
        debugShowCheckedModeBanner: false,
      )
  );
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _height=160.0;
  double _weight=50.0;
  int _bmi=0;
  String _condition="";
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    //Size size=MediaQuery.of(context).size;
    return  Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children:<Widget> [
              Container(
                  padding: EdgeInsets.symmetric(vertical: 30.0,horizontal: 10.0),
                  height: size.height*0.4,
                  width:double.infinity ,
                  decoration:new  BoxDecoration(
                    color: Colors.lightBlue,
                  ),
                  child:Column(
                    crossAxisAlignment :CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("BMI CALCULATOR" ,style: TextStyle(fontSize: 40,color: Colors.black,fontWeight: FontWeight.bold),
                      ),
                      SizedBox(  height:size.height*0.03  ),
                      SizedBox(
                        width: double.infinity,
                        child: Container(
                          child: Text("$_bmi",
                            style: TextStyle(fontSize: 35.0,fontWeight: FontWeight.bold,color: Colors.white
                            ),
                            textAlign  : TextAlign.right,
                          ),
                        ),
                      ),
                      SizedBox(  height:size.height*0.03  ),
                      RichText(
                        text:TextSpan( text:"Your BMI is : ",
                          style: TextStyle(color: Colors.white,fontSize: 30.0,fontWeight: FontWeight.normal),

                          children: <TextSpan>[
                            TextSpan( text:" $_condition",
                              style: TextStyle(color: Colors.white,fontSize: 30.0,fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )

                    ],)

              ),

              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                width :double.infinity,
                child: Column (
                    children:<Widget>[
                      SizedBox(  height:size.height*0.03  ),
                      Text("Choose data" ,style:TextStyle(fontSize: 35.0,color:Colors.lightBlue,fontWeight: FontWeight.bold) ,),
                      SizedBox(  height:size.height*0.03  ),
                      RichText(
                        text:TextSpan( text:"Height : ",
                          style: TextStyle(color: Colors.black,fontSize: 30.0),

                          children: <TextSpan>[
                            TextSpan( text:"$_height",
                              style: TextStyle(color: Colors.black,fontSize: 30.0,fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Slider(
                        value :_height,
                        min:0,
                        max:250,
                        onChanged: (height1)
                        {
                          setState((){
                            _height=height1;
                          });
                        },
                        divisions:200,
                        label: "$_height",
                        activeColor: Colors.grey,



                      ),
                      SizedBox(  height:size.height*0.03  ),
                      RichText(
                        text:TextSpan( text:"Weight : ",
                          style: TextStyle(color: Colors.black,fontSize: 30.0),

                          children: <TextSpan>[
                            TextSpan( text:"$_weight",
                              style: TextStyle(color: Colors.black,fontSize: 30.0,fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Slider(
                        value :_weight,
                        min:0,
                        max:250,
                        onChanged: (weight)
                        {
                          setState((){
                            _weight=weight;
                          });
                        },
                        divisions:200,
                        label: "$_weight",
                        activeColor: Colors.grey,


                      ),
                      SizedBox(  height:size.height*0.03  ),
                      Container(

                          width: size.width*0.8,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child: TextButton(

                                child:Text('Calculate' ,style: TextStyle(fontSize: 25.0,color: Colors.white),),
                                onPressed: (){
                                  setState(() {
                                    _bmi=(_weight/((_height/100)*(_height/100))).round().toInt();
                                    if(_bmi >18.5 && _bmi<=25)
                                      _condition="Normal";
                                    else if(_bmi>25 && _bmi<=35)
                                      _condition="Overweight";
                                    else if(_bmi >35)
                                      _condition="Obesity";
                                    else
                                      _condition="Underweight";

                                  });
                                },
                                style: TextButton.styleFrom(
                                  primary: Colors.lightBlue,
                                  backgroundColor: Colors.lightBlue,
                                  padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 40.0),
                                ),
                              )
                          )
                      ),
                    ]
                ),
              )
            ],
          ),
        )
    );
  }
}
