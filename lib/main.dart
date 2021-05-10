import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/post.dart';
import 'dart:convert';

void main() {
  runApp(DreamPosts());
}

class DreamPosts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DreamPosts',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  var posts = new List<Post>();

  HomePage() {
    posts = [];
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future fetchPost() async {
    final response =
        await http.get(Uri.https('jsonplaceholder.typicode.com', 'posts/'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      /* List<UserModel> users = (json.decode(response.body) as List).map((data) => UserModel.fromJson(data)).toList();
       Post.fromJson(jsonDecode(response.body)); */
      List<Post> result = (json.decode(response.body) as List)
          .map((data) => Post.fromJson(data))
          .toList();

      setState(() {
        widget.posts = result;
      });
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  _HomePageState() {
    // toda vez que a aplicação iniciar
    // irá fazer a requisição na api
    fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Align(
          alignment: Alignment.center,
          child: Image.asset(
            'assets/images/dreamlabs.png',
            height: 40.0,
            width: 80.0,
          ),
        ),
        title: Text('DreamPosts'),
      ),
      body: ListView.builder(
          //constrói dinamicamente baseado no tamanho dos posts
          itemCount: widget.posts.length,
          itemBuilder: (BuildContext ctxt, int index) {
            final post = widget.posts[index];
            //constante utilizada para evitar a repetição de código

            return Dismissible(
              child: CheckboxListTile(
                title: Text(post.title),
                value: false, //valor true ou false
                onChanged:
                    (value) {}, //o que será executado quando clicar marcar a caixa
              ),
              key: Key(post.id.toString()),
              background: Container(
                color: Colors.red.withOpacity(0.2),
              ), //o container quando criado toma o espaço total que é permitido
              onDismissed: (direction) {},
            );
          }),
    );
  }
}

/* class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
 */
/* ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 100,
            maxHeight: 100,
          ),
          child: Image.asset(
            'assets/images/dreamlabs.png',
            fit: BoxFit.scaleDown,
            height: 10.0,
          ),
        ),
 */
/* Center(
        child: FutureBuilder<Post>(
          future: futurePost,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.body);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ), */
