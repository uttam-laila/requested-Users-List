import 'dart:async';
import 'dart:convert';
import '../models/userList.dart';
import 'package:http/http.dart' as http;

List<UserList> userListData;

class UserListBloc {
  Future getUsers() async {
    List<UserList> users = [];
    http.Response response = await http
        .get("http://www.json-generator.com/api/json/get/cgkSNIOymq?indent=2");

    // var data = await http
    //     .get('http://www.json-generator.com/api/json/get/cgkSNIOymq?indent=2');
    // var jsonData = json.decode(data.body);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      for (var u in data) {
        UserList userList = UserList(u['index'], u['name'], u['model'],
            u['fromDate'], u['toDate'], u['picture']);
        users.add(userList);
        // print(userList);
      }
    } else {
      print("error");
    }

    //  = users;
    // print(userListData);

    // userListSink.add(userListData);
    return users;
  }

  // final _userListStreamController = StreamController<List<UserList>>();
  // final _getUsersStreamController = StreamController();

  // Stream<List<UserList>> get userListStream => _userListStreamController.stream;

  // StreamSink<List<UserList>> get userListSink => _userListStreamController.sink;
  
  // StreamSink get userListsSink  => _getUsersStreamController.sink;

  // UserListBloc(){
  //   userListData = getUsers() as List<UserList>;
  //   _userListStreamController.add(userListData);
  //   _getUsersStreamController.stream.listen(getUsers1());
  // }

  // getUsers1(){
  //   // userListSink.add(userListData);
  //   return userListData;
  // }

  // void dispose(){
  //   _getUsersStreamController.close();
  //   _userListStreamController.close();
  // }
}
