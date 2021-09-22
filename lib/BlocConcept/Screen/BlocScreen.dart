import 'package:cts_demo/BlocConcept/Model/updating_text_cubit.dart';
import 'package:cts_demo/Widget/CustomEditText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class bloc_screen extends StatefulWidget {
  const bloc_screen({Key? key}) : super(key: key);

  @override
  _bloc_screenState createState() => _bloc_screenState();
}
class _bloc_screenState extends State<bloc_screen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController str= new TextEditingController();
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
                    child: Text("Example of BLoC state management",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 18),),
                  )),
              const SizedBox(height: 10,),
              SizedBox(
                  width: MediaQuery.of(context).size.width-20,
                  child:Padding(
                    padding: EdgeInsets.all(8.0),
                    child: BlocBuilder<UpdatingTextCubit, UpdatingTextState>(
                   builder: (context, state) {
                    return Text(state.textValue,style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.w600,fontSize: 16),);
  },
),
                  )),
              const SizedBox(height: 10,),
              CustomEditText(height: 100, hintText: "Text 1", textEditingController: str),
              ElevatedButton(
                style: ElevatedButton.styleFrom(elevation: 2,primary: Color(0XFF2e3438)),
                onPressed: () async {

                BlocProvider.of<UpdatingTextCubit>(context).updateText(str.text);
                },
                child: Text('Submit'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
