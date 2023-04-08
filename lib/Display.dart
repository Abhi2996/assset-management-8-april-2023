import 'package:flutter/material.dart';
import 'db_helper.dart';
import 'form.dart';
import 'modals.dart';

class Displaydatabase extends StatefulWidget {
  const Displaydatabase({super.key});
  //const Displaydatabase({Key? key}) : super(key: key);

  @override
  State<Displaydatabase> createState() => _DisplaydatabaseState();
}

class _DisplaydatabaseState extends State<Displaydatabase> {
  List<User> _users = [];

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    final users = await DatabaseHelper.getUsers();
    setState(() {
      _users = users;
    });
  }   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MyForm(user: null,),
              ));
          // Do something when the button is pressed
        },
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: _users.length,
          itemBuilder: (context, index) {
            final user = _users[index];
            return Container(
              
              padding: EdgeInsets.symmetric(vertical: 2.0,horizontal: 10.0),
              child: ListTileTheme(
                tileColor: Colors.white,
                selectedTileColor: Colors.grey[200],
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: Container(
              //     decoration: BoxDecoration(
              //   boxShadow: [
              //     BoxShadow(
              //       color: Colors.grey.withOpacity(0.5),
              //       spreadRadius: 2,
              //       blurRadius: 5,
              //       offset: Offset(0, 3),
              //     ),
              //   ],
              // ),
      
                  child: ListTile(
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyForm(
                              user: user), // on edit passing the data to edit...
                        ),
                      );
                      if (result != null) {
                        final updatedUser = result['user'] as User;
                        final userId = result['id'] as int;
                        await DatabaseHelper.updateUser(userId, updatedUser);
                        await _fetchUsers();
                      }
                    },
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(user.companyname),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${user.catagories},\n ${user.year}'),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async {
                        bool confirmDelete = await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Confirm Delete"),
                              content: Text(
                                  "Are you sure you want to delete this ${user.companyname}?"),
                              actions: [
                                TextButton(
                                  child: Text("Cancel"),
                                  onPressed: () => Navigator.pop(context, false),
                                ),
                                TextButton(
                                  child: Text("Delete"),
                                  onPressed: () => Navigator.pop(context, true),
                                ),
                              ],
                            );
                          },
                        );
                        if (confirmDelete != null && confirmDelete) {
                          await DatabaseHelper.deleteUser(user.id!);
                          await _fetchUsers();
                        }
                      },
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


// trailing: IconButton(
              //   icon: Icon(Icons.delete),
              //   onPressed: () async {
              //     await DatabaseHelper.deleteUser(user.id!);
              //     await _fetchUsers();
              //   },
              // ),

// onTap: () async {
            //   final result = await Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => MyForm(
            //         user: user,
            //         onUserUpdated: (updatedUser) async {
            //           final userId = user.id;
            //           await DatabaseHelper.updateUser(userId, updatedUser);
            //           await _fetchUsers();
            //         },
            //       ),
            //     ),
            //   );
            // },







  //           onTap: () async {
  //   final result = await Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => MyForm(
  //         user: user,
  //         onUserUpdated: (updatedUser, userId) async {
  //           await DatabaseHelper.updateUser(userId, updatedUser);
  //           await _fetchUsers();
  //         },
  //       ),
  //     ),
  //   );
  //   // ...
  // },



            // onTap: () async {
            //   final result = await Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => MyForm(user: user),
            //     ),
            //   );
            //   if (result != null) {
            //     final updatedUser = result['user'] as User;
            //     final userId = result['id'] as int;
            //     await DatabaseHelper.updateUser(userId, updatedUser);
            //     await _fetchUsers();
            //   }
            // },









// onTap: ()  {
            //   Navigator.push(

            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => MyForm(user: user),
            //     ),
            //   );
            // },