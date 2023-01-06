import 'package:flutter/material.dart';
import 'package:flutterdemo/models/webtoonModel.dart';
import 'package:flutterdemo/services/apiService.dart';

class HomeScreen extends StatelessWidget {
  // const HomeScreen({super.key}); 는 더이상 고정값이 아니므로 삭제
  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        foregroundColor: Colors.green[300],
        backgroundColor: Colors.white,
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(child: makeList(snapshot))
                //리스트뷰의 크기를 정하지 않으면 무한대가 됨, 때문에 Expanded위젯 사용
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
  return ListView.separated(
    scrollDirection: Axis.horizontal,
    itemCount: snapshot.data!.length,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    //리스트뷰에 넣는 패딩
    itemBuilder: (context, index) {
      var webtoon = snapshot.data![index];
      return Column(
        children: [
          Container(
            width: 250,
            clipBehavior: Clip.hardEdge,
            //위 코드가 있어야 보더를 넣을 수 있음
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  blurRadius: 15,
                  offset: const Offset(10, 10),
                  color: Colors.black.withOpacity(0.3),
                )
              ],
            ),
            child: Image.network(webtoon.thumb),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            webtoon.title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      );
    },
    separatorBuilder: (context, index) => const SizedBox(width: 40),
    //요소들의 사이에 넣는 마진
  );
}
