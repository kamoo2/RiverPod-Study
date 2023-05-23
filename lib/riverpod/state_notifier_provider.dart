import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/model/shopping_item_model.dart';

// StateNotifierProvider는 2개의 Generic Type을 가진다.
// 첫번째는 어떤 Notifier인지
// 두번째는 해당 Notifier가 어떤 타입의 상태를 관리하는지
final shoppingListProvider =
    StateNotifierProvider<ShoppingListNotifier, List<ShoppingItemModel>>(
  (ref) => ShoppingListNotifier(),
);

class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {
  // 1. StateNofifierProvider는 반드시 StateNotifier을 상속 받아야 한다.
  // 2. 상태를 관리할 객체의 타입을 지정해준다.
  // 3. 반드시 생성자가 필요
  // 4. super에 초기값을 설정
  ShoppingListNotifier()
      : super(
          [
            ShoppingItemModel(
              name: "김치",
              quantity: 3,
              hasBought: false,
              isSpicy: true,
            ),
            ShoppingItemModel(
              name: "라면",
              quantity: 5,
              hasBought: false,
              isSpicy: true,
            ),
            ShoppingItemModel(
              name: "삼겹살",
              quantity: 10,
              hasBought: false,
              isSpicy: false,
            ),
            ShoppingItemModel(
              name: "수박",
              quantity: 2,
              hasBought: false,
              isSpicy: false,
            ),
            ShoppingItemModel(
              name: "카스테라",
              quantity: 7,
              hasBought: false,
              isSpicy: false,
            ),
          ],
        );

  void toggleHasBought({required String name}) {
    // 현재 상태를 가져 오기 위해서는 'state'
    // 반드시 super 파라미터로 들어가는 초기값으로 값이 적용 되 있음
    state = state
        .map(
          (e) => e.name == name
              ? ShoppingItemModel(
                  name: e.name,
                  quantity: e.quantity,
                  hasBought: !e.hasBought,
                  isSpicy: e.isSpicy,
                )
              : e,
        )
        .toList();
  }
}
