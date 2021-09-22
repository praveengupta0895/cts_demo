import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomEditText extends StatefulWidget {
  final double height;
  final String hintText;

  final TextEditingController textEditingController;

  const CustomEditText({Key? key, required this.height,required this.hintText,
     required this.textEditingController}) : super(key: key);

  @override
  _CustomEditTextState createState() => _CustomEditTextState();
}

class _CustomEditTextState extends State<CustomEditText> {
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
            controller: widget.textEditingController,
            textCapitalization: TextCapitalization.sentences,
            key: Key("Question"),
            style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.white24),
            maxLines: 2,
            inputFormatters: [
              new LengthLimitingTextInputFormatter(100),
            ],
            decoration: InputDecoration(
              fillColor: Color(0XFF2e3438),
              filled: true,

              hintText:widget.hintText,
              hintStyle: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.white24),

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
            validator: (value) {
              if (value!.isEmpty)
                return "This field cannot be empty !";
              return null;
            },
          ),
        ),
      ),
    );
  }
}
