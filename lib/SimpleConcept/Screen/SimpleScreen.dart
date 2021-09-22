import 'package:cts_demo/Widget/CustomEditText.dart';
import 'package:flutter/material.dart';

class simple_screen extends StatefulWidget {
  const simple_screen({Key? key}) : super(key: key);

  @override
  _simple_screenState createState() => _simple_screenState();
}

class _simple_screenState extends State<simple_screen> {

  TextEditingController str1= new TextEditingController();
  String str2 = "This text is suppose to change on submit button click";
  String str = "This text will update on submit button click ";

  @override
  void initState() {


    super.initState();
  }
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width-20,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Example of single widget rebuild"
                      ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 18),),
                  )),
              SizedBox(
                  width: MediaQuery.of(context).size.width-20,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Text 2 build is seperate, it rebuild itself on Submit button click while the text of Text 1 also gets updated at the same time "
                        "but it will not get rebuild untill and unless someone press Submit 2.",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 14),),
                  )),
              const SizedBox(height: 10,),
              SizedBox(
                  width: MediaQuery.of(context).size.width-20,
                  child:Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Text 1: "+str2,style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.w600,fontSize: 16),),
                  )),
              const SizedBox(height: 10,),
              SizedBox(
                  width: MediaQuery.of(context).size.width-20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: StatefulBuilder(
                      builder: (BuildContext context, StateSetter childSetState) {
                        return

                          Column(

                            children: [
                              Text("Text 2: "+str,style: const TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.w600,fontSize: 16),),
                              CustomEditText(height: 100, hintText: "Text 1", textEditingController: str1),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(elevation: 2,primary: Color(0XFF2e3438)),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    childSetState(() {
                                        str = str1.text;
                                        str2 = "Now this widget gets rebuild on submit 2 tap!";
                                    });
                                  }
                                },
                                child: Text('Submit'),
                              ),
                            ],
                          );
                      }
                    ),
                  )),
              ElevatedButton(
                style: ElevatedButton.styleFrom(elevation: 2,primary: Color(0XFF2e3438)),
                onPressed: () async {
                 setState(() {

                 });
                },
                child: Text('Submit 2'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
