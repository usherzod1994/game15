import 'package:flutter/material.dart';
import 'package:game15/pages/game_page.dart';

class EnterPage extends StatelessWidget {
  const EnterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => GamePage()));
              },
              child: Text("New game", style: TextStyle(fontSize: 20,letterSpacing: 2,fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
              minimumSize: Size(250, 50),
                primary: Colors.teal,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
              ),
            ),
            SizedBox(height: 8,),
            ElevatedButton(
              onPressed: () {},
              child: Text("About", style: TextStyle(fontSize: 20,letterSpacing: 2,fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(250, 50),
                primary: Colors.teal,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
              ),
            ),
            SizedBox(height: 8,),
            ElevatedButton(
              onPressed: () {},
              child: Text("Settings", style: TextStyle(fontSize: 20,letterSpacing: 2,fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(250, 50),
                primary: Colors.teal,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
