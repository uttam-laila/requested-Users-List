import 'package:flutter/material.dart';
import '../models/userList.dart';
import '../blocs/userListBloc.dart';
import '../widgets/customButton.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationContoller;

  @override
  void initState() {
    super.initState();
    animationContoller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    animation = Tween<double>(
      begin: 0.0,
      end: 120.0,
    ).animate(animationContoller);

    // animation.addListener((){
    //   setState(() {
    //     print(animation.value.toString());
    //   });
    // });

    animationContoller.forward();
  }
  // Future _getUsers() async {
  //   List<UserList> users = [];
  //   http.Response response = await http
  //       .get("http://www.json-generator.com/api/json/get/cgkSNIOymq?indent=2");

  //   // var data = await http
  //   //     .get('http://www.json-generator.com/api/json/get/cgkSNIOymq?indent=2');
  //   // var jsonData = json.decode(data.body);
  //   if (response.statusCode == 200) {
  //     var data = json.decode(response.body);
  //     for (var u in data) {
  //       UserList userList = UserList(u['index'], u['name'], u['model'],
  //           u['fromDate'], u['toDate'], u['picture']);
  //       users.add(userList);
  //     }
  //   } else {
  //     print("error");
  //   }

  //   return users;
  // }

  // @override
  // void initState() {
  //   super.initState();
  // }

  Future<List<UserList>> data;
  final bloc = UserListBloc();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: null,
        builder: (context, snapshot) {
          var customButton;
          return Scaffold(
            appBar: AppBar(
              title: Text("Requests"),
            ),
            body: Center(
              child: FutureBuilder(
                future: bloc.getUsers(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data != null) {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          color: Colors.blueAccent[100],
                          child: SizedBox(
                            height: 120,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              elevation: 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  ListTile(
                                    leading: CircleAvatar(
                                      radius: 30.0,
                                      backgroundImage: NetworkImage(
                                        snapshot.data[index].picture,
                                      ),
                                    ),
                                    title: Center(
                                        child: Text(
                                      snapshot.data[index].name,
                                    )),
                                    subtitle: Center(
                                        child: Column(
                                      children: <Widget>[
                                        Text(snapshot.data[index].fromDate +
                                            ' to ' +
                                            snapshot.data[index].toDate),
                                        Text(snapshot.data[index].model),
                                      ],
                                    )),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        IconButton(
                                            icon: Icon(
                                                Icons.check_circle_outline,
                                                color: Colors.green,
                                                size: 34.0),
                                            onPressed: () {}),
                                        IconButton(
                                            icon: Icon(Icons.cancel,
                                                color: Colors.red, size: 34.0),
                                            onPressed: () {}),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: Text("Loading..."),
                    );
                  }
                },
              ),
            ),
            bottomNavigationBar: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                    height: 60,
                    child: CustomButton(
                        key: customButton,
                        text: 'Accepted',
                        callback: () {
                          // Text("Tested");
                        })),
              ],
            ),
          );
        });
  }
}
