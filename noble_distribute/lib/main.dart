import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:noble_distribute/css/customText.dart';
import 'package:noble_distribute/customInput.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CustomInput(),
    );
  }
}

class FireStoreDialog extends StatefulWidget {

  @override
  _FireStoreDialogState createState() => _FireStoreDialogState();
}

class _FireStoreDialogState extends State<FireStoreDialog> {

  @override
  void initState(){
    super.initState();

    DateTime dt = DateTime.now();
    int differ = DateTime(dt.year, dt.month, dt.day).difference(
      DateTime(2021, 01, 25)).inDays;
    //if(differ%7 == 0){
      delayDialog();
    //}
    // 유저마다 클릭날짜 저장해서 불러온다음 하루이상 지나야 팝업뜨게 만들기
    // 기준일(월)으로 부터 7일의 배수만큼 지난 월요일에 다시 팝업
  }

  delayDialog() async{
    var _duration = Duration(seconds: 1);
    return Timer(_duration, PopDialog);
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text('Dialog 선택'),),
      body: Container(),
    );
  }

  void PopDialog(){
    showDialog(
        context: context,
        builder: (BuildContext context){
          Size size = MediaQuery.of(context).size;
          print(size.height);
          return AlertDialog(
            title: Text('선택해주세요'),
            content: Container(
              constraints: BoxConstraints(
                // maxHeight: 200,
                // minHeight: 180
              ),
              height : size.height*0.38,
              child: Column(
                children: [
                  OutlinedButton(onPressed: (){
                    FirebaseFirestore.instance.collection('distribute').doc(DateFormat('yyyy-MM-dd hh:mm').format(DateTime.now()))
                        .set({'selected_element' : '화평'});
                    Navigator.of(context).pop();
                  }, child: Container(
                      width: size.width*0.2,
                      child: Center(child: CustomText('화평', 15))
                    )
                  ),
                  OutlinedButton(onPressed: (){
                    FirebaseFirestore.instance.collection('distribute').doc(DateFormat('yyyy-MM-dd hh:mm').format(DateTime.now()))
                        .set({'selected_element' : '오래참음'});
                    Navigator.of(context).pop();
                  }, child: Container(
                      width: size.width*0.2,
                      child: Center(child: CustomText('오래참음', 15))
                  )
                  ),
                  OutlinedButton(onPressed: (){
                    FirebaseFirestore.instance.collection('distribute').doc(DateFormat('yyyy-MM-dd hh:mm').format(DateTime.now()))
                        .set({'selected_element' : '온유'});
                    Navigator.of(context).pop();
                  }, child: Container(
                      width: size.width*0.2,
                      child: Center(child: CustomText('온유', 15))
                  )
                  ),
                  OutlinedButton(onPressed: (){
                    FirebaseFirestore.instance.collection('distribute').doc(DateFormat('yyyy-MM-dd hh:mm').format(DateTime.now()))
                        .set({'selected_element' : '절제'});
                    Navigator.of(context).pop();
                  }, child: Container(
                      width: size.width*0.2,
                      child: Center(child: CustomText('절제', 15))
                  )
                  ),
                ],
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),

          );
        }
    );
  }
}
