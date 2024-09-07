import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          // Define the default brightness and colors
          brightness: Brightness.light,
          primaryColor: Colors.blue,
          hintColor: Colors.amber,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.grey[850],
          hintColor: Colors.tealAccent,
        ),
        color: Colors.blue,
        debugShowCheckedModeBanner: false,
        home: const HomeActivity());
  }
}

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});



  @override
  Widget build(BuildContext context) {




    ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    minimumSize: Size(double.infinity, 50),

        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))
        )


    );

    showSanckBar(message, context) {
      return ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    }





    showAlertDialog(context){
      return showDialog(
          context: context,
          builder: (BuildContext context){
            return Expanded(child: AlertDialog(
              title: Text("Alert!"),
              content: Text("Do you want to Exit!!"),
              actions: [
                TextButton(onPressed: (){
                  showSanckBar("delete succes",context);
                  Navigator.of(context).pop();
                }, child: Text("Yes")),
                TextButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: Text("NO"))
              ],

            )

            );
          }


      );

    }










    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Demo fast",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(
          color: Colors.white, // Set action icons color to yellow
        ),
        actions: [
          IconButton(
              onPressed: () {
                showSanckBar("message", context);
              },
              icon: Icon(Icons.message)),
          IconButton(
              onPressed: () {
                showSanckBar("notification", context);
              },
              icon: Icon(Icons.notifications))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.blue,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_card_sharp,
              color: Colors.blue,
            ),
            label: 'social',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history, color: Colors.blue),
            label: 'history',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.blue),
            label: 'profile',
          ),
        ],
        onTap: (int index) {
          if (index == 0) {
            showSanckBar("home", context);
          } else if (index == 1) {
            showSanckBar("social", context);
          } else if (index == 2) {
            showSanckBar("profile", context);
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          // Remove default padding
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.all(0), // Remove padding
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.blue), // Background color of the drawer header
                accountName: Text("Binoy"),
                accountEmail: Text("binoy@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://www.example.com/profile_image.png', // Replace with your actual profile image URL
                  ),
                ),
                onDetailsPressed: () {
                  // Show SnackBar when the details arrow is pressed
                  showSanckBar("Drawer header details pressed", context);
                },
              ),
            ),








            ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  showSanckBar("home", context);
                }),
            ListTile(
                leading: Icon(Icons.contact_emergency),
                title: Text('Contact Us'),
                onTap: () {
                  showSanckBar("contact", context);
                }),
            ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
                onTap: () {
                  showSanckBar("profile", context);
                }),
            ListTile(
                leading: Icon(Icons.policy),
                title: Text('Privacy Policy'),
                onTap: () {
                  showSanckBar("privacy", context);
                }),
            ListTile(
                leading: Icon(Icons.logout),
                title: Text('Log Out'),
                onTap: () {
                  showSanckBar("log out", context);
                }),
          ],
        ),
      ),

     body: Column(
       mainAxisAlignment: MainAxisAlignment.start,
       children: [
         Padding(padding: EdgeInsets.all(10) ,child: TextField(decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Fist Name')),),
         Padding(padding: EdgeInsets.all(10) ,child: TextField(decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Last Name')),),
         Padding(padding: EdgeInsets.all(10) ,child: TextField(decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Email')),),
         Padding(padding: EdgeInsets.all(10) ,child: TextField(decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Adress')),),
        Padding(padding:  EdgeInsets.all(10) ,child: ElevatedButton(onPressed: (){}, child:  Text('Sumibt'),style: buttonStyle,),)




       ],




     ),




    );
  }
}
