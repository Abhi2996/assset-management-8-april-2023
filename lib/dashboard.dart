import 'package:flutter/material.dart';
import 'package:my_app/ABM/HomePage.dart';
import 'package:my_app/Create_account.dart';
import 'package:my_app/New.dart';
// import 'package:my_app/screens/New.dart';
import 'package:my_app/Tracker.dart';
import 'package:my_app/db_helper.dart';
import 'package:my_app/form.dart';
import 'package:my_app/login .dart';

class FixedAssetsDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fixed Assets Register'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyCreateAcc()),
            );
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to Tracker Mode screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.storage,
                              size: 65,
                              color: Color.fromARGB(255, 57, 57, 57),
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Assets Storage',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to New Mode screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FixedAssetsRegisterForm()),
                      );
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.add_circle_outline,
                              size: 65,
                              color: Colors.blue,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'New Mode',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to Tracker Mode screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FixedAssetsTrackerScreen(
                                  fixedassetno: '',
                                  company: '',
                                  category: '',
                                  year: '',
                                  productname: '',
                                  type: '',
                                  purchasedate: '',
                                  modelnumber: '',
                                  purchaseamount: '',
                                )),
                      );
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.track_changes,
                              size: 65,
                              color: Colors.green,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Tracker Mode',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
