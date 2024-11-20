import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layouts and Interactivity',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Layouts and Interactivity'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Row with icons and text
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.home, size: 50, color: Colors.blue),
                    Icon(Icons.star, size: 50, color: Colors.amber),
                    Icon(Icons.favorite, size: 50, color: Colors.red),
                  ],
                ),
                Divider(thickness: 2),
                SizedBox(height: 20),

                // Interactive image with GestureDetector
                GestureDetector(
                  onTap: () => print('Image tapped'),
                  onDoubleTap: () => print('Image double-tapped'),
                  onLongPress: () => print('Image long-pressed'),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                        'https://flutter.dev/assets/homepage/carousel/slide_1-layer_0-2e3c2266ec9cf60ef978e9a51bb9b6e26d7db6f91c4f13f16a01b7a87b2a9e5e.png'),
                  ),
                ),
                SizedBox(height: 20),

                // Draggable and DragTarget example
                Draggable<Color>(
                  data: Colors.green,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.green,
                    child: Center(child: Text('Drag me')),
                  ),
                  feedback: Container(
                    width: 100,
                    height: 100,
                    color: Colors.green.withOpacity(0.5),
                    child: Center(child: Text('Dragging')),
                  ),
                  childWhenDragging: Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey,
                    child: Center(child: Text('Original')),
                  ),
                ),
                SizedBox(height: 20),

                DragTarget<Color>(
                  builder: (context, candidateData, rejectedData) {
                    return Container(
                      width: 100,
                      height: 100,
                      color: candidateData.isEmpty
                          ? Colors.red
                          : Colors.blueAccent,
                      child: Center(child: Text('Drop here')),
                    );
                  },
                  onAccept: (data) => print('Dropped color: $data'),
                ),
                SizedBox(height: 20),

                // InkWell example
                InkWell(
                  onTap: () => print('InkWell tapped'),
                  splashColor: Colors.blueAccent,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Tap me!',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Dismissible widget
                Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.red),
                  onDismissed: (direction) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Item dismissed')),
                    );
                  },
                  child: ListTile(
                    tileColor: Colors.grey[200],
                    leading: Icon(Icons.message),
                    title: Text('Swipe to Dismiss'),
                  ),
                ),
                SizedBox(height: 20),

                // Row and Column combined layout
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    Chip(
                      label: Text('Chip 1'),
                      avatar: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Text('C1'),
                      ),
                    ),
                    Chip(
                      label: Text('Chip 2'),
                      avatar: CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Text('C2'),
                      ),
                    ),
                    Chip(
                      label: Text('Chip 3'),
                      avatar: CircleAvatar(
                        backgroundColor: Colors.orange,
                        child: Text('C3'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
