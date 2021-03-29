import 'dart:math';
import 'package:flutter/material.dart';
void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  double absi = 0.0;
  String error ="";
  int vals = 1;
  int valh = 1;
  int valw = 1;
  int valwc = 1;
  TextEditingController a = new TextEditingController();
  TextEditingController w = new TextEditingController();
  TextEditingController h = new TextEditingController();
  TextEditingController wc = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('ABSI Calculator'),
        ),
        body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 280,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,             
                  children: [
                  Text("Sex",style: TextStyle(fontSize: 16)),
                   Container(
                    width: 90,
                    child: DropdownButton(
                      value: vals,
                      items: [
                        DropdownMenuItem(
                          child: Text("Male"),
                          value: 1
                        ),
                        DropdownMenuItem(
                          child: Text("Female"),
                          value: 2,
                        )
                        ],
                        onChanged: (value) {
                          setState(() {
                            vals=value;
                          });
                        },
                      ),
                    ),
                  ],),

                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   
                   children: [
                     Text("Age",style: TextStyle(fontSize: 16)),
                    Row(children: [
                      Container(
                       width: 60,
                       child: TextField(
                         decoration: InputDecoration(border: InputBorder.none),
                         keyboardType: TextInputType.number,
                         textAlign: TextAlign.center,
                         controller: a,
                         )),

                       Text(" Years",style: TextStyle(fontWeight: FontWeight.bold)),
                    ],) 
                   ], 
                  ),

                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text("Height",style: TextStyle(fontSize: 16)),
                      Row(children: [
                      Container(
                       width: 75,
                       child: TextField(
                         decoration: InputDecoration(border: InputBorder.none),
                         keyboardType: TextInputType.number,
                         textAlign: TextAlign.center,
                        controller: h,
                        )),
                        Container(
                          width: 50,
                          child: DropdownButton(
                            value: valh,
                            items: [
                              DropdownMenuItem(
                                child: Text("CM"),
                                value: 1,
                                ),
                              DropdownMenuItem(
                                child: Text("M"),
                                value: 2,
                                ),
                            ],
                            onChanged: (value){
                              setState(() {
                                valh = value;
                              },);
                            },
                          )
                        ),
                    ],) 
                   ],
                   ),
                   
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Weight",style: TextStyle(fontSize: 16)),
                    Row(children: [
                      Container(
                       width: 70,
                       child: TextField(
                         decoration: InputDecoration(border: InputBorder.none),
                         keyboardType: TextInputType.number,
                         textAlign: TextAlign.center,
                         controller: w,
                         )),
                         Container(
                           width: 50,
                           child: DropdownButton(
                             value :valw,
                             items: [
                               DropdownMenuItem(
                                 child: Text("kg"),
                                 value: 1,
                                 ),
                               DropdownMenuItem(
                                 child: Text("g"),
                                 value: 2,
                                 ),
                             ],
                             onChanged: (value) {
                               setState(() {
                                 valw = value;
                               },);
                             },
                           )),
                     ],) 
                    ],),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Waist Circumference",style: TextStyle(fontSize: 16)),
                    Row(children: [
                      Container(
                       width: 70,
                       child: TextField(
                         decoration: InputDecoration(border: InputBorder.none),
                         keyboardType: TextInputType.number,
                         textAlign: TextAlign.center,
                         controller: wc,
                         )),
                         Container(
                           child: DropdownButton(
                             value: valwc,
                             items: [
                               DropdownMenuItem(
                                 child: Text("CM"),
                                 value :1,
                               ),
                               DropdownMenuItem(
                                 child: Text("M"),
                                 value :2,
                               ),
                             ],
                            onChanged: (value) {
                              setState(() {
                                valwc = value;
                              });
                            },
                           )),
                    ],) 
                  ],),

                SizedBox(height: 20),
                
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text("Result",style: TextStyle(fontSize: 20)),
                    // ignore: deprecated_member_use
                    RaisedButton(
                      child: Text("Calculate"),
                      onPressed: answer,
                    )
                  ],),

                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(error.toString(),
                      style: TextStyle(fontSize:20,color: Colors.red,
                      decoration: TextDecoration.underline),
                  ),
                  ], 
                ),

                SizedBox(height: 20),

                Container(
                  height: 70,
                  decoration: BoxDecoration(
                    border: Border.all(width: 5,color: Colors.red)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("ABSI",style: TextStyle(fontSize: 20)),
                      Text(absi.toStringAsFixed(5),
                      style: TextStyle(fontSize: 20),
                      ),
                  ]),
                ),

                SizedBox(height: 25),
            ],
            )
          ),
        ),
      ),
      )
    );
  }

    void answer(){
      setState(() {
      double numh = double.parse(h.text);
      double numw = double.parse(w.text);
      double numwc = double.parse(wc.text);
      if(numh <=0 || numw<=0 || numwc<=0) {
        setState(() {
          error = "You enter invalid data";
          absi =0.0;
          return;
        },
        );
      }
      else{
        setState(() {
          error="";
        });
      }
      if(valh==1 && numw>0){ //h=cm
        if(valw==1){ //w=kg
          if(valwc==1){ //wc=cm
            double bmi = numw/(pow((numh/100), 2));
            absi = numwc/100/(pow(bmi, 2/3) * pow((numh/100), 1/2));            
          }
          else{ //wc=m
            double bmi = numw/(pow((numh/100), 2));
            absi = numwc/(pow(bmi, 2/3) * pow((numh/100), 1/2));
          }//end wc
        }
        else{//w=g
             if(valwc==1){ //wc=cm
            double bmi = (numw/1000)/(pow((numh/100), 2));
            absi = numwc/100/(pow(bmi, 2/3) * pow((numh/100), 1/2));            
          }
          else{ //wc=m
            double bmi = (numw/1000)/(pow((numh/100), 2));
            absi = numwc/(pow(bmi, 2/3) * pow((numh/100), 1/2));
          }
        }//end w
      }
      else if(valh==2 && numw>0){ //h=m
        if(valw==1){ //w=kg
            if(valwc==1){ //wc=cm
            double bmi = numw/(pow((numh), 2));
            absi = numwc/100/(pow(bmi, 2/3) * pow((numh), 1/2));            
            }
            else{ //wc=m
            double bmi = numw/(pow((numh), 2));
            absi = numwc/(pow(bmi, 2/3) * pow((numh), 1/2));
            }//end wc
         } 
          else{//w=g
             if(valwc==1){ //wc=cm
              double bmi = (numw/1000)/(pow((numh), 2));
             absi = numwc/100/(pow(bmi, 2/3) * pow((numh), 1/2));            
              }
              else { //wc=m
              double bmi = (numw/1000)/(pow((numh), 2));
              absi = numwc/(pow(bmi, 2/3) * pow((numh), 1/2));
              }
          }
       }//end h
       else{
         absi=0.0;
       }});
    }}