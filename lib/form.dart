// import 'package:flutter/material.dart';
// import 'db_helper.dart';
// import 'modals.dart';

// class MyForm extends StatefulWidget {
//   @override
//   _MyFormState createState() => _MyFormState();
// }

// class _MyFormState extends State<MyForm> {
//   final nameController = TextEditingController();
//   final ageController = TextEditingController();
//   final emailController = TextEditingController();

//   @override
//   void dispose() {
//     nameController.dispose();
//     ageController.dispose();
//     emailController.dispose();
//     super.dispose();
//   }

//   void _handleSubmit() {
//     final user = User(
//         nameController.text, int.parse(ageController.text), emailController.text);

//     addUser(user);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: Text("example"),

//     ),
//     body: SingleChildScrollView(
//       child: Column(
//           //mainAxisAlignment: MainAxisAlignment.center,

//           children: [
//             TextField(
//               controller: nameController,
//               decoration: InputDecoration(
//                 labelText: 'Name',
//               ),
//             ),
//             TextField(
//               controller: ageController,
//               decoration: InputDecoration(
//                 labelText: 'Age',
//               ),
//             ),
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(
//                 labelText: 'Email',
//               ),
//             ),
//             ElevatedButton(
//               onPressed: _handleSubmit,
//               child: Text('Submit'),
//             ),
//           ],
//         ),
//     ),

//     );
//   }
// }

import 'package:flutter/material.dart';
import 'db_helper.dart';
import 'display.dart';
import 'modals.dart';

class MyForm extends StatefulWidget {
  final User?
      user; //fetching the data from previous page for update and store inside model class object...

  //final Function(User updatedUser, int userId) onUserUpdated;
  //  const MyForm({Key? key, this.user, required this.onUserUpdated})
  //     : super(key: key);

  //MyForm({this.user});

  const MyForm({Key? key, required this.user}) : super(key: key);

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  // final nameController = TextEditingController();
  // final ageController = TextEditingController();
  // final emailController = TextEditingController();

  late TextEditingController _companyNamesController;
  late TextEditingController _categoriesController;
  late TextEditingController _yearsController;

  @override
  void initState() {
    super
        .initState(); //checking here if data received or not . if not null we will set to our field
    _companyNamesController = TextEditingController(text: widget.user?.companyname ?? '');
    _categoriesController = TextEditingController(text: widget.user?.catagories ?? '');
    _yearsController = TextEditingController(text: widget.user?.year ?? '');
  }

  @override
  void dispose() {
    _companyNamesController.dispose();
    _categoriesController.dispose();
    _yearsController.dispose();
    super.dispose();
  }

  // void _handleSubmit() async {
  //   final user = User(
  //       id: null, // set id to null to let the database generate it
  //       name: nameController.text,
  //       age: int.tryParse(ageController.text) ??
  //           0, // use tryParse to handle invalid input
  //       email: emailController.text);

  //   int result = await DatabaseHelper.addUser(user);

  //   if (result != null && result > 0) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('User added successfully!'),
  //         duration: Duration(seconds: 2),
  //       ),
  //     );
  //     // Clear the form fields after adding the user
  //     nameController.clear();
  //     ageController.clear();
  //     emailController.clear();
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Failed to add user.'),
  //         duration: Duration(seconds: 2),
  //       ),
  //     );
  //   }
  // }

//   void _handleSubmit() async {
//   final user = User(
//     id: widget.user?.id, // set the id to the existing user's id for updating
//     name: nameController.text,
//     age: int.tryParse(ageController.text) ?? 0,
//     email: emailController.text,
//   );

//   if (widget.user == null) {
//     // Insert new user
//     int result = await DatabaseHelper.addUser(user);

//     if (result != null && result > 0) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('User added successfully!'),
//           duration: Duration(seconds: 2),
//         ),
//       );
//       // Clear the form fields after adding the user
//       nameController.clear();
//       ageController.clear();
//       emailController.clear();
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Failed to add user.'),
//           duration: Duration(seconds: 2),
//         ),
//       );
//     }
//   } else {
//     // Update existing user
//     int result = await DatabaseHelper.updateUser(user);

//     if (result != null && result > 0) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('User updated successfully!'),
//           duration: Duration(seconds: 2),
//         ),
//       );
//       Navigator.of(context).pop(); // Return to previous screen after updating
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Failed to update user.'),
//           duration: Duration(seconds: 2),
//         ),
//       );
//     }
//   }
// }

//......................................................................

// void _handleSubmit() async {
//     final user = User(
//         id: widget.user?.id, // use the id of the user being edited, if provided
//         name: nameController.text,
//         age: int.tryParse(ageController.text) ?? 0,
//         email: emailController.text);

//     int result;
//     if (widget.user == null) {
//       result = await DatabaseHelper.addUser(user);
//     } else {
//       int result = await DatabaseHelper.updateUser(user.id!, user);
//     }

//     if (result != null && result > 0) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('User added successfully!'),
//           duration: Duration(seconds: 2),
//         ),
//       );
//       // Clear the form fields after adding/updating the user
//       nameController.clear();
//       ageController.clear();
//       emailController.clear();
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Failed to add/update user.'),
//           duration: Duration(seconds: 2),
//         ),
//       );
//     }
//   }

//............................
// void _handleSubmit() async {
//   final user = User(
//     id: widget.user?.id,
//     name: nameController.text,
//     age: int.tryParse(ageController.text) ?? 0,
//     email: emailController.text,
//   );

//   int result;
//   if (widget.user == null) {
//     result = await DatabaseHelper.addUser(user);
//   } else {
//     result = await DatabaseHelper.updateUser(user.id!, user);
//   }

//   if (result != null && result > 0) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('User added/updated successfully!'),
//         duration: Duration(seconds: 2),
//       ),
//     );
//     nameController.clear();
//     ageController.clear();
//     emailController.clear();
//   } else {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Failed to add/update user.'),
//         duration: Duration(seconds: 2),
//       ),
//     );
//   }
// }

  // void _handleSubmit() async {
  //   final user = User(
  //       id: widget.user?.id, // use the id of the user being edited, if provided
  //       name: nameController.text,
  //       age: int.tryParse(ageController.text) ?? 0,
  //       email: emailController.text);

  //   int result;
  //   if (widget.user == null) {
  //     result = await DatabaseHelper.addUser(user);
  //     if (result != null && result > 0) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('User added successfully!'),
  //           duration: Duration(seconds: 2),
  //         ),
  //       );
  //       // Clear the form fields after adding/updating the user
  //       nameController.clear();
  //       ageController.clear();
  //       emailController.clear();
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('Failed to add user.'),
  //           duration: Duration(seconds: 2),
  //         ),
  //       );
  //     }
  //   } else {
  //     result = await DatabaseHelper.updateUser(user.id!, user);
  //     if (result != null && result > 0) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('User updated successfully!'),
  //           duration: Duration(seconds: 2),
  //         ),
  //       );
  //       // Clear the form fields after adding/updating the user
  //       nameController.clear();
  //       ageController.clear();
  //       emailController.clear();
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('Failed to update user.'),
  //           duration: Duration(seconds: 2),
  //         ),
  //       );
  //     }
  //   }
  // }

  void _handleSubmit() async {
    final user = User(
        id: widget.user?.id, // use the id of the user being edited, if provided
        companyname: _companyNamesController.text,
        catagories: _categoriesController.text,
        year: _yearsController.text);

    // Show confirmation dialog
    bool shouldProceed = await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(widget.user == null
                  ? 'Add User'
                  : 'Update User ${widget.user!.companyname}?'),
              content: Text(widget.user == null
                  ? 'Are you sure you want to add this user?'
                  : 'Are you sure you want to update ${widget.user!.companyname}?'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text('No')),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Text('Yes')),
              ],
            ));

    if (shouldProceed) {
      int result;
      if (widget.user == null) {
        result = await DatabaseHelper.addUser(user);
        if (result != null && result > 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('User added successfully!'),
              duration: Duration(seconds: 2),
            ),
          );
          // Clear the form fields after adding/updating the user
          _companyNamesController.clear();
          _categoriesController.clear();
          _yearsController.clear();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to add user.'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      } else {
        result = await DatabaseHelper.updateUser(user.id!, user);
        if (result != null && result > 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('User updated successfully!'),
              duration: Duration(seconds: 2),
            ),
          );
          // Clear the form fields after adding/updating the user
          _companyNamesController.clear();
          _categoriesController.clear();
          _yearsController.clear();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to update user.'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    }
  }

  //.............................................

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("example"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _companyNamesController,
              decoration: InputDecoration(
                labelText: 'companyname',
              ),
            ),
            TextField(
              controller: _categoriesController,
              decoration: InputDecoration(
                labelText: 'catagories',
              ),
            ),
            TextField(
              controller: _yearsController,
              decoration: InputDecoration(
                labelText: 'year',
              ),
            ),
            ElevatedButton(
              onPressed: _handleSubmit,
              // onPressed: (){
              //   showDialog(
              //     context: context,
              //    builder: (BuildContext context){
              //     return AlertDialog(
              //       title: Text("Confirm"),
              //       content: Text('Are you sure you want to submit?'),

              //     );

              //    }
              //    );
              // },
              child: Text('Submit'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Displaydatabase()),
                );
              },
              child: Text('see data inserted'),
            ),
          ],
        ),
      ),
    );
  }
}








//..................................
  // @override
  // void initState() {
  //   super.initState();
  //   // If user object is not null, then pre-fill the form fields with user data
  //   if (widget.user != null) {
  //     nameController.text = widget.user?.name ?? '';
  //     ageController.text = widget.user!.age?.toString() ?? '';
  //     emailController.text = widget.user?.email ?? '';
  //   }
  // }

//..................................



//...............................................
  // if (widget.user != null) {
  //   nameController.text = widget.user.name;
  //   ageController.text = widget.user.age.toString();
  //   emailController.text = widget.user.email;
  // }
  //............................................


   //Navigator.of(context).pop(); // go back to previous screen
    //......................................................
  //    if (widget.user == null) {
  //   result = await DatabaseHelper.addUser(user);
  // } else {
  //   result = await DatabaseHelper.updateUser(user);
  // }
  //................................................