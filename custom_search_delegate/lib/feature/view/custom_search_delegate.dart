import 'package:custom_search_delegate/feature/view/details_page.dart';
import 'package:flutter/material.dart';

class CustomSearch extends SearchDelegate {
  List<String> filterList = [];
  List<String> list = ['alvi ahmed', 'alvir walid', 'rahul hossain'];

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions

    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.close),
      )
    ];
    // throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading

    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back_ios));

    // throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) {
      return Container(
        child: Center(
          child: Text('Enter your desire key'),
        ),
      );
    }
    return ListView.builder(
      shrinkWrap: true,
      itemCount: filterList.length,
      itemBuilder: (context, index) {
        return  GestureDetector(
          onTap: () {
            Navigator.push(context,MaterialPageRoute(builder: (context) =>SearchDeatils(details:filterList[index]) ,));
          },
          child: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(horizontal: 10),
            color: Colors.grey,
            child: Row(
              children: [
                Icon(Icons.person,size: 20,),
                SizedBox(width: 10,),
                Text(filterList[index]),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.length<3){

      return Container(child: Center(child: Text('Type your search key'),),);
    }
    if(query.length>2){

      filterList=list.where((e) =>e.toLowerCase().contains(query.toLowerCase().toString())).toList();
      print(filterList);
    }
    return filterList.isNotEmpty? ListView.builder(
      shrinkWrap: true,
      itemCount: filterList.length,
      itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () {
          filterList=list.where((e) =>e.toLowerCase().contains(filterList[index])).toList();
          showResults(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(Icons.refresh_outlined),
              SizedBox(width: 10,),
              Text(filterList[index]),
            ],
          ),
        ),
      );
    },):Center(child: CircularProgressIndicator(color: Colors.blue,));
  }
}
