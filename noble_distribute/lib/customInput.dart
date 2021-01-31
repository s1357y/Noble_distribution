import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:noble_distribute/css/customText.dart';

class CustomInput extends StatelessWidget {

  TextEditingController prayTitle = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title:Text('중보기도'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: size.width*0.8,
                  height: size.height*0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 2)
                  ),
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: prayTitle,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide.none
                      ),
                      hintText: '중보기도 제목을 입력해주세요.'
                    ),
                    maxLines: null,
                    minLines: null,
                    maxLength: 100,
                    expands: true,
                    validator: (String value){
                      if(value.isEmpty){
                        return '입력해!';
                      }
                      return null;
                    },
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    onPressed: (){
                      if(_key.currentState.validate()){
                        FirebaseFirestore.instance.collection('textinput')
                            .doc(DateFormat('yyyy-MM-dd hh:mm').format(DateTime.now())).set(
                            {'중보기도 제목' : prayTitle.text});
                      }
                    },
                    child: CustomText('입력', 20)
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
