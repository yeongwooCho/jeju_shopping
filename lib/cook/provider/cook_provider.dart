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
        mainImageUrl: 'asset/img/cook/0/main.jpg',
        name: '참치김치찌개',
        description:
            '이 찌개 하나면 열 반찬 안 부러워요~ 보글보글 끓는 소리만 들어도 군침이 꼴깍 넘어가는 참치김치찌개! 언제, 누구와 먹어도 늘 맛있는 메뉴죠? 들기름 넣어 볶아 고소함과 깊은 맛이 살아있답니다.',
        ingredient: [
          IngredientModel(title: '묵은지', description: '1/4포기(250g)'),
          IngredientModel(title: '참치캔(작은캔)', description: '1개'),
          IngredientModel(title: '두부', description: '1/2모'),
          IngredientModel(title: '양파', description: '1/2개'),
          IngredientModel(title: '대파', description: '1/4대'),
          IngredientModel(title: '청양고추', description: '1개'),
          IngredientModel(title: '다진마늘', description: '1작은술'),
          IngredientModel(title: '들기름', description: '1큰술'),
          IngredientModel(title: '김치국물', description: '2큰술'),
          IngredientModel(title: '설탕', description: '1/2큰술'),
          IngredientModel(title: '고춧가루', description: '1큰술'),
          IngredientModel(title: '쌀뜨물(또는 멸치육수)', description: '200ml'),
        ],
        ingredientImageUrl: 'asset/img/cook/0/ingredient.jpg',
        recipe: [
          RecipeModel(
              imageUrl: 'asset/img/cook/0/recipe/0.jpg',
              description:
                  '묵은지와 두부는 적당한 크기로 썰어주세요. 양파는 채썰고, 대파와 청양고추는 어슷 썰어주세요.'),
          RecipeModel(
              imageUrl: 'asset/img/cook/0/recipe/1.jpg',
              description:
                  '달군냄비에 들기름과 참치캔 기름을 넣고 묵은지와 양파, 설탕을 넣어 양파가 투명해질 때까지 볶아주세요.'),
          RecipeModel(
              imageUrl: 'asset/img/cook/0/recipe/2.jpg',
              description: '물, 다진마늘, 김치국물, 고춧가루, 참치캔을 넣어 중불에서 약 5분간 끓여주세요.'),
          RecipeModel(
              imageUrl: 'asset/img/cook/0/recipe/3.jpg',
              description: '대파와 청양고추, 두부를 넣고 한소끔 더 끓여주세요.'),
          RecipeModel(
              imageUrl: 'asset/img/cook/0/recipe/4.jpg',
              description: '따뜻할 때 밥과 함께 즐겨주세요.'),
        ],
        preferProducts: products,
        cookState: CookState.lunch,
      ),
      CookModel(
        id: DataUtils.getUuid(),
        mainImageUrl: 'asset/img/cook/1/main.jpg',
        name: '고소하고 아삭아삭한 양배추 샐러드',
        description:
            '채 썬 양배추를 고소한 참깨 드레싱과 조물조물 버무리면 초간단하게 완성되는 양배추 샐러드! 향긋한 깻잎과 달큰한 양파, 당근을 더해 식감과 맛은 물론 요리의 색까지 더욱 살렸어요. 건강한 샐러드라 그냥 먹어도 좋지만 고기 먹을 때 사이드 메뉴로 함께 즐겨도 좋답니다!',
        ingredient: [
          IngredientModel(title: '양배추', description: '1/4개'),
          IngredientModel(title: '적양배추', description: '1/4개'),
          IngredientModel(title: '적양파', description: '1/2개'),
          IngredientModel(title: '당근', description: '1/4개'),
          IngredientModel(title: '다진 아몬드', description: '한 줌'),
          IngredientModel(title: '다진 파슬리', description: '약간'),
          IngredientModel(title: '통깨', description: '3큰술'),
          IngredientModel(title: '유자청', description: '1큰술'),
          IngredientModel(title: '간장', description: '1큰술'),
          IngredientModel(title: '올리고당', description: '1큰술'),
          IngredientModel(title: '식초', description: '1큰술'),
          IngredientModel(title: '후춧가루', description: '약간'),
        ],
        ingredientImageUrl: 'asset/img/cook/1/ingredient.jpg',
        recipe: [
          RecipeModel(
              imageUrl: 'asset/img/cook/1/recipe/0.jpg',
              description:
                  '양배추, 적양배추, 적양파, 당근은 모두 채 썰어 주세요. 아몬드는 적당히 다져주세요.\n(tip. 아몬드 대신 호두, 땅콩 등 다른 견과류를 사용해도 좋아요)'),
          RecipeModel(
              imageUrl: 'asset/img/cook/1/recipe/1.jpg',
              description: '볼에 드레싱 재료를 모두 넣고 섞어 주세요. 통깨는 부순 후 사용해 주세요.'),
          RecipeModel(
              imageUrl: 'asset/img/cook/1/recipe/2.jpg',
              description: '채 썬 재료에 드레싱을 붓고 섞은 후 아몬드와 파슬리를  넣어 가볍게 버무려 주세요.'),
          RecipeModel(
              imageUrl: 'asset/img/cook/1/recipe/3.jpg',
              description: '접시에 양배추 샐러드를 담아 맛있게 즐겨 주세요.'),
        ],
        preferProducts: products,
        cookState: CookState.breakfast,
      ),
      CookModel(
        id: DataUtils.getUuid(),
        mainImageUrl: 'asset/img/cook/2/main.jpg',
        name: '완전 쉽고 간단한 나폴리탄 스파게티',
        description:
            '새콤달콤한 케첩 맛이 매력적인 나폴리탄 스파게티! 막상 만들려고 하면 소스 배합이 어렵게 느껴지는데요. 딱 4가지 재료만 있으면 완전 쉽고 간단하게 나폴리탄 스파게티 소스를 만들 수 있답니다. 간장, 우유, 케첩, 설탕 단 4가지 재료로 빠르게 뚝딱 만들어 보세요. 누구든 100% 만족할 맛을 선사할 거예요.',
        ingredient: [
          IngredientModel(title: '스파게티 면', description: '200g'),
          IngredientModel(title: '양파', description: '1/2개'),
          IngredientModel(title: '피망', description: '1/2개'),
          IngredientModel(title: '소시지', description: '100g'),
          IngredientModel(title: '올리브오일', description: '1큰술'),
          IngredientModel(title: '소금', description: '1큰술'),
          IngredientModel(title: '후춧가루', description: '약간'),
          IngredientModel(title: '파마산 치즈 가루(생략 가능)', description: '약간'),
          IngredientModel(title: '다진 파슬리(생략 가능)', description: '약간'),
          IngredientModel(title: '간장', description: '1큰술'),
          IngredientModel(title: '우유', description: '1/2컵'),
          IngredientModel(title: '케첩', description: '150g'),
          IngredientModel(title: '설탕', description: '1작은술'),
        ],
        ingredientImageUrl: 'asset/img/cook/2/ingredient.jpg',
        recipe: [
          RecipeModel(
              imageUrl: 'asset/img/cook/2/recipe/0.jpg',
              description: '끓는 물에 소금 1큰술과 스파게티 면을 넣고 8~9분 정도 삶아주세요. '),
          RecipeModel(
              imageUrl: 'asset/img/cook/2/recipe/1.jpg',
              description: '양파와 피망은 채썰고 소시지는 어슷 썰어주세요. '),
          RecipeModel(
              imageUrl: 'asset/img/cook/2/recipe/2.jpg',
              description:
                  '달군 팬에 오일을 두른 후 소시지를 넣고 볶다가 양파와 피망을 넣고 볶아주세요. 볶은 재료를 덜어내 주세요.'),
          RecipeModel(
              imageUrl: 'asset/img/cook/2/recipe/3.jpg',
              description: '팬에 소스 재료를 넣고 중불에서 저어가며 살짝 끓여주세요. '),
          RecipeModel(
              imageUrl: 'asset/img/cook/2/recipe/4.jpg',
              description: '소스가 졸아들면 볶아둔 채소와 면을 넣고 잘 섞어주세요. '),
          RecipeModel(
              imageUrl: 'asset/img/cook/2/recipe/5.jpg',
              description:
                  '완성된 나폴리탄 스파게티를 접시에 담은 후 파마산 치즈 가루와 파슬리 가루를 뿌린 후 맛있게 즐겨주세요. '),
        ],
        preferProducts: products,
        cookState: CookState.lunch,
      ),
      CookModel(
        id: DataUtils.getUuid(),
        mainImageUrl: 'asset/img/cook/3/main.jpg',
        name: '고소하고 달짝지근한 호두마늘볶음',
        description:
            '달콤하고 짭조름한 소스에 호두와 마늘을 볶아 내면 자꾸만 손이 가는 반찬이 뚝딱 만들어져요. 뇌 건강에 좋은 호두와 항암 효과가 탁월한 마늘이 들어간 건강 반찬인데요. 노릇하게 구워 그윽한 풍미가 더해진 마늘과 고소한 호두가 조화롭게 어울려요. 아작아작 씹히는 호두와 부드러운 마늘의 식감 또한 먹는 재미를 배로 올려 준답니다!',
        ingredient: [
          IngredientModel(title: '깐 마늘', description: '1컵(100g)'),
          IngredientModel(title: '호두', description: '2컵(185g)'),
          IngredientModel(title: '매실청', description: '1큰술'),
          IngredientModel(title: '꿀', description: '1큰술'),
          IngredientModel(title: '간장', description: '1큰술'),
          IngredientModel(title: '식용유', description: '적당량'),
          IngredientModel(title: '통깨', description: '적당량'),
        ],
        ingredientImageUrl: 'asset/img/cook/3/ingredient.jpg',
        recipe: [
          RecipeModel(
              imageUrl: 'asset/img/cook/3/recipe/0.jpg',
              description: '달군 팬에 기름을 두른 후 깐 마늘을 넣어 약한 불에서 노릇노릇하게 볶아주세요.'),
          RecipeModel(
              imageUrl: 'asset/img/cook/3/recipe/1.jpg',
              description:
                  '마늘이 노릇노릇하게 익으면 매실청을 넣어주세요.\n(tip. 매실청을 넣으면 마늘의 아린 맛이 제거돼요) '),
          RecipeModel(
              imageUrl: 'asset/img/cook/3/recipe/2.jpg',
              description: '호두를 넣고 볶다가 불을 꺼주세요.'),
          RecipeModel(
              imageUrl: 'asset/img/cook/3/recipe/3.jpg',
              description: '간장과 꿀을 넣고 빠르게 섞어주세요. '),
          RecipeModel(
              imageUrl: 'asset/img/cook/3/recipe/4.jpg',
              description: '통깨를 뿌려 한 번 더 섞어 완성해 주세요.'),
        ],
        preferProducts: products,
        cookState: CookState.lunch,
      ),
      CookModel(
        id: DataUtils.getUuid(),
        mainImageUrl: 'asset/img/cook/4/main.jpg',
        name: '연근이 이렇게 부드럽다니? 연근 너겟',
        description:
            '곱게 갈아 한껏 부드러워진 연근을 반죽해 바삭하게 튀겨낸 연근 너겟! 바삭한 튀김옷 속에 으깬 감자만큼이나 부드러운 연근의 식감을 느낄 수 있답니다. 토마토를 넣어 상큼하게 만든 소스에 찍어 먹으면 지금까지와는 전혀 다른 연근의 매력에 푹 빠지게 될 거예요!',
        ingredient: [
          IngredientModel(title: '연근', description: '150g'),
          IngredientModel(title: '부침가루', description: '2큰술'),
          IngredientModel(title: '식용유', description: '1컵'),
          IngredientModel(title: '마늘', description: '1툴'),
          IngredientModel(title: '소금', description: '약간'),
          IngredientModel(title: '완숙 토마토', description: '1개'),
          IngredientModel(title: '씨겨자', description: '1/2큰술'),
          IngredientModel(title: '올리고당', description: '1큰술'),
          IngredientModel(title: '후춧가루', description: '약간'),
        ],
        ingredientImageUrl: 'asset/img/cook/4/ingredient.jpg',
        recipe: [
          RecipeModel(
              imageUrl: 'asset/img/cook/4/recipe/0.jpg',
              description:
                  '연근은 껍질을 벗겨주세요. 적당한 크기로 깍뚝 썰어 통마늘 1알과 같이 갈아주세요.\n(tip. 짧게 끊어서 갈아 주세요. 너무 곱게 가는 것보다 식감이 있도록 다지는 것이 좋아요)'),
          RecipeModel(
              imageUrl: 'asset/img/cook/4/recipe/1.jpg',
              description: '갈아둔 연근에 소금, 부침가루를 넣고 섞어주세요. '),
          RecipeModel(
              imageUrl: 'asset/img/cook/4/recipe/2.jpg',
              description: '작은 냄비에 식용유를 붓고 170도로 달궈주세요.'),
          RecipeModel(
              imageUrl: 'asset/img/cook/4/recipe/3.jpg',
              description: '연근 반죽을 숟가락으로 떠서 넣고 3~4분간 노릇하게 튀겨주세요. '),
          RecipeModel(
              imageUrl: 'asset/img/cook/4/recipe/4.jpg',
              description: '튀긴 연근 너겟은 채반에 건져 기름을 빼주세요. '),
          RecipeModel(
              imageUrl: 'asset/img/cook/4/recipe/5.jpg',
              description: '믹서에 완숙 토마토를 넣고 곱게 갈아주세요.'),
          RecipeModel(
              imageUrl: 'asset/img/cook/4/recipe/6.jpg',
              description:
                  '믹서에 간 토마토와 나머지 소스 재료를 팬에 넣고 1~2분 정도 저어가며 볶아 수분을 날려주세요.'),
          RecipeModel(
              imageUrl: 'asset/img/cook/4/recipe/7.jpg',
              description:
                  '튀겨둔 연근 너겟과 소스를 접시에 담아 맛있게 즐겨주세요.\n(tip. 튀겨둔 연근 너겟은 먹기 전 30초 정도 더 튀겨주면 더욱 바삭한 식감을 즐길 수 있어요) '),
        ],
        preferProducts: products,
        cookState: CookState.lunch,
      ),
      CookModel(
        id: DataUtils.getUuid(),
        mainImageUrl: 'asset/img/cook/5/main.jpg',
        name: '봄내음 물씬 냉이 파스타',
        description:
            '봄의 전령사 냉이를 색다르게 즐기고 싶다면 파스타로 만들어 보세요. 냉이의 향긋한 향과 올리브오일이 어우러져 고급스러운 맛이 난답니다. 냉이 파스타의 감칠맛을 살려주는 건 바로 멸치액젓! 엔초비를 넣은 것처럼 깊은 감칠맛이 난답니다.',
        ingredient: [
          IngredientModel(title: '냉이', description: '200g'),
          IngredientModel(title: '파스타 면', description: '2인분(180g)'),
          IngredientModel(title: '올리브오일', description: '5큰술'),
          IngredientModel(title: '멸치액젓', description: '1큰술'),
          IngredientModel(title: '마늘', description: '5알'),
          IngredientModel(title: '페퍼론치노', description: '2개'),
          IngredientModel(title: '소금', description: '약간'),
          IngredientModel(title: '후춧가루', description: '약간'),
          IngredientModel(title: '파마산 치즈', description: '약간'),
        ],
        ingredientImageUrl: 'asset/img/cook/5/ingredient.jpg',
        recipe: [
          RecipeModel(
              imageUrl: 'asset/img/cook/5/recipe/0.jpg',
              description: '끓는 물에 소금 1큰술과 파스타 면을 넣고 8분 정도 삶아주세요. '),
          RecipeModel(
              imageUrl: 'asset/img/cook/5/recipe/1.jpg',
              description: '냉이는 뿌리의 흙을 칼로 긁어내고 흐르는 물에 깨끗이 씻어주세요. '),
          RecipeModel(
              imageUrl: 'asset/img/cook/5/recipe/2.jpg',
              description: '냉이와 마늘을 굵게 다져주세요. '),
          RecipeModel(
              imageUrl: 'asset/img/cook/5/recipe/3.jpg',
              description:
                  '달군 팬에 올리브오일과 굵게 다진 마늘을 넣고 볶다가 페퍼론치노를 부숴 넣어 볶아주세요. '),
          RecipeModel(
              imageUrl: 'asset/img/cook/5/recipe/4.jpg',
              description:
                  '냉이와 멸치액젓을 넣고 볶다가 면과 면수 2국자를 넣고 끓이다가 물과 기름이 잘 섞이도록 섞어가며 볶아주세요. '),
          RecipeModel(
              imageUrl: 'asset/img/cook/5/recipe/5.jpg',
              description: '완성된 냉이 파스타를 접시에 담고 파마산 치즈를 뿌려 맛있게 즐겨주세요. '),
        ],
        preferProducts: products,
        cookState: CookState.dinner,
      ),
      CookModel(
        id: DataUtils.getUuid(),
        mainImageUrl: 'asset/img/cook/6/main.jpg',
        name: '고소한 맛이 일품인 새우전',
        description:
            '명절에 새우전이 빠지면 섭섭하죠. 가족들이 모두 모인 자리에 새우전 하나쯤은 꼭 있어야 그 명절 느낌이 제대로 나는 것 같아요. 새우를 반죽에 입혀서 얇고 바삭하게 부쳐낸 새우전은 누구나 좋아하는 명절 음식이랍니다! 이번 명절에는 집에서 직접 새우전을 만들어 보세요! 새우의 달콤한 맛과 바삭한 식감이 입안 가득 퍼지면서, 가족들과의 시간이 더 행복해질 거예요. 간단하면서도 정성이 가득 담긴 새우전으로 올해 명절을 더 특별하게 만들어 보세요.',
        ingredient: [
          IngredientModel(title: '대하', description: '20마리'),
          IngredientModel(title: '무', description: '1토막'),
          IngredientModel(title: '달걀', description: '2개'),
          IngredientModel(title: '다진 청, 홍고추', description: '약간'),
          IngredientModel(title: '밀가루', description: '1컵'),
          IngredientModel(title: '소금', description: '1작은술'),
          IngredientModel(title: '식용유', description: '1/2컵'),
        ],
        ingredientImageUrl: 'asset/img/cook/6/ingredient.jpg',
        recipe: [
          RecipeModel(
              imageUrl: 'asset/img/cook/6/recipe/0.jpg',
              description:
                  '새우는 머리를 제거하고 껍질은 벗긴 후 내장을 제거하고 칼로 굽은 등에 칼집을 넣어 일자로 펴주세요. 새우 꼬리의 물총을 가위로 잘라주세요. '),
          RecipeModel(
              imageUrl: 'asset/img/cook/6/recipe/1.jpg',
              description: '무는 반으로 잘라 0.5cm 두께로 얇게 편썰고 소금을 고루 뿌려 10분간 두세요. '),
          RecipeModel(
              imageUrl: 'asset/img/cook/6/recipe/2.jpg',
              description: '새우와 무에 밀가루를 얇게 묻힌 후 달걀물을 묻혀주세요. '),
          RecipeModel(
              imageUrl: 'asset/img/cook/6/recipe/3.jpg',
              description: '달군 팬에 식용유를 두르고 무를 올린 후 무 위에 새우를 얹어주세요. '),
          RecipeModel(
              imageUrl: 'asset/img/cook/6/recipe/4.jpg',
              description: '다진 청홍고추를 새우위에 얹은 후 뒤집어 약한 불에서 2분 정도 더 구워주세요. '),
          RecipeModel(
              imageUrl: 'asset/img/cook/6/recipe/5.jpg',
              description: '완성된 새우전을 접시에 담아 맛있게즐겨주세요. '),
        ],
        preferProducts: products,
        cookState: CookState.dinner,
      ),
      CookModel(
        id: DataUtils.getUuid(),
        mainImageUrl: 'asset/img/cook/7/main.jpg',
        name: '완벽한 풍미 스테이크 솥밥',
        description:
            '세상에 정말 수많은 솥밥이 있지만 그중에서도 가장 완벽에 가까운 풍미를 가진 스테이크 솥밥 레시피 알려 드릴게요. 마늘과 채끝살을 구워낸 기름을 불린 쌀과 함께 볶아 밥을 하는 게 포인트예요. 잠깐의 과정이 요리에 놀라운 풍미를 더해 준답니다. 게다가 노릇하게 튀겨낸 마늘을 더해 식감과 맛을 더욱 더 극대화 시킬 수 있어요. 사소해 보이지만 이런 포인트 과정들이 요리에 엄청난 풍미를 더한다는 사실! 나가서 사 먹는 것보다 훨씬 더 맛있을 거예요.',
        ingredient: [
          IngredientModel(title: '채끝살', description: '300g'),
          IngredientModel(title: '쌀', description: '2컵'),
          IngredientModel(title: '물', description: '2컵'),
          IngredientModel(title: '간장', description: '3큰술'),
          IngredientModel(title: '올리브오일', description: '1큰술'),
          IngredientModel(title: '달걀 노른자', description: '1개'),
          IngredientModel(title: '통마늘', description: '10개'),
          IngredientModel(title: '쪽파', description: '4대'),
          IngredientModel(title: '통깨', description: '약간'),
          IngredientModel(title: '후춧가루', description: '약간'),
          IngredientModel(title: '소금', description: '1작은술'),
        ],
        ingredientImageUrl: 'asset/img/cook/6/ingredient.jpg',
        recipe: [
          RecipeModel(
              imageUrl: 'asset/img/cook/7/recipe/0.jpg',
              description: '쌀은 씻어 30분간 불려주세요. 쪽파는 송송 썰어주세요. '),
          RecipeModel(
              imageUrl: 'asset/img/cook/7/recipe/1.jpg',
              description: '채끝살은 사방 2cm 길이로 썰고 소금, 후춧가루, 올리브오일로 밑간해 주세요. '),
          RecipeModel(
              imageUrl: 'asset/img/cook/7/recipe/2.jpg',
              description: '팬에 기름을 두른 후 통마늘을 넣고 중약불에서 튀기듯 구워주세요. '),
          RecipeModel(
              imageUrl: 'asset/img/cook/7/recipe/3.jpg',
              description: '마늘을 덜어 낸 후, 손질한 채끝살을 넣고 노릇하게 튀기듯 구워주세요. '),
          RecipeModel(
              imageUrl: 'asset/img/cook/7/recipe/4.jpg',
              description:
                  '냄비에 마늘과 채끝살을 구워낸 기름을 3~4큰술 넣고 불린 쌀을 넣어 1분간 볶아주세요.  '),
          RecipeModel(
              imageUrl: 'asset/img/cook/7/recipe/5.jpg',
              description:
                  '볶은 쌀에 물과 쯔유를 넣고 센 불로 3분간 저어가며 끓이다가 뚜껑을 덮어 중약불에서 15분간 익혀주세요. '),
          RecipeModel(
              imageUrl: 'asset/img/cook/7/recipe/6.jpg',
              description:
                  '완성된 밥에 쪽파를 뿌리고 채끝살과 마늘을 보기 좋게 담고 뚜껑을 닫아 10분간 뜸을 들여주세요. '),
          RecipeModel(
              imageUrl: 'asset/img/cook/7/recipe/7.jpg',
              description: '완성된 솥밥에 쪽파, 노른자, 통깨, 참기름을 뿌려 맛있게 즐겨주세요. '),
        ],
        preferProducts: products,
        cookState: CookState.dinner,
      ),
      CookModel(
        id: DataUtils.getUuid(),
        mainImageUrl: 'asset/img/cook/8/main.jpg',
        name: '종부의 손맛 집장',
        description:
            '퇴계 이황이 나고 자란 안동 노송정. 이 종택의 18대 종부인 최정숙 씨는 40여년 동안 종가 음식의 전통을 이어가고 있는데요. 집장은 종가에서 자주 해 먹던 여름 별미 중 하나예요. 여러 재료를 모아(集) 만든 장(醬)이란 뜻이죠. 여름에 쑨 메주로 가루를 낸 다음 무, 가지 등 각종 채소와 함께 섞은 후 발효시켜 주는데요. 시간과 노력이 많은 드는 만큼 맛 또한 특별합니다. 깊고 구수한 감칠맛 속에 말린 채소의 꼬들꼬들한 식감까지 느껴지는 건강식이에요. 최정숙 종부의 정성 가득한 집장 레시피 꼭 한번 따라해 보세요!',
        ingredient: [
          IngredientModel(title: '무', description: '1/2개'),
          IngredientModel(title: '가지', description: '2개'),
          IngredientModel(title: '새송이버섯', description: '2개'),
          IngredientModel(title: '청양고추', description: '5개'),
          IngredientModel(title: '다시마(사방 3*3cm)', description: '1컵'),
          IngredientModel(title: '엿기름', description: '500g'),
          IngredientModel(title: '물', description: '5L'),
          IngredientModel(title: '찹쌀가루', description: '2컵'),
          IngredientModel(title: '마 가루', description: '1컵'),
          IngredientModel(title: '메줏가루', description: '2컵'),
          IngredientModel(title: '진미채', description: '두 줌'),
          IngredientModel(title: '액젓', description: '4큰술'),
        ],
        ingredientImageUrl: 'asset/img/cook/8/ingredient.jpg',
        recipe: [
          RecipeModel(
              imageUrl: 'asset/img/cook/8/recipe/0.jpg',
              description:
                  '무와 가지, 새송이버섯은 먹기 좋은 크기로 나박하게 자른 후 말려서 소금에 절여주세요. 청양고추는 송송 썰어주세요.\n(tip. 가지, 무, 새송이버섯은 말려서 사용해야 더욱 꼬들꼬들한 식감으로 먹을 수 있어요)'),
          RecipeModel(
              imageUrl: 'asset/img/cook/8/recipe/1.jpg',
              description:
                  '졸여 둔 찹쌀풀에 마 가루, 메줏가루를 넣고 섞어주세요.\n(tip. 엿기름을 물에 담가둔 후 꽉 짜서 건져내고, 찹쌀가루를 넣고 섞어주세요. 3~4시간 정도 삭힌 후 걸쭉하게 될 때까지 졸여 미리 밑준비를 해 주세요. 물의 양이 5L에서 3L 정도 될 때까지 졸여주세요)'),
          RecipeModel(
              imageUrl: 'asset/img/cook/8/recipe/2.jpg',
              description:
                  '진미채와 다시마, 물기를 꽉 짠 무, 새송이버섯, 가지를 넣어 섞어주세요. 마지막에 액젓을 넣어 간을 해주세요.\n(tip. 진미채와 액젓을 넣으면 감칠맛이 더해져요)\n(tip. 채소는 계절에 따라 추가로 넣거나 달라질 수 있어요)'),
          RecipeModel(
              imageUrl: 'asset/img/cook/8/recipe/3.jpg',
              description:
                  '전기밥솥에 넣고 보온으로 30시간 정도 발효 시켜주세요. 중간중간 2~3번 정도 섞어주세요.'),
          RecipeModel(
              imageUrl: 'asset/img/cook/8/recipe/4.jpg',
              description:
                  '발효가 끝난 집장은 취사를 눌러 걸쭉한 농도로 만들어주세요. 한 김 식힌 후 보관용기에 담아 냉장 보관해주세요.'),
        ],
        preferProducts: products,
        cookState: CookState.dinner,
      ),
      CookModel(
        id: DataUtils.getUuid(),
        mainImageUrl: 'asset/img/cook/9/main.jpg',
        name: '싱그러움 가득 시금치 샐러드',
        description:
            '식이섬유, 철분, 비타민 등 영양소가 각종 영양소가 풍부한 시금치! 조물조물 무쳐 먹어도 맛있지만 샐러드로 만들면 싱그러움을 가득 느낄 수 있어요. 연한 시금치 어린잎을 사용해 부드러운 식감을 살리는 게 포인트! 식탁 위에 싱그러운 한 접시를 올려 보세요.',
        ingredient: [
          IngredientModel(title: '시금치 어린잎', description: '100g'),
          IngredientModel(title: '파마산 치즈 블럭', description: '50g'),
          IngredientModel(title: '견과류', description: '약간'),
          IngredientModel(title: '올리브', description: '약간'),
          IngredientModel(title: '올리브오일', description: '4큰술'),
          IngredientModel(title: '화이트발사믹', description: '2큰술'),
          IngredientModel(title: '레몬즙', description: '2큰술'),
          IngredientModel(title: '소금', description: '1/2큰술'),
          IngredientModel(title: '후춧가루', description: '약간'),
        ],
        ingredientImageUrl: 'asset/img/cook/9/ingredient.jpg',
        recipe: [
          RecipeModel(
              imageUrl: 'asset/img/cook/9/recipe/0.jpg',
              description: '시금치 잎은 찬물에 가볍게 씻어 채반에서 물기를 빼주세요.'),
          RecipeModel(
              imageUrl: 'asset/img/cook/9/recipe/1.jpg',
              description: '볼에 시금치를 넣고 드레싱 재료를 넣은 후 가볍게 섞어주세요. '),
          RecipeModel(
              imageUrl: 'asset/img/cook/9/recipe/2.jpg',
              description:
                  '샐러드를 접시에 담고 견과류, 올리브, 파마산 치즈를 그레이터로 얇게 슬라이스해 뿌려주세요. '),
        ],
        preferProducts: products,
        cookState: CookState.breakfast,
      ),
      CookModel(
        id: DataUtils.getUuid(),
        mainImageUrl: 'asset/img/cook/10/main.jpg',
        name: '미역 들깨죽',
        description:
            '고소한 맛이 일품인 미역 들깨죽! 미역과 간단한 재료들만 있으면 뚝딱 만들 수 있답니다. 아플 때 간단하게 만들어 먹기도 좋고, 한 끼 대용으로도 아주 좋아요. *본 레시피는 우리의식탁과 LG ThinQ Taste가 공동으로 개발한 LG 인덕션 전용 레시피입니다.',
        ingredient: [
          IngredientModel(title: '즉석밥', description: '1개'),
          IngredientModel(title: '자른 건미역', description: '5g'),
          IngredientModel(title: '멸치육수', description: '6컵'),
          IngredientModel(title: '건표고', description: '3개(10g)'),
          IngredientModel(title: '들깨가루', description: '2큰술'),
          IngredientModel(title: '참기름', description: '1큰술'),
        ],
        ingredientImageUrl: 'asset/img/cook/10/ingredient.jpg',
        recipe: [
          RecipeModel(
              imageUrl: 'asset/img/cook/10/recipe/0.jpg',
              description: '건미역과 건표고는 30분 정도 불려주세요. '),
          RecipeModel(
              imageUrl: 'asset/img/cook/10/recipe/1.jpg',
              description: '표고는 얇게 채를 썰어주세요. 미역은 물기를 꽉 짜주세요. '),
          RecipeModel(
              imageUrl: 'asset/img/cook/10/recipe/2.jpg',
              description: '냄비에 참기름을 두르고 5단에서 미역을 넣고 1분간 볶아주세요. '),
          RecipeModel(
              imageUrl: 'asset/img/cook/10/recipe/3.jpg',
              description: '햇반과 물을 넣고 5단에서 15분간 끓여주세요.'),
          RecipeModel(
              imageUrl: 'asset/img/cook/10/recipe/4.jpg',
              description: '들깨가루를 넣고 소금으로 간을 해 주세요. '),
          RecipeModel(
              imageUrl: 'asset/img/cook/10/recipe/5.jpg',
              description: '완성된 들깨미역죽을 그릇에 담아 맛있게 즐겨주세요. '),
        ],
        preferProducts: products,
        cookState: CookState.breakfast,
      ),
      CookModel(
        id: DataUtils.getUuid(),
        mainImageUrl: 'asset/img/cook/11/main.jpg',
        name: '고급스러운 비주얼 티본 스테이크',
        description:
            '고급스러운 비주얼로 모든 이의 시선을 사로잡는 티본 스테이크! T자 모양의 뼈를 가운데로 두고 고소한 등심과 세상 부드러운 안심 두 부위를 모두 즐길 수 있는데요. 수비드 기계가 따로 없어도 밥솥을 이용하면 속까지 빠르고 촉촉하게 익힐 수 있답니다! 크리스마스와 연말 홈파티 요리로 이만한 게 없을 거예요.',
        ingredient: [
          IngredientModel(title: '티본 스테이크', description: '1kg(두께 5cm)'),
          IngredientModel(title: '허브솔트', description: '1작은술'),
          IngredientModel(title: '올리브오일', description: '5큰술'),
          IngredientModel(title: '(가염)버터', description: '3큰술'),
          IngredientModel(title: '로즈마리', description: '2줄기'),
        ],
        ingredientImageUrl: 'asset/img/cook/11/ingredient.jpg',
        recipe: [
          RecipeModel(
              imageUrl: 'asset/img/cook/11/recipe/0.jpg',
              description: '고기는 상온에 1시간 정도 두어 냉기를 빼고 키친타월로 핏물을 닦아주세요. '),
          RecipeModel(
              imageUrl: 'asset/img/cook/11/recipe/1.jpg',
              description:
                  '뼈를 따라 살을 분리한 후 허브솔트와 오일을 뿌려 마리네이드 한 후 지퍼팩에 밀봉해주세요. '),
          RecipeModel(
              imageUrl: 'asset/img/cook/11/recipe/2.jpg',
              description:
                  '밀봉한 스테이크를 밥솥에 넣고 60도로 맞춘 따뜻한 물을 넣고 보온 모드에서 1시간 두세요.\n(tip. 3cm 이상 두께의 고기는 수비드로 먼저 온도를 높이면 빠르게 속까지 익힐 수 있어요. 수비드 기계가 없다면 밥솥의 보온모드를 활용해도 좋아요) '),
          RecipeModel(
              imageUrl: 'asset/img/cook/11/recipe/3.jpg',
              description:
                  '팬을 달군 후 뼈와 수비드한 고기를 올려 구워주세요. 고기는 강불로 한면당 2분씩 총 8분간 구워주세요.\n(tip. 안심이 채끝에 비해 크기가 작기 때문에 안심은 2~3분 덜 구워주세요)'),
          RecipeModel(
              imageUrl: 'asset/img/cook/11/recipe/4.jpg',
              description: '중불로 낮춰 버터와 허브를 넣고 고기에 버터를 끼얹어가며 1~2분 더 구워주세요.'),
          RecipeModel(
              imageUrl: 'asset/img/cook/11/recipe/5.jpg',
              description: '불을 끄고 포일로 감싸 10분 정도 레스팅 해주세요. '),
          RecipeModel(
              imageUrl: 'asset/img/cook/11/recipe/6.jpg',
              description: '스테이크를 먹기 좋게 썰고 뼈와 함께 접시에 플레이팅 해주세요. '),
        ],
        preferProducts: products,
        cookState: CookState.breakfast,
      ),
      CookModel(
        id: DataUtils.getUuid(),
        mainImageUrl: 'asset/img/cook/12/main.jpg',
        name: '뽀얀 속살 갈치구이',
        description:
            '노릇하게 구워낸 갈치는 남녀노소 누구나 좋아하는 밥 반찬이죠. 갓 지은 쌀밥 위에 뽀얀 속살 자랑하는 갈치구이 한 점을 딱 올려 먹으면 그것만으로도 충분한 한 끼가 돼요. 겉은 바삭하고 속은 촉촉한 갈치구이로 완벽한 한 끼를 만들어 보세요!',
        ingredient: [
          IngredientModel(title: '손질 갈치', description: '3토막'),
          IngredientModel(title: '부침가루', description: '1/2컵'),
          IngredientModel(title: '소금', description: '약간'),
          IngredientModel(title: '식용유', description: '적당량'),
        ],
        ingredientImageUrl: 'asset/img/cook/12/ingredient.jpg',
        recipe: [
          RecipeModel(
              imageUrl: 'asset/img/cook/12/recipe/0.jpg',
              description: '키친타월로 갈치의 물기를 제거해주세요.'),
          RecipeModel(
              imageUrl: 'asset/img/cook/12/recipe/1.jpg',
              description:
                  '갈치에 칼집을 넣어주세요.\n(tip. 갈치 양쪽 가장자리에 칼집을 내면 살을 발라내기 쉬워요)'),
          RecipeModel(
              imageUrl: 'asset/img/cook/12/recipe/2.jpg',
              description: '소금을 뿌려 간을 해주세요.'),
          RecipeModel(
              imageUrl: 'asset/img/cook/12/recipe/3.jpg',
              description: '앞뒤로 부침가루를 묻혀주세요.'),
          RecipeModel(
              imageUrl: 'asset/img/cook/12/recipe/4.jpg',
              description: '달군 팬에 식용유를 넉넉히 두르고 중불에서 속까지 잘 익도록 앞뒤로 노릇하게 구워주세요.'),
          RecipeModel(
              imageUrl: 'asset/img/cook/12/recipe/5.jpg',
              description: '살만 발라 밥과 함께 맛있게 즐겨주세요.'),
        ],
        preferProducts: products,
        cookState: CookState.breakfast,
      ),
      CookModel(
        id: DataUtils.getUuid(),
        mainImageUrl: 'asset/img/cook/13/main.jpg',
        name: '촉촉하고 쫄깃한 서대감자조림',
        description:
            '반건조 서대는 촉촉하고 쫄깃한 식감이 매력적인데요. 서대와 감자를 듬뿍 넣은 후 칼칼한 양념과 함께 조려내면 밥 두 공기는 뚝딱 해치울 수 있는 밥 반찬이 만들어져요. 별미로 즐겨 보세요!',
        ingredient: [
          IngredientModel(title: '반건조 서대', description: '3마리'),
          IngredientModel(title: '감자', description: '2개'),
          IngredientModel(title: '양파', description: '1/2개'),
          IngredientModel(title: '대파', description: '1/2대'),
          IngredientModel(title: '청홍고추', description: '1개씩'),
          IngredientModel(title: '멸치다시마육수', description: '2컵'),
          IngredientModel(title: '식용유', description: '약간'),
          IngredientModel(title: '간장', description: '3큰술'),
          IngredientModel(title: '고춧가루', description: '3큰술'),
          IngredientModel(title: '고추장', description: '1큰술'),
          IngredientModel(title: '맛술', description: '2큰술'),
          IngredientModel(title: '설탕', description: '1/2큰술'),
          IngredientModel(title: '다진 마늘', description: '1큰술'),
          IngredientModel(title: '매실청', description: '1큰술'),
          IngredientModel(title: '후춧가루', description: '약간'),
        ],
        ingredientImageUrl: 'asset/img/cook/13/ingredient.jpg',
        recipe: [
          RecipeModel(
              imageUrl: 'asset/img/cook/13/recipe/0.jpg',
              description: '깨끗이 씻은 서대의 꼬리를 제거한 후 3등분으로 잘라주세요.'),
          RecipeModel(
              imageUrl: 'asset/img/cook/13/recipe/1.jpg',
              description:
                  '감자는 껍질을 벗긴 후 1cm 두께로 두툼하게 썰고 대파, 청홍고추는 어슷썰고, 양파는 채를 썰어주세요.'),
          RecipeModel(
              imageUrl: 'asset/img/cook/13/recipe/2.jpg',
              description: '볼에 양념 재료를 넣어 섞어주세요. '),
          RecipeModel(
              imageUrl: 'asset/img/cook/13/recipe/3.jpg',
              description: '전골냄비에 감자를 깔고 서대를 올려주세요.'),
          RecipeModel(
              imageUrl: 'asset/img/cook/13/recipe/4.jpg',
              description: '양파, 대파, 청홍고추를 넣은 후 양념장과 육수를 넣어 끓여주세요. '),
          RecipeModel(
              imageUrl: 'asset/img/cook/13/recipe/5.jpg', description: '맛있게 즐겨주세요.'),
        ],
        preferProducts: products,
        cookState: CookState.lunch,
      ),
      CookModel(
        id: DataUtils.getUuid(),
        mainImageUrl: 'asset/img/cook/14/main.jpg',
        name: '미국식 클램차우더 수프',
        description:
            '클램 차우더는 조개와 감자, 각종 채소를 넣고 끓인 미국식 수프인데요. 조개 삶은 국물을 넣고 끓여 깊은 감칠맛이 나는 게 특징이에요. 걸쭉한 질감을 가져 빵이나 크래커와 함께 먹기 좋답니다!',
        ingredient: [
          IngredientModel(title: '모시조개', description: '600g'),
          IngredientModel(title: '베이컨', description: '4줄'),
          IngredientModel(title: '감자', description: '1개'),
          IngredientModel(title: '샐러리', description: '1줄기'),
          IngredientModel(title: '양파', description: '1/2개'),
          IngredientModel(title: '마늘', description: '1쪽'),
          IngredientModel(title: '버터', description: '2큰술'),
          IngredientModel(title: '밀가루', description: '2큰술'),
          IngredientModel(title: '우유', description: '2컵'),
          IngredientModel(title: '소금', description: '약간'),
          IngredientModel(title: '후춧가루', description: '약간'),
          IngredientModel(title: '파슬리 가루', description: '약간'),
          IngredientModel(title: '물', description: '1컵'),
          IngredientModel(title: '청주', description: '2큰술'),
          IngredientModel(title: '샐러리 줄기', description: '약간'),
          IngredientModel(title: '마늘', description: '2쪽'),
        ],
        ingredientImageUrl: 'asset/img/cook/14/ingredient.jpg',
        recipe: [
          RecipeModel(
              imageUrl: 'asset/img/cook/14/recipe/0.jpg',
              description:
                  '모시조개는 소금물에 담가 해감한 후 깨끗이 씻어 냄비에 담고 조개 삶은 국물 재료를 넣어 조개 껍데기가 벌어질 때까지 끓여주세요.'),
          RecipeModel(
              imageUrl: 'asset/img/cook/14/recipe/1.jpg',
              description: '조갯살은 발라내어 굵게 다지고 조개 삶은 육수는 따로 체에 걸러주세요.'),
          RecipeModel(
              imageUrl: 'asset/img/cook/14/recipe/2.jpg',
              description: '마늘은 편으로 자르고 베이컨과 감자, 샐러리, 양파는 사방 1cm 크기로 잘라주세요.'),
          RecipeModel(
              imageUrl: 'asset/img/cook/14/recipe/3.jpg',
              description:
                  '냄비에 버터를 넣어 녹이고 마늘, 베이컨, 감자, 샐러리, 양파를 2분 정도 볶다가 밀가루를 넣고 약불에서 재료와 밀가루가 고루 섞일 때까지 볶다가 조개 삶은 국물 1컵과 우유를 넣어 감자가 익을 때까지 10분 정도 끓여주세요.\n(tip. 중불에서 주걱으로 저어두면서 끓여주세요)'),
          RecipeModel(
              imageUrl: 'asset/img/cook/14/recipe/4.jpg',
              description:
                  '수프에 조갯살을 넣고 약간의 소금과 후추로 간을 한 후 2분 정도 끓인 후 그릇에 담고 파슬리 가루를 뿌려주세요.'),
        ],
        preferProducts: products,
        cookState: CookState.breakfast,
      ),
      CookModel(
        id: DataUtils.getUuid(),
        mainImageUrl: 'asset/img/cook/15/main.jpg',
        name: 'SNS에서 핫한 밥통 카레',
        description:
            '모든 재료를 밥솥에 넣고 간편하게 쪄 내기만 하면 되는 밥통 카레! 조리 과정이 초간단하고 설거짓거리도 확 줄어들어 SNS에서 핫한 요리인데요. 간편하고 든든한 한 끼로 아주 좋답니다!',
        ingredient: [
          IngredientModel(title: '양파', description: '1개'),
          IngredientModel(title: '완숙 토마토', description: '4개(500g)'),
          IngredientModel(title: '당근', description: '1개'),
          IngredientModel(title: '카레용 소고기', description: '250g'),
          IngredientModel(title: '고형 카레', description: '100g(큐브용 4개)'),
        ],
        ingredientImageUrl: 'asset/img/cook/15/ingredient.jpg',
        recipe: [
          RecipeModel(
              imageUrl: 'asset/img/cook/15/recipe/0.jpg',
              description:
                  '양파는 껍질을 벗긴 후 깨끗이 씻고, 토마토는 꼭지를 뗀 후 깨끗이 씻어주세요. 당근은 껍질을 벗긴 후 적당한 크기로 잘라주세요.'),
          RecipeModel(
              imageUrl: 'asset/img/cook/15/recipe/1.jpg',
              description: '밥솥에 모든 재료를 넣고 만능찜 모드로 조리해 주세요. (약 60분 소요)'),
          RecipeModel(
              imageUrl: 'asset/img/cook/15/recipe/2.jpg',
              description: '완성된 카레를 골고루 섞어주세요.'),
          RecipeModel(
              imageUrl: 'asset/img/cook/15/recipe/3.jpg',
              description:
                  '그릇에 밥을 담은 후 카레를 부어 맛있게 즐겨주세요.\n(tip. 기호에 따라 달걀후라이와 다진 파슬리 등을 뿌려주세요)'),
        ],
        preferProducts: products,
        cookState: CookState.dinner,
      ),
      CookModel(
        id: DataUtils.getUuid(),
        mainImageUrl: 'asset/img/cook/16/main.jpg',
        name: '소박하고 정겨운 감자솥밥',
        description:
            '포슬포슬한 햇감자로 만들어 먹으면 더 맛있는 감자솥밥 레시피 알려 드릴게요. 질 좋은 감자와 간단한 재료들만 있으면 누구든 쉽게 뚝딱 만들 수 있어요. 알맞게 익는 감자솥밥에 감칠맛 넘치는 양념장을 쓱쓱 비벼 주면 이 자체로 맛있는 한 그릇 요리가 완성된답니다!',
        ingredient: [
          IngredientModel(title: '쌀', description: '2컵'),
          IngredientModel(title: '물', description: '2컵'),
          IngredientModel(title: '감자', description: '2개'),
          IngredientModel(title: '다시마', description: '1장(6*6cm)'),
          IngredientModel(title: '간장', description: '3큰술'),
          IngredientModel(title: '맛술', description: '1큰술'),
          IngredientModel(title: '고춧가루', description: '1작은술'),
          IngredientModel(title: '다진 마늘', description: '1/2작은술'),
          IngredientModel(title: '참기름', description: '1큰술'),
          IngredientModel(title: '송송 썬 쪽파', description: '1큰술'),
          IngredientModel(title: '통깨', description: '약간'),
        ],
        ingredientImageUrl: 'asset/img/cook/16/ingredient.jpg',
        recipe: [
          RecipeModel(
              imageUrl: 'asset/img/cook/16/recipe/0.jpg',
              description: '감자는 껍질을 벗겨 먹기 좋은 크기로 잘라주세요. '),
          RecipeModel(
              imageUrl: 'asset/img/cook/16/recipe/1.jpg',
              description: '밥솥에 쌀과 물, 감자, 다시마를 넣어주세요. '),
          RecipeModel(
              imageUrl: 'asset/img/cook/16/recipe/2.jpg',
              description:
                  '뚜껑을 닫아 중불에서 끓이다가 밥물이 끓어오르면 약불로 줄여 10~15분 정도 익혀주세요. 불을 끄고 5분 정도 뜸을 들여주세요. 다시마는 건져내고 밥을 고루 섞어주세요. '),
          RecipeModel(
              imageUrl: 'asset/img/cook/16/recipe/3.jpg',
              description: '볼에 양념장 재료를 넣어 섞어주세요. 감자밥과 양념장을 섞어 맛있게 즐겨주세요.'),
        ],
        preferProducts: products,
        cookState: CookState.dinner,
      ),
      CookModel(
        id: DataUtils.getUuid(),
        mainImageUrl: 'asset/img/cook/17/main.jpg',
        name: '얼큰함에 끌리는 육칼만두전골',
        description:
            '이번주는 영하 기온이 예보되어 있는데요~ 추워지면 부쩍 국물요리들이 생각나죠? 그럴 때 냉장고 속 채소와 버섯을 더하고, 요리면을 활용하면 간단하고 쉽게 만두전골을 완성할 수 있답니다. 오늘 만두전골은 입소문이 자자한 <풀무원 육칼>을 활용해 만들었어요! 진한 국물과 쫄깃한 면발이 살아있어 다양한 곳에 활용하기 좋답니다.',
        ingredient: [
          IngredientModel(title: '요리면', description: '1봉'),
          IngredientModel(title: '만두', description: '6개'),
          IngredientModel(title: '배춧잎', description: '1/6통'),
          IngredientModel(title: '대파', description: '1/2대'),
          IngredientModel(title: '표고버섯', description: '2개'),
          IngredientModel(title: '느타리버섯', description: '한줌'),
          IngredientModel(title: '청양고추', description: '1개'),
          IngredientModel(title: '홍고추', description: '1개'),
          IngredientModel(title: '쑥갓', description: '약간'),
          IngredientModel(title: '사골국물', description: '4컵'),
          IngredientModel(title: '소금', description: '약간'),
        ],
        ingredientImageUrl: 'asset/img/cook/17/ingredient.jpg',
        recipe: [
          RecipeModel(
              imageUrl: 'asset/img/cook/17/recipe/0.jpg',
              description: '배추와 표고버섯, 느타리버섯은 먹기 좋게 자르고, 대파와 청양고추, 홍고추는 어슷하게 썰어주세요.'),
          RecipeModel(
              imageUrl: 'asset/img/cook/17/recipe/1.jpg',
              description: '냄비에 사골국물, 요리면, 스프를 넣고 끓여 육수를 만들어주세요. 요리면은 끓는물에 1분간만 삶아 체에 밭쳐주세요.\n(tip. 삶은 면을 사용하면 면이 육수를 많이 흡수하지 않아 쫄깃하게 즐길 수 있어요. 라면 스프를 사용하지 않으실 경우 고춧가루 2큰술, 국간장 1큰술, 다진마늘 1큰술, 굵은소금 1작은술, 후추 약간을 사골국물에 넣어 국물양념을 만들어 활용해주세요.)'),
          RecipeModel(
              imageUrl: 'asset/img/cook/17/recipe/2.jpg',
              description:
                  '전골냄비 바닥에 배추를 깔고, 만두를 돌려담은 후 한쪽에는 삶아놓은 면을 넣어주세요. 가운데에 표고버섯,느타리버섯,대파,고추,쑥갓을 담아주세요.'),
          RecipeModel(
              imageUrl: 'asset/img/cook/17/recipe/3.jpg',
              description: '전골냄비에 육수를 붓고, 만두가 익을 때까지 끓여주세요. '),
          RecipeModel(
              imageUrl: 'asset/img/cook/17/recipe/4.jpg',
              description: '따뜻할 때 맛있게 즐겨주세요.'),
        ],
        preferProducts: products,
        cookState: CookState.lunch,
      ),
    ];
  }
}
