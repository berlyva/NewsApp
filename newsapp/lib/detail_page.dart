import 'package:flutter/material.dart';
import 'package:newsapp/article.dart';
import 'package:newsapp/package/custom_scaffold.dart';

import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetailPage extends StatelessWidget {
  static const routeName = '/article_detail';
  final Article article;
  const ArticleDetailPage({Key? key, required this.article}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          article.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(article.urlToImage),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(article.description),
                  Divider(
                    color: Colors.grey,
                  ),
                  Text(
                    article.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  Text('Date: ${article.publishedAt}'),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Author: ${article.author}'),
                  Divider(
                    color: Colors.grey,
                  ),
                  Text(
                    article.content,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        ArticleWebView.routeName,
                        arguments: article.url,
                      );
                    },
                    child: Text("Read More"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ArticleWebView extends StatelessWidget {
  // const ArticleWebView({super.key, required this.url});
  final String url;
  static const routeName = '/article_web';
  const ArticleWebView({Key? key, required this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()..loadRequest(Uri.parse(url));
    // first
    // return Scaffold(
    //     appBar: AppBar(
    //       title: Text("News App"),
    //     ),
    //     body: WebViewWidget(
    //       controller: controller,
    //     ));
    // return CustomScaffold(body: WebView())
    return CustomScaffold(body: WebViewWidget(controller: controller));
  }
}
