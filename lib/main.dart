import 'package:coriander2/main_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'book_list_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //２行目だけだとエラーになるので追加
  await Firebase.initializeApp(); // ここ大事！Firebase使うのに初期化しないとエラーになる
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ChangeNotifierProvider<MainModel>(
          create: (_) => MainModel(),
          child: Scaffold(
            appBar: AppBar(
              title: Text('アプリ'),
            ),
            body: Consumer<MainModel>(builder: (context, model, child) {
              return Center(
                child: Column(
                  children: [
                    Text(
                      model.text,
                      style: TextStyle(fontSize: 30),
                    ),
                    RaisedButton(
                        child: Text('ボタン'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookListPage()),
                          );
                        })
                  ],
                ),
              );
            }),
          ),
        ));
  }
}
