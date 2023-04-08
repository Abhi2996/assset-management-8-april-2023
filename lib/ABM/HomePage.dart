import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_app/ABM/Models/tenant.dart';
import 'package:my_app/ABM/database/MyDatabase.dart';
import 'package:my_app/New.dart';

import 'package:my_app/Tracker.dart';

//////////////////////
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final PageController pageController;
  ScrollController _scrollController = ScrollController();
  int pageNo = 0;

  Timer? carasouelTmer;

  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pageNo == 4) {
        pageNo = 0;
      }
      pageController.animateToPage(
        pageNo,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCirc,
      );
      pageNo++;
    });
  }

  bool isLoading = false;
  List<Tenant> tenant = List.empty(growable: true);
  final MyDataBase _myDataBase = MyDataBase();
  int count = 0;
  final TextEditingController _searcher = TextEditingController();

  getDataFromDb(String searchText) async {
    await _myDataBase.initializedDatabase();
    List<Map<String, Object?>> map = await _myDataBase.getFlatOwnerlist();
    tenant = [];
    for (int i = 0; i < map.length; i++) {
      tenant.add(Tenant.toFm(map[i]));
    }
    if (searchText.isNotEmpty) {
      tenant = tenant
          .where(
              (fm) => fm.QRcode.toString().contains(searchText.toLowerCase()))
          .toList();
    }
    count = await _myDataBase.countFlatOwnerlist();
    setState(() {
      isLoading = false;
    });
  }

  ///////////
  ///Refreshing list view
  // Future<void> _refreshData() async {
  //   // Call a method to retrieve the updated data

  //   List<Tenant> updatedData = await getDataFromDb(_searcher.text);

  //   // Call setState() to rebuild the widget with the updated data
  //   setState(() {
  //     tenant = updatedData;
  //   });
  // }
  ///Refreshing list view
  _refreshData() async {
    // Call a method to retrieve the updated data

    List<Tenant> updatedData = await getDataFromDb(_searcher.text);

    // Call setState() to rebuild the widget with the updated data
    setState(() {
      tenant = updatedData;
    });
  }

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.85);
    carasouelTmer = getTimer();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        showBtmAppBr = false;
        setState(() {});
      } else {
        showBtmAppBr = true;
        setState(() {});
      }
    });
    getDataFromDb(_searcher.text);

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  bool showBtmAppBr = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          // Handle refresh action
          setState(() {
            _refreshData();
          });
        },
        child: SafeArea(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                Material(
                  color: Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(6),
                  child: InkWell(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => FixedAssetsTrackerScreen(
                      //             result: "null", category: '',
                      //           )),
                      // );
                    },
                    borderRadius: BorderRadius.circular(6),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 10,
                      ),
                      child: Text(
                        "Assets Storage",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: kToolbarHeight -
                          8, // adjust the padding value as needed
                      child: Container(
                        margin: EdgeInsets.all(10),
                        width: 200,
                        child: TextFormField(
                          controller: _searcher,
                          validator: (Value) =>
                              Value == "" ? "Please write Flat no" : null,
                          decoration: InputDecoration(
                            prefixIcon:
                                const Icon(Icons.search, color: Colors.black),
                            hintText: "Search QRcode.....",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                              borderSide:
                                  const BorderSide(color: Colors.white60),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9),
                              borderSide:
                                  const BorderSide(color: Colors.white60),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9),
                              borderSide:
                                  const BorderSide(color: Colors.white60),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9),
                              borderSide:
                                  const BorderSide(color: Colors.white60),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 5),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          onChanged: (text) {
                            setState(() {
                              isLoading = true;
                            });
                            getDataFromDb(text);
                          },
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            _refreshData();
                          });
                        },
                        icon: Icon(Icons.refresh))
                    // Text("Total Tenant :${tenant.length}"),
                  ],
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: tenant.length,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onLongPress: () {
                        // Function to execute on long press
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Delete Item?'),
                              content: Text(
                                  'Are you sure you want to delete this item?'),
                              actions: [
                                TextButton(
                                  onPressed: () async {
                                    Navigator.of(context).pop(true);
                                    String flatOwnerName =
                                        await tenant[index].assetname;
                                    await _myDataBase
                                        .deleteFlatOwnerlist(tenant[index]);
                                    if (mounted) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  '${flatOwnerName.toUpperCase()}Deleted')));
                                    }
                                  },
                                  child: Text('Yes'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // Perform delete operation here
                                    Navigator.of(context).pop(false);
                                    ;
                                  },
                                  child: Text('No'),
                                ),
                              ],
                            );
                          },
                        ).then((value) {
                          if (value == true) {
                            // Perform delete operation here
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 205, 205, 205),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 250, 0, 0)
                                  .withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            )
                          ],
                        ),
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Name
                            Text(
                              'Asset Name:${tenant[index].assetname.toUpperCase()}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              'Purchase Date: ${tenant[index].purchaedate}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Color.fromARGB(255, 16, 0, 0),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'QRcode: ${tenant[index].QRcode}',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 2, 48, 255),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Material(
                                //   color: Color.fromARGB(255, 3, 45, 255),
                                //   borderRadius: BorderRadius.circular(20),
                                //   child: InkWell(
                                //     onTap: () {},
                                //     borderRadius: BorderRadius.circular(20),
                                //     child: const Padding(
                                //       padding: EdgeInsets.symmetric(
                                //         vertical: 6,
                                //         horizontal: 10,
                                //       ),
                                //       child: Text(
                                //         "Update",
                                //         style: TextStyle(
                                //           color: Colors.white,
                                //           fontSize: 14,
                                //           fontWeight: FontWeight.bold,
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Perform some action when the button is pressed
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FixedAssetsRegisterForm(),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

/////////////////
class PopUpMen extends StatelessWidget {
  final List<PopupMenuEntry> menuList;
  final Widget? icon;
  const PopUpMen({Key? key, required this.menuList, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      itemBuilder: ((context) => menuList),
      icon: icon,
    );
  }
}

class FabExt extends StatelessWidget {
  const FabExt({
    Key? key,
    required this.showFabTitle,
  }) : super(key: key);

  final bool showFabTitle;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {},
      label: AnimatedContainer(
        duration: const Duration(seconds: 2),
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            const Icon(CupertinoIcons.cart),
            SizedBox(width: showFabTitle ? 12.0 : 0),
            AnimatedContainer(
              duration: const Duration(seconds: 2),
              child: showFabTitle ? const Text("Go to cart") : const SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
