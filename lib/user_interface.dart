import 'package:flutter/material.dart';

class UserInterface extends StatefulWidget {
  const UserInterface({super.key});

  @override
  State<UserInterface> createState() => _UserInterfaceState();
}

class _UserInterfaceState extends State<UserInterface> {
  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: sh * 0.20,
        backgroundColor: Colors.deepPurpleAccent[100],
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hello, Arslan',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.notifications, color: Colors.white, size: 32),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                'My Tasks',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: sh * 0.02),
              width: sw * 0.9,
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search tasks...',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  suffixIcon: Icon(Icons.filter_list, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.grey[100],
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Categories',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                          ),
                        ),
                        Text(
                          'View all',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.deepPurpleAccent[100],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8, left: 8),
                    child: SingleChildScrollView(
                      child: SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            card(
                              color: Colors.purpleAccent,
                              icon: Icons.assignment,
                              t1: 'All',
                              t2: '12',
                              context: context,
                            ),
                            card(
                              color: Colors.blue,
                              icon: Icons.work,
                              t1: 'Work',
                              t2: '5',
                              context: context,
                            ),
                            card(
                              color: Colors.green,
                              icon: Icons.school,
                              t1: 'Study',
                              t2: '4',
                              context: context,
                            ),
                            card(
                              color: Colors.red,
                              icon: Icons.heart_broken,
                              t1: 'Personal',
                              t2: '3',
                              context: context,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Today\'s Task',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                          ),
                        ),
                        Text(
                          '3/6 Completed',
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),

                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        tile(
                          icon: Icons.check_circle,
                          t1: 'Complete Assignment',
                          t2: 'Study',
                          color: Colors.green,
                          icon2: Icons.star,
                          t3: '10:00 AM',
                          context: context,
                        ),
                        tile(
                          icon: Icons.circle,
                          t1: 'Prepare Project',
                          t2: 'Work',
                          color: Colors.blue,
                          icon2: Icons.star_border,
                          t3: '01:00 PM',
                          context: context,
                        ),
                        tile(
                          icon: Icons.circle,
                          t1: 'Grocery Shopping',
                          t2: 'Personal',
                          color: Colors.orange,
                          icon2: Icons.star_border,
                          t3: '05:00 PM',
                          context: context,
                        ),
                        tile(
                          icon: Icons.check_circle,
                          t1: 'Read 20 Pages',
                          t2: 'study',
                          color: Colors.green,
                          icon2: Icons.star,
                          t3: '08:00 PM',
                          context: context,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        width: sw * 0.19,
        height: sh * 0.09,
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          backgroundColor: Colors.deepPurpleAccent[100],
          onPressed: () {},
          child: Icon(Icons.add, color: Colors.white, size: 40),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: sh * 0.10,
        // color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            lastIcon(
              icon: Icons.home,
              color: Colors.deepPurpleAccent,
              text: 'Home',
              context: context,
            ),
            lastIcon(icon: Icons.list, text: 'Tasks', context: context),
            lastIcon(
              icon: Icons.calendar_today,
              text: 'Calender',
              context: context,
            ),
            lastIcon(
              icon: Icons.person_outline,
              text: 'Profile',
              context: context,
            ),
          ],
        ),
      ),
    );
  }
}

Widget card({
  required Color color,
  required IconData icon,
  required String t1,
  required String t2,
  required BuildContext context,
}) {
  double sh = MediaQuery.of(context).size.height;
  double sw = MediaQuery.of(context).size.width;
  return Container(
    // padding: EdgeInsets.only(right: 8),
    height: sh * 0.15,
    width: sw * 0.20,
    decoration: BoxDecoration(
      color: color.withValues(alpha: 0.1),
      border: Border.all(color: color.withValues(alpha: 0.2)),
      borderRadius: BorderRadius.circular(13),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(icon, color: color, size: 30),
        Text(t1, style: TextStyle(fontSize: 15)),
        Text(t2, style: TextStyle(fontSize: 15)),
      ],
    ),
  );
}

Widget tile({
  required IconData icon,
  required String t1,
  required String t2,
  required Color color,
  required IconData icon2,
  required String t3,
  required BuildContext context,
}) {
  double sh = MediaQuery.of(context).size.height;
  double sw = MediaQuery.of(context).size.width;
  return Container(
    padding: EdgeInsets.only(bottom: 10),
    width: sw * 0.9,
    height: sh * 0.09,
    child: Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      child: ListTile(
        leading: Icon(icon, color: Colors.green),
        title: Text(t1, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(t2, style: TextStyle(color: color)),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(icon2, color: Colors.orange),
            Text(t3, style: TextStyle(fontSize: 13, color: Colors.grey)),
          ],
        ),
      ),
    ),
  );
}

Widget lastIcon({
  required IconData icon,
  Color color = Colors.grey,
  required String text,
  required BuildContext context,
}) {
  double sh = MediaQuery.of(context).size.height;
  return Column(
    children: [
      Icon(icon, size: 25, color: color),
      SizedBox(height: sh * 0.01),
      Text(text, style: TextStyle(color: color)),
    ],
  );
}
