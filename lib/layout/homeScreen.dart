import 'package:flutter/material.dart';

import '../screens/tab_controller.dart';
import '../shared/network/remote/api_manager.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/bg_img.png"), fit: BoxFit.cover),
        color: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            title: Text("El Yom El Sabea"),
            centerTitle: true,
            backgroundColor: Color(0xff39A552),
            shape: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25)))),
        body: FutureBuilder(
          future: ApiManager.getsourses(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(child: CircularProgressIndicator());
            if (snapshot.hasError)
              return Text("${snapshot.data!.message!}");
            var sources = snapshot.data?.sources ?? [];
            return TabControllerScreen(sources) ;

            //   ListView.builder(itemBuilder: (context, index) {
            //   return Text(sources[index].name ?? "");
            // }, itemCount: sources.length,);
          },
        ),
      ),
    );
  }
}
