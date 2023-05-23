import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/layout/default_layout.dart';
import 'package:untitled/riverpod/listen_provider.dart';

// stateful widget에서 provider를 사용하기 위해서는 ConsumberStatefulWidget을 상속 받아야함
class ListenProviderScreen extends ConsumerStatefulWidget {
  const ListenProviderScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ListenProviderScreen> createState() =>
      _ListenProviderScreenState();
}

// State도 ConsumerState로 변경
// 신기한 점은 Stateless에서 ConsumerWidget을 상속 받으면 build 메소드에서 두번째 파라미터로 WidgetRef ref를 받아와야 했지만
// ConsumerStatefulWidget에서는 받아올 필요가 없다.
// 기본적으로 글로벌하게 ref가 만들어져 있다. this.ref
class _ListenProviderScreenState extends ConsumerState<ListenProviderScreen>
    with TickerProviderStateMixin {
  late final TabController controller;

  // initState에서는 watch 해서는 안됨 -> 단발성 메소드임
  @override
  void initState() {
    super.initState();

    controller = TabController(
      length: 10,
      vsync: this,
      initialIndex: ref.read(listenProvider),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<int>(listenProvider, (previous, next) {
      // previous : 기존 상태
      // next: 변경될 다음 상태
      print("previous : $previous");
      print("next : $next");
      print("-----------------------");
      if (previous != next) {
        controller.animateTo(
          next,
        );
      }
    });
    return DefaultLayout(
      title: 'ListenProviderScreen',
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: List.generate(
          10,
          (index) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(index.toString()),
              ElevatedButton(
                onPressed: () {
                  ref
                      .read(listenProvider.notifier)
                      .update((state) => state == 9 ? 9 : state + 1);
                },
                child: Text("다음"),
              ),
              ElevatedButton(
                onPressed: () {
                  ref
                      .read(listenProvider.notifier)
                      .update((state) => state == 0 ? 0 : state - 1);
                },
                child: Text("뒤로"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
