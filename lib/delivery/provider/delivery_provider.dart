import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jeju_shopping/delivery/model/delivery_model.dart';

final deliveryProvider =
    StateNotifierProvider<DeliveryStateNotifier, List<DeliveryModel>>((ref) {
  return DeliveryStateNotifier();
});

class DeliveryStateNotifier extends StateNotifier<List<DeliveryModel>> {
  DeliveryStateNotifier() : super([]);
}
