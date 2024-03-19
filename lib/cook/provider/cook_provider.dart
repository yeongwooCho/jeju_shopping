import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jeju_shopping/common/utils/data_utils.dart';
import 'package:jeju_shopping/cook/model/cook_model.dart';
import 'package:jeju_shopping/product/model/product_model.dart';
import 'package:jeju_shopping/product/provider/product_provider.dart';

final cookProvider =
    StateNotifierProvider<CookStateNotifier, List<CookModel>>((ref) {
  final products = ref.watch(productProvider);

  return CookStateNotifier(products: products);
});

class CookStateNotifier extends StateNotifier<List<CookModel>> {
  final List<ProductModel> products;

  CookStateNotifier({
    required this.products,
  }) : super([]) {
    getItems();
  }

  void getItems() {
    state = [
      CookModel(
        id: DataUtils.getUuid(),
        name: '냉이 차돌박이 솥밥냉이 차돌박이 솥밥냉이 차돌박이 솥밥냉이 차돌박이 솥밥냉이 차돌박이 솥밥냉이 차돌박이 솥밥',
        description:
            '꽃샘추위도 잠시, 언제 추웠냐는 듯 창밖으로만 봐도 이제 완연한 봄이라는 게 실감이 나네요. 오늘은 봄 내음이 물씬 풍기는 냉이와 고소한 풍미의 차돌박이로 만드는 ‘냉이 차돌박이 솥밥’ 레시피를 소개해 드려요. 냉이와 차돌박이의 조합은 맛은 물론, 영양까지 잡아 나른한 봄에 먹기 좋은 한 그릇 음식이랍니다. 짭조름한 양념간장에 슥슥 비벼 먹으면 더 풍부한 맛을 즐길 수 있어요.',
        ingredient: [
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
        ],
        recipe: [
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnl;asdnflnasdlfknaslkdfnklasndlfknasdlfnalskdnflkasndflknaslkdfnalskdnflaksdnflkasndflkansdlkfnsalkdfnlaskdnflkasdnflkansdlkfnalsdfnasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
        ],
        cookState: CookState.breakfast,
        mainImageUrl: 'asset/img/cook/cook00.jpg',
        detailImageUrls: [],
        preferProducts: products,
      ),
      CookModel(
        id: DataUtils.getUuid(),
        name: '냉이 차돌박이 솥밥',
        description:
            '꽃샘추위도 잠시, 언제 추웠냐는 듯 창밖으로만 봐도 이제 완연한 봄이라는 게 실감이 나네요. 오늘은 봄 내음이 물씬 풍기는 냉이와 고소한 풍미의 차돌박이로 만드는 ‘냉이 차돌박이 솥밥’ 레시피를 소개해 드려요. 냉이와 차돌박이의 조합은 맛은 물론, 영양까지 잡아 나른한 봄에 먹기 좋은 한 그릇 음식이랍니다. 짭조름한 양념간장에 슥슥 비벼 먹으면 더 풍부한 맛을 즐길 수 있어요.',
        ingredient: [
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
        ],
        recipe: [
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnl;asdnflnasdlfknaslkdfnklasndlfknasdlfnalskdnflkasndflknaslkdfnalskdnflaksdnflkasndflkansdlkfnsalkdfnlaskdnflkasdnflkansdlkfnalsdfnasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
        ],
        cookState: CookState.breakfast,
        mainImageUrl: 'asset/img/cook/cook01.jpg',
        detailImageUrls: [],
        preferProducts: products,
      ),
      CookModel(
        id: DataUtils.getUuid(),
        name: '냉이 차돌박이 솥밥',
        description:
            '꽃샘추위도 잠시, 언제 추웠냐는 듯 창밖으로만 봐도 이제 완연한 봄이라는 게 실감이 나네요. 오늘은 봄 내음이 물씬 풍기는 냉이와 고소한 풍미의 차돌박이로 만드는 ‘냉이 차돌박이 솥밥’ 레시피를 소개해 드려요. 냉이와 차돌박이의 조합은 맛은 물론, 영양까지 잡아 나른한 봄에 먹기 좋은 한 그릇 음식이랍니다. 짭조름한 양념간장에 슥슥 비벼 먹으면 더 풍부한 맛을 즐길 수 있어요.',
        ingredient: [
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
        ],
        recipe: [
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnl;asdnflnasdlfknaslkdfnklasndlfknasdlfnalskdnflkasndflknaslkdfnalskdnflaksdnflkasndflkansdlkfnsalkdfnlaskdnflkasdnflkansdlkfnalsdfnasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
        ],
        cookState: CookState.breakfast,
        mainImageUrl: 'asset/img/cook/cook02.jpg',
        detailImageUrls: [],
        preferProducts: products,
      ),
      CookModel(
        id: DataUtils.getUuid(),
        name: '냉이 차돌박이 솥밥',
        description:
            '꽃샘추위도 잠시, 언제 추웠냐는 듯 창밖으로만 봐도 이제 완연한 봄이라는 게 실감이 나네요. 오늘은 봄 내음이 물씬 풍기는 냉이와 고소한 풍미의 차돌박이로 만드는 ‘냉이 차돌박이 솥밥’ 레시피를 소개해 드려요. 냉이와 차돌박이의 조합은 맛은 물론, 영양까지 잡아 나른한 봄에 먹기 좋은 한 그릇 음식이랍니다. 짭조름한 양념간장에 슥슥 비벼 먹으면 더 풍부한 맛을 즐길 수 있어요.',
        ingredient: [
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
        ],
        recipe: [
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnl;asdnflnasdlfknaslkdfnklasndlfknasdlfnalskdnflkasndflknaslkdfnalskdnflaksdnflkasndflkansdlkfnsalkdfnlaskdnflkasdnflkansdlkfnalsdfnasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
        ],
        cookState: CookState.breakfast,
        mainImageUrl: 'asset/img/cook/cook03.jpg',
        detailImageUrls: [],
        preferProducts: products,
      ),
      CookModel(
        id: DataUtils.getUuid(),
        name: '냉이 차돌박이 솥밥',
        description:
            '꽃샘추위도 잠시, 언제 추웠냐는 듯 창밖으로만 봐도 이제 완연한 봄이라는 게 실감이 나네요. 오늘은 봄 내음이 물씬 풍기는 냉이와 고소한 풍미의 차돌박이로 만드는 ‘냉이 차돌박이 솥밥’ 레시피를 소개해 드려요. 냉이와 차돌박이의 조합은 맛은 물론, 영양까지 잡아 나른한 봄에 먹기 좋은 한 그릇 음식이랍니다. 짭조름한 양념간장에 슥슥 비벼 먹으면 더 풍부한 맛을 즐길 수 있어요.',
        ingredient: [
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
        ],
        recipe: [
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnl;asdnflnasdlfknaslkdfnklasndlfknasdlfnalskdnflkasndflknaslkdfnalskdnflaksdnflkasndflkansdlkfnsalkdfnlaskdnflkasdnflkansdlkfnalsdfnasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
        ],
        cookState: CookState.breakfast,
        mainImageUrl: 'asset/img/cook/cook04.jpg',
        detailImageUrls: [],
        preferProducts: products,
      ),
      CookModel(
        id: DataUtils.getUuid(),
        name: '냉이 차돌박이 솥밥',
        description:
            '꽃샘추위도 잠시, 언제 추웠냐는 듯 창밖으로만 봐도 이제 완연한 봄이라는 게 실감이 나네요. 오늘은 봄 내음이 물씬 풍기는 냉이와 고소한 풍미의 차돌박이로 만드는 ‘냉이 차돌박이 솥밥’ 레시피를 소개해 드려요. 냉이와 차돌박이의 조합은 맛은 물론, 영양까지 잡아 나른한 봄에 먹기 좋은 한 그릇 음식이랍니다. 짭조름한 양념간장에 슥슥 비벼 먹으면 더 풍부한 맛을 즐길 수 있어요.',
        ingredient: [
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
        ],
        recipe: [
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnl;asdnflnasdlfknaslkdfnklasndlfknasdlfnalskdnflkasndflknaslkdfnalskdnflaksdnflkasndflkansdlkfnsalkdfnlaskdnflkasdnflkansdlkfnalsdfnasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
        ],
        cookState: CookState.breakfast,
        mainImageUrl: 'asset/img/cook/cook05.jpg',
        detailImageUrls: [],
        preferProducts: products,
      ),
      CookModel(
        id: DataUtils.getUuid(),
        name: '냉이 차돌박이 솥밥',
        description:
            '꽃샘추위도 잠시, 언제 추웠냐는 듯 창밖으로만 봐도 이제 완연한 봄이라는 게 실감이 나네요. 오늘은 봄 내음이 물씬 풍기는 냉이와 고소한 풍미의 차돌박이로 만드는 ‘냉이 차돌박이 솥밥’ 레시피를 소개해 드려요. 냉이와 차돌박이의 조합은 맛은 물론, 영양까지 잡아 나른한 봄에 먹기 좋은 한 그릇 음식이랍니다. 짭조름한 양념간장에 슥슥 비벼 먹으면 더 풍부한 맛을 즐길 수 있어요.',
        ingredient: [
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
        ],
        recipe: [
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnl;asdnflnasdlfknaslkdfnklasndlfknasdlfnalskdnflkasndflknaslkdfnalskdnflaksdnflkasndflkansdlkfnsalkdfnlaskdnflkasdnflkansdlkfnalsdfnasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
        ],
        cookState: CookState.lunch,
        mainImageUrl: 'asset/img/cook/cook06.jpg',
        detailImageUrls: [],
        preferProducts: products,
      ),
      CookModel(
        id: DataUtils.getUuid(),
        name: '냉이 차돌박이 솥밥',
        description:
            '꽃샘추위도 잠시, 언제 추웠냐는 듯 창밖으로만 봐도 이제 완연한 봄이라는 게 실감이 나네요. 오늘은 봄 내음이 물씬 풍기는 냉이와 고소한 풍미의 차돌박이로 만드는 ‘냉이 차돌박이 솥밥’ 레시피를 소개해 드려요. 냉이와 차돌박이의 조합은 맛은 물론, 영양까지 잡아 나른한 봄에 먹기 좋은 한 그릇 음식이랍니다. 짭조름한 양념간장에 슥슥 비벼 먹으면 더 풍부한 맛을 즐길 수 있어요.',
        ingredient: [
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
        ],
        recipe: [
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnl;asdnflnasdlfknaslkdfnklasndlfknasdlfnalskdnflkasndflknaslkdfnalskdnflaksdnflkasndflkansdlkfnsalkdfnlaskdnflkasdnflkansdlkfnalsdfnasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
        ],
        cookState: CookState.lunch,
        mainImageUrl: 'asset/img/cook/cook07.jpg',
        detailImageUrls: [],
        preferProducts: products,
      ),
      CookModel(
        id: DataUtils.getUuid(),
        name: '냉이 차돌박이 솥밥',
        description:
            '꽃샘추위도 잠시, 언제 추웠냐는 듯 창밖으로만 봐도 이제 완연한 봄이라는 게 실감이 나네요. 오늘은 봄 내음이 물씬 풍기는 냉이와 고소한 풍미의 차돌박이로 만드는 ‘냉이 차돌박이 솥밥’ 레시피를 소개해 드려요. 냉이와 차돌박이의 조합은 맛은 물론, 영양까지 잡아 나른한 봄에 먹기 좋은 한 그릇 음식이랍니다. 짭조름한 양념간장에 슥슥 비벼 먹으면 더 풍부한 맛을 즐길 수 있어요.',
        ingredient: [
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
        ],
        recipe: [
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnl;asdnflnasdlfknaslkdfnklasndlfknasdlfnalskdnflkasndflknaslkdfnalskdnflaksdnflkasndflkansdlkfnsalkdfnlaskdnflkasdnflkansdlkfnalsdfnasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
        ],
        cookState: CookState.lunch,
        mainImageUrl: 'asset/img/cook/cook08.jpg',
        detailImageUrls: [],
        preferProducts: products,
      ),
      CookModel(
        id: DataUtils.getUuid(),
        name: '냉이 차돌박이 솥밥',
        description:
            '꽃샘추위도 잠시, 언제 추웠냐는 듯 창밖으로만 봐도 이제 완연한 봄이라는 게 실감이 나네요. 오늘은 봄 내음이 물씬 풍기는 냉이와 고소한 풍미의 차돌박이로 만드는 ‘냉이 차돌박이 솥밥’ 레시피를 소개해 드려요. 냉이와 차돌박이의 조합은 맛은 물론, 영양까지 잡아 나른한 봄에 먹기 좋은 한 그릇 음식이랍니다. 짭조름한 양념간장에 슥슥 비벼 먹으면 더 풍부한 맛을 즐길 수 있어요.',
        ingredient: [
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
        ],
        recipe: [
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnl;asdnflnasdlfknaslkdfnklasndlfknasdlfnalskdnflkasndflknaslkdfnalskdnflaksdnflkasndflkansdlkfnsalkdfnlaskdnflkasdnflkansdlkfnalsdfnasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
        ],
        cookState: CookState.lunch,
        mainImageUrl: 'asset/img/cook/cook09.jpg',
        detailImageUrls: [],
        preferProducts: products,
      ),
      CookModel(
        id: DataUtils.getUuid(),
        name: '냉이 차돌박이 솥밥',
        description:
            '꽃샘추위도 잠시, 언제 추웠냐는 듯 창밖으로만 봐도 이제 완연한 봄이라는 게 실감이 나네요. 오늘은 봄 내음이 물씬 풍기는 냉이와 고소한 풍미의 차돌박이로 만드는 ‘냉이 차돌박이 솥밥’ 레시피를 소개해 드려요. 냉이와 차돌박이의 조합은 맛은 물론, 영양까지 잡아 나른한 봄에 먹기 좋은 한 그릇 음식이랍니다. 짭조름한 양념간장에 슥슥 비벼 먹으면 더 풍부한 맛을 즐길 수 있어요.',
        ingredient: [
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
        ],
        recipe: [
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnl;asdnflnasdlfknaslkdfnklasndlfknasdlfnalskdnflkasndflknaslkdfnalskdnflaksdnflkasndflkansdlkfnsalkdfnlaskdnflkasdnflkansdlkfnalsdfnasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
        ],
        cookState: CookState.lunch,
        mainImageUrl: 'asset/img/cook/cook10.jpg',
        detailImageUrls: [],
        preferProducts: products,
      ),
      CookModel(
        id: DataUtils.getUuid(),
        name: '냉이 차돌박이 솥밥',
        description:
            '꽃샘추위도 잠시, 언제 추웠냐는 듯 창밖으로만 봐도 이제 완연한 봄이라는 게 실감이 나네요. 오늘은 봄 내음이 물씬 풍기는 냉이와 고소한 풍미의 차돌박이로 만드는 ‘냉이 차돌박이 솥밥’ 레시피를 소개해 드려요. 냉이와 차돌박이의 조합은 맛은 물론, 영양까지 잡아 나른한 봄에 먹기 좋은 한 그릇 음식이랍니다. 짭조름한 양념간장에 슥슥 비벼 먹으면 더 풍부한 맛을 즐길 수 있어요.',
        ingredient: [
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
        ],
        recipe: [
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnl;asdnflnasdlfknaslkdfnklasndlfknasdlfnalskdnflkasndflknaslkdfnalskdnflaksdnflkasndflkansdlkfnsalkdfnlaskdnflkasdnflkansdlkfnalsdfnasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
        ],
        cookState: CookState.lunch,
        mainImageUrl: 'asset/img/cook/cook11.jpg',
        detailImageUrls: [],
        preferProducts: products,
      ),
      CookModel(
        id: DataUtils.getUuid(),
        name: '냉이 차돌박이 솥밥',
        description:
            '꽃샘추위도 잠시, 언제 추웠냐는 듯 창밖으로만 봐도 이제 완연한 봄이라는 게 실감이 나네요. 오늘은 봄 내음이 물씬 풍기는 냉이와 고소한 풍미의 차돌박이로 만드는 ‘냉이 차돌박이 솥밥’ 레시피를 소개해 드려요. 냉이와 차돌박이의 조합은 맛은 물론, 영양까지 잡아 나른한 봄에 먹기 좋은 한 그릇 음식이랍니다. 짭조름한 양념간장에 슥슥 비벼 먹으면 더 풍부한 맛을 즐길 수 있어요.',
        ingredient: [
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
        ],
        recipe: [
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnl;asdnflnasdlfknaslkdfnklasndlfknasdlfnalskdnflkasndflknaslkdfnalskdnflaksdnflkasndflkansdlkfnsalkdfnlaskdnflkasdnflkansdlkfnalsdfnasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
        ],
        cookState: CookState.dinner,
        mainImageUrl: 'asset/img/cook/cook12.jpg',
        detailImageUrls: [],
        preferProducts: products,
      ),
      CookModel(
        id: DataUtils.getUuid(),
        name: '냉이 차돌박이 솥밥',
        description:
            '꽃샘추위도 잠시, 언제 추웠냐는 듯 창밖으로만 봐도 이제 완연한 봄이라는 게 실감이 나네요. 오늘은 봄 내음이 물씬 풍기는 냉이와 고소한 풍미의 차돌박이로 만드는 ‘냉이 차돌박이 솥밥’ 레시피를 소개해 드려요. 냉이와 차돌박이의 조합은 맛은 물론, 영양까지 잡아 나른한 봄에 먹기 좋은 한 그릇 음식이랍니다. 짭조름한 양념간장에 슥슥 비벼 먹으면 더 풍부한 맛을 즐길 수 있어요.',
        ingredient: [
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
        ],
        recipe: [
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnl;asdnflnasdlfknaslkdfnklasndlfknasdlfnalskdnflkasndflknaslkdfnalskdnflaksdnflkasndflkansdlkfnsalkdfnlaskdnflkasdnflkansdlkfnalsdfnasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
        ],
        cookState: CookState.dinner,
        mainImageUrl: 'asset/img/cook/cook13.jpg',
        detailImageUrls: [],
        preferProducts: products,
      ),
      CookModel(
        id: DataUtils.getUuid(),
        name: '냉이 차돌박이 솥밥',
        description:
            '꽃샘추위도 잠시, 언제 추웠냐는 듯 창밖으로만 봐도 이제 완연한 봄이라는 게 실감이 나네요. 오늘은 봄 내음이 물씬 풍기는 냉이와 고소한 풍미의 차돌박이로 만드는 ‘냉이 차돌박이 솥밥’ 레시피를 소개해 드려요. 냉이와 차돌박이의 조합은 맛은 물론, 영양까지 잡아 나른한 봄에 먹기 좋은 한 그릇 음식이랍니다. 짭조름한 양념간장에 슥슥 비벼 먹으면 더 풍부한 맛을 즐길 수 있어요.',
        ingredient: [
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
        ],
        recipe: [
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnl;asdnflnasdlfknaslkdfnklasndlfknasdlfnalskdnflkasndflknaslkdfnalskdnflaksdnflkasndflkansdlkfnsalkdfnlaskdnflkasdnflkansdlkfnalsdfnasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
        ],
        cookState: CookState.dinner,
        mainImageUrl: 'asset/img/cook/cook14.jpg',
        detailImageUrls: [],
        preferProducts: products,
      ),
      CookModel(
        id: DataUtils.getUuid(),
        name: '냉이 차돌박이 솥밥',
        description:
            '꽃샘추위도 잠시, 언제 추웠냐는 듯 창밖으로만 봐도 이제 완연한 봄이라는 게 실감이 나네요. 오늘은 봄 내음이 물씬 풍기는 냉이와 고소한 풍미의 차돌박이로 만드는 ‘냉이 차돌박이 솥밥’ 레시피를 소개해 드려요. 냉이와 차돌박이의 조합은 맛은 물론, 영양까지 잡아 나른한 봄에 먹기 좋은 한 그릇 음식이랍니다. 짭조름한 양념간장에 슥슥 비벼 먹으면 더 풍부한 맛을 즐길 수 있어요.',
        ingredient: [
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
        ],
        recipe: [
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnl;asdnflnasdlfknaslkdfnklasndlfknasdlfnalskdnflkasndflknaslkdfnalskdnflaksdnflkasndflkansdlkfnsalkdfnlaskdnflkasdnflkansdlkfnalsdfnasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
        ],
        cookState: CookState.dinner,
        mainImageUrl: 'asset/img/cook/cook15.jpg',
        detailImageUrls: [],
        preferProducts: products,
      ),
      CookModel(
        id: DataUtils.getUuid(),
        name: '냉이 차돌박이 솥밥',
        description:
            '꽃샘추위도 잠시, 언제 추웠냐는 듯 창밖으로만 봐도 이제 완연한 봄이라는 게 실감이 나네요. 오늘은 봄 내음이 물씬 풍기는 냉이와 고소한 풍미의 차돌박이로 만드는 ‘냉이 차돌박이 솥밥’ 레시피를 소개해 드려요. 냉이와 차돌박이의 조합은 맛은 물론, 영양까지 잡아 나른한 봄에 먹기 좋은 한 그릇 음식이랍니다. 짭조름한 양념간장에 슥슥 비벼 먹으면 더 풍부한 맛을 즐길 수 있어요.',
        ingredient: [
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
        ],
        recipe: [
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnl;asdnflnasdlfknaslkdfnklasndlfknasdlfnalskdnflkasndflknaslkdfnalskdnflaksdnflkasndflkansdlkfnsalkdfnlaskdnflkasdnflkansdlkfnalsdfnasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
        ],
        cookState: CookState.dinner,
        mainImageUrl: 'asset/img/cook/cook16.jpg',
        detailImageUrls: [],
        preferProducts: products,
      ),
      CookModel(
        id: DataUtils.getUuid(),
        name: '냉이 차돌박이 솥밥',
        description:
            '꽃샘추위도 잠시, 언제 추웠냐는 듯 창밖으로만 봐도 이제 완연한 봄이라는 게 실감이 나네요. 오늘은 봄 내음이 물씬 풍기는 냉이와 고소한 풍미의 차돌박이로 만드는 ‘냉이 차돌박이 솥밥’ 레시피를 소개해 드려요. 냉이와 차돌박이의 조합은 맛은 물론, 영양까지 잡아 나른한 봄에 먹기 좋은 한 그릇 음식이랍니다. 짭조름한 양념간장에 슥슥 비벼 먹으면 더 풍부한 맛을 즐길 수 있어요.',
        ingredient: [
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
          IngredientModel(title: 'asdfasdfasdf', description: 'qwerqwerqwer'),
        ],
        recipe: [
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnl;asdnflnasdlfknaslkdfnklasndlfknasdlfnalskdnflkasndflknaslkdfnalskdnflaksdnflkasndflkansdlkfnsalkdfnlaskdnflkasdnflkansdlkfnalsdfnasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
          RecipeModel(
              imageUrl: 'asset/img/logo/logo.png',
              description:
                  '요래됐심asjdflijasldfjnlasndlfinisdnvilasdnvilnasdilvnlaisdnvilasndlivnalsidnvlinasdlivnalisnvdlianslas더'),
        ],
        cookState: CookState.dinner,
        mainImageUrl: 'asset/img/cook/cook17.jpg',
        detailImageUrls: [],
        preferProducts: products,
      ),
    ];
  }
}
