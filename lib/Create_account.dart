import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:my_app/dashboard.dart';
import 'package:my_app/login .dart';
import 'package:my_app/dashboard.dart';

// import 'comm/genToFormField.dart';

class MyCreateAcc extends StatefulWidget {
  const MyCreateAcc();

  @override
  State<MyCreateAcc> createState() => _MyCreateAccState();
}

class _MyCreateAccState extends State<MyCreateAcc> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/register.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Create Account',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          backgroundColor: Color.fromARGB(0, 246, 241, 241),
          elevation: 0,
        ),
        backgroundColor: Color.fromARGB(0, 238, 232, 232),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.28,
                    right: 25,
                    left: 25),
                child: Column(
                  children: [
                    // getTextFormField(
                    //   controller: _conUserId,
                    //   icon: Icons.person,
                    //   hintName: 'User ID ',
                    // ),
                    SizedBox(
                      height: 30,
                    ),
                    // getTextFormField(
                    //   controller: _conUserId,
                    //   icon: Icons.lock,
                    //   hintName: 'Password ',
                    //   isObscureText: true,
                    // ),
                    TextField(
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black)),
                          prefixIcon: Icon(Icons.person),
                          hintText: 'User ID',
                          fillColor: Colors.grey,
                          filled: true,
                          hintStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black)),
                          prefixIcon: Icon(Icons.person_2_outlined),
                          hintText: 'User Name',
                          fillColor: Colors.grey,
                          filled: true,
                          hintStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black)),
                          prefixIcon: Icon(Icons.email),
                          hintText: 'Email',
                          fillColor: Colors.grey,
                          filled: true,
                          hintStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black)),
                          prefixIcon: Icon(Icons.lock),
                          hintText: 'Password',
                          fillColor: Colors.grey,
                          filled: true,
                          hintStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black)),
                          prefixIcon: Icon(Icons.lock),
                          hintText: 'Confirm Password',
                          fillColor: Colors.grey,
                          filled: true,
                          hintStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sign In',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                              fontWeight: FontWeight.w700),
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xff4c505b),
                          child: IconButton(
                            color: Colors.white,
                            onPressed: () {},
                            icon: Icon(Icons.arrow_back),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FixedAssetsDashboardScreen(),
                                ),
                              );
                              //  Navigator.pushNamed(context, 'CreateAcc');
                            },
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 18,
                                color: Color(0xff4c505b),
                              ),
                            )),
                            SizedBox(
                      height: 20,
                    ),
                            Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyLogin(),
                                ),
                              );
                              //  Navigator.pushNamed(context, 'CreateAcc');
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 18,
                                color: Color(0xff4c505b),
                              ),
                            )),
                        // TextButton(
                        //     onPressed: () {
                        //       Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder: (context) =>
                        //               FixedAssetsDashboardScreen(),
                        //         ),
                        //       );
                        //     },
                        //     child: Text(
                        //       'Submit',
                        //       style: TextStyle(
                        //         decoration: TextDecoration.underline,
                        //         fontSize: 18,
                        //         color: Colors.black,
                        //       ),
                        //     )),
                      ],
                    )
                  ],
                ),
                  ],
            ),))
        ]),
        ),
      );
  }
}
