import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAutoEditText extends StatefulWidget {
  final double height;
  final String hintText;
  final String textCounter;
  final void Function(String)? onChangeFunction;

  const CustomAutoEditText({Key? key, required this.height,required this.hintText,
    required this.onChangeFunction, required this.textCounter}) : super(key: key);

  @override
  _CustomAutoEditTextState createState() => _CustomAutoEditTextState();
}

class _CustomAutoEditTextState extends State<CustomAutoEditText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: MediaQuery.of(context).size.width,
      child:Padding(
        padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
        child: Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: TextFormField(
            textCapitalization: TextCapitalization.sentences,
            key: Key("Question"),
            style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.white24),
            onChanged:widget.onChangeFunction,
            // onSaved: (val) => _question = val!,
            maxLines: 2,
            inputFormatters: [
              new LengthLimitingTextInputFormatter(40),
            ],
            decoration: InputDecoration(
              fillColor: Color(0XFF2e3438),
              filled: true,

              hintText:widget.hintText,
              hintStyle: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.white24),
              counterText:widget.textCounter,

              border: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(16),

              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide(
                  color:Color(0XFF2e3438),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide(
                  color: Color(0XFF2e3438),
                  width: 2.0,
                ),
              ),
              isDense: true,
            ),
          ),
        ),
      ),

    );
  }
}
