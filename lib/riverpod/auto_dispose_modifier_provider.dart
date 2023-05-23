import 'package:flutter_riverpod/flutter_riverpod.dart';

// AutoDispose는 해당 스크린이 dispose 될 때 자동으로 캐시를 삭제한다.
final autoDisposeModifierProvider =
    FutureProvider.autoDispose<List<int>>((ref) async {
  await Future.delayed(Duration(seconds: 2));

  return [1, 2, 3, 4, 5, 6, 7];
});
