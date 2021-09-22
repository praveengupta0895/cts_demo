import 'package:cts_demo/ProviderConcept/Model/ProvideClassModel.dart';
import 'package:cts_demo/Widget/CustomAutoEditText.dart';
import 'package:cts_demo/Widget/CustomEditText.dart';
import 'package:cts_demo/Widget/CustomeEditText2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderScreen extends StatefulWidget {
  const ProviderScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ProviderScreen> createState() => _ProviderScreenState();
}

class _ProviderScreenState extends State<ProviderScreen> {


  String str1 ='This text will update automatically';


  final _formKey = GlobalKey<FormState>();

  TextEditingController str2=TextEditingController();
  TextEditingController str3=TextEditingController();
  TextEditingController str4=TextEditingController();
  TextEditingController str5=TextEditingController();
  TextEditingController str6=TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Consumer<ProviderClassModel>(builder: (context,updateProvider,index)
    {
      return Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SafeArea(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width-20,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Auto updatable textfield",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 18),),
                        )),
                    const SizedBox(height: 10,),
                    SizedBox(
                        width: MediaQuery.of(context).size.width-20,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(str1,style: const TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.w600,fontSize: 16),),
                        )),
                    CustomAutoEditText(height: 100, hintText: "Text 1", onChangeFunction: (value){
                      setState(() {
                        // used this to update the value of counter;
                        str1 = value;
                      });
                    }, textCounter: '${str1.length.toString()}/40'),

                    //Button click updatable text

                    SizedBox(
                        width: MediaQuery.of(context).size.width-20,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Will update on button click",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 18),),
                        )),
                    const SizedBox(height: 10,),
                    SizedBox(
                        width: MediaQuery.of(context).size.width-20,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(updateProvider.fetchfirstText,style: const TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.w600,fontSize: 16),),
                        )),
                    const SizedBox(height: 10,),
                    SizedBox(
                        width: MediaQuery.of(context).size.width-20,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(updateProvider.fetchSecondText,style: const TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.w600,fontSize: 16),),
                        )),
                    // Custom Edit Text
                    CustomEditText(height: 100, hintText: "Text 2",textEditingController: str2,
                    ),
                    CustomEditText(height: 100, hintText: "Text 3",textEditingController: str3,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(elevation: 2,primary: Color(0XFF2e3438)),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          updateProvider.updateBothText(str2.text,str3.text);
                        }
                      },
                      child: const Text('Submit'),
                    ),

                    // Change Text On separate Click


                    SizedBox(
                        width: MediaQuery.of(context).size.width-20,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Text will update on separate button click",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 18),),
                        )),
                    const SizedBox(height: 10,),
                    SizedBox(
                        width: MediaQuery.of(context).size.width-20,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(updateProvider.fetchSingleText==""?"This text will update on submit 1 click":updateProvider.fetchSingleText,style: const TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.w600,fontSize: 16),),
                        )),
                    const SizedBox(height: 10,),
                    SizedBox(
                        width: MediaQuery.of(context).size.width-20,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(updateProvider.fetchSingleText2==""?"This text will update on submit 2 click":updateProvider.fetchSingleText2,style: const TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.w600,fontSize: 16),),
                        )),
                    // Custom Edit Text
                    CustomEditText2(height: 100, hintText: "Text 4",textEditingController: str4,
                    ),
                    CustomEditText2(height: 100, hintText: "Text 5",textEditingController: str5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(elevation: 2,primary: const Color(0XFF2e3438)),
                          onPressed: () async {
                            updateProvider.updateSingleText(str4.text);
                          },
                          child: const Text('Submit 1'),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(elevation: 2,primary: const Color(0XFF2e3438)),
                          onPressed: () async {
                            updateProvider.updateSingleText2(str5.text);
                          },
                          child: const Text('Submit 2'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )

      );
    });


  }
}
