import 'package:custom_search_delegate/feature/view/custom_search_delegate.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(
    
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
  
        title: Text(widget.title),
      ),
      body: Center(
 
        child: Column(
     
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))
                )),
                padding:MaterialStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.symmetric(horizontal: 40,vertical: 10))
              ),
                onPressed: () {

                showSearch(context: context, delegate:CustomSearch());
              
            }, child:Text('Search',style: TextStyle(color: Colors.white),))
          
          ],
        ),
      ),
    // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
