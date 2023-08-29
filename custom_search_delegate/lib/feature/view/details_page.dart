import 'package:flutter/material.dart';

class SearchDeatils extends StatefulWidget {
   SearchDeatils({super.key,this.details});
   final details;

  @override
  State<SearchDeatils> createState() => _SearchDeatilsState();
}

class _SearchDeatilsState extends State<SearchDeatils> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child:Text('${widget.details}'),
      ),
    );
  }
}
