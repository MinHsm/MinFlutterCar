import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  String getData = 'Loading...';
  String postData = "";

  Future<void> fetchData() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');

    try {
      final response =
          await HttpClient().getUrl(url).then((request) => request.close());

      if (response.statusCode == 200) {
        final responseBody = await response.transform(utf8.decoder).join();
        final jsonData = jsonDecode(responseBody);
        setState(() {
          getData = jsonData['title'];
        });
      } else {
        setState(() {
          getData = 'Error: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        getData = 'Error: $e';
      });
    }
  }

  Future<void> sendPostRequest() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final requestBody = {"title": "foo", "body": "bar", "userId": 1};
    final client = HttpClient();

    try {
      final request = await client.postUrl(url);
      request.headers.contentType = ContentType.json;
      request.write(jsonEncode(requestBody));
      final response = await request.close();
      if (response.statusCode == 201) {
        final responseBody = await response.transform(utf8.decoder).join();
        setState(() {
          postData = responseBody;
        });
      } else {
        setState(() {
          postData = 'Error:${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        postData = 'Error:$e';
      });
    } finally {
      client.close();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Get Response:'),
          Text(
            getData,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: sendPostRequest, child: Text('Send Post Request')),
          SizedBox(
            height: 10,
          ),
          Text('POST Response:'),
          Text(
            postData,
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    ));
  }
}
