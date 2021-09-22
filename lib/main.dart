import 'package:cts_demo/BlocConcept/Model/updating_text_cubit.dart';
import 'package:cts_demo/BlocConcept/Screen/BlocScreen.dart';
import 'package:cts_demo/ProviderConcept/Model/ProvideClassModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'ProviderConcept/Screen/ProviderScreen.dart';
import 'SimpleConcept/Screen/SimpleScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     theme: ThemeData(
       primarySwatch: Colors.blue,
     ),
     home: const NewHomePage(),
   );
  }
}

class NewHomePage extends StatefulWidget {
  const NewHomePage({Key? key}) : super(key: key);

  @override
  _NewHomePageState createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3,
        child:Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0XFF2e3438),
              bottom: const TabBar(
                tabs: [
                  Tab(text:"Simple"),
                  Tab(text: "Provider",),
                  Tab(text: "BLoC",),
                ],
              ),
            ),

            body:TabBarView(children: [
              const simple_screen(),
            ChangeNotifierProvider(create: (context)=>ProviderClassModel(),
            child:const ProviderScreen(title: "CTS Demo") ,),

               BlocProvider<UpdatingTextCubit>(
              create: (context) => UpdatingTextCubit(),
              child: bloc_screen(),
)
            ],

            )
        )
    );
  }
}




