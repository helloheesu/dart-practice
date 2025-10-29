import '../model/product.dart';
import '../model/product_category.dart';
import 'product_repository.dart';

class ProductRepositoryMock implements ProductRepository {
  static final List<Product> _products = <Product>[
    Product(
      id: 'sns-check',
      title: 'SNS 체크',
      subtitle: '친구의 친구까지 구경 완료',
      minutes: 45,
      category: ProductCategory.takeFive,
    ),
    Product(
      id: 'quick-nap',
      title: '잠깐 눈 붙이기',
      subtitle: '어 알람 안 울렸나?',
      minutes: 240,
      category: ProductCategory.takeFive,
    ),
    Product(
      id: 'namu-wiki-surf',
      title: '나무위키 서핑',
      subtitle: '아이돌 검색 → 소속사 대표 → 동문 졸업생 → 정치인',
      minutes: 45,
      category: ProductCategory.takeFive,
    ),
    Product(
      id: 'one-game',
      title: '게임 한 판',
      subtitle: '이기면 이겼으니까 한판 더, 지면 이길 때 까지 한 판 더',
      minutes: 240,
      category: ProductCategory.takeFive,
    ),
    Product(
      id: 'kakao-notification',
      title: '카톡 알림 확인',
      subtitle: '친구가 보낸 유튜브 확인 → 게임 에너지 다 찼네',
      minutes: 20,
      category: ProductCategory.takeFive,
    ),
    Product(
      id: 'youtube-search',
      title: '유튜브 검색',
      subtitle: '찾으려던 영상은 없고 알고리즘이 던진 미끼만 가득',
      minutes: 120,
      category: ProductCategory.takeFive,
    ),
    Product(
      id: 'detox-timer',
      title: '디톡스 타이머 설정',
      subtitle: '스스로에게 긋는 작은 경계선',
      minutes: 2,
      premium: true,
      category: ProductCategory.takeFive,
    ),

    Product(
      id: 'hobby-intro-video',
      title: '취미 입문 영상',
      subtitle: '3시간 뒤, 전문가가 된 "기분"만.',
      minutes: 180,
      category: ProductCategory.newExploration,
    ),
    Product(
      id: 'decide-learn-language',
      title: '언어 배우기 결심',
      subtitle: '교재까지 샀으니 이미 반은 배운 거 아냐?',
      minutes: 90,
      category: ProductCategory.newExploration,
    ),
    Product(
      id: 'room-remodel-plan',
      title: '방 리모델링 계획',
      subtitle: '핀터레스트 보드는 완벽해. 실행은 다음 생에',
      minutes: 120,
      category: ProductCategory.newExploration,
    ),
    Product(
      id: 'side-hustle-idea',
      title: '부업 아이디어',
      subtitle: '구상만으로 이미 지쳤어. 인생은 내일 바꾸자',
      minutes: 75,
      category: ProductCategory.newExploration,
    ),
    Product(
      id: 'find-focus-music',
      title: '집중용 음악 찾기',
      subtitle: '숨겨진 내 감성 노래 찾기. DJ나 할까?',
      minutes: 55,
      category: ProductCategory.newExploration,
    ),
    Product(
      id: 'study-schedule',
      title: '공부 계획표',
      subtitle: '본 단위 완벽 계획! 이제 피곤해서 자야겠다',
      minutes: 85,
      category: ProductCategory.newExploration,
    ),
    Product(
      id: 'choose-one-focus',
      title: '집중할 한 가지 정하기',
      subtitle: '완벽한 열 개보다 완료한 한 개',
      minutes: 1,
      premium: true,
      category: ProductCategory.newExploration,
    ),

    Product(
      id: 'perfect-routine',
      title: '완벽한 루틴 짜기',
      subtitle: '아이고 늦잠 잤네. 미라클모닝은 내일부터.',
      minutes: 60,
      category: ProductCategory.betterTomorrow,
    ),
    Product(
      id: 'drawer-cleaning',
      title: '서랍장 대정리',
      subtitle: '바닥의 옷 걸다가 시작된 미뤄온 옷장정리',
      minutes: 95,
      category: ProductCategory.betterTomorrow,
    ),
    Product(
      id: 'email-reply',
      title: '이메일 답장',
      subtitle: '스팸 정리하다가 답장을 잊어버렸다',
      minutes: 40,
      category: ProductCategory.betterTomorrow,
    ),
    Product(
      id: 'desk-layout-change',
      title: '책상 배치 변경',
      subtitle: '햇빛을 봐야 뇌가 각성된댔어',
      minutes: 35,
      category: ProductCategory.betterTomorrow,
    ),
    Product(
      id: 'memo-system',
      title: '메모 시스템 구축',
      subtitle: '원래 뭐 쓰려고 켰더라?',
      minutes: 80,
      category: ProductCategory.betterTomorrow,
    ),
    Product(
      id: 'nostalgia-found',
      title: '추억 발견',
      subtitle: '청소하다 졸업앨범 발견. 청소는 실종',
      minutes: 110,
      category: ProductCategory.betterTomorrow,
    ),
    Product(
      id: 'perfect-gift',
      title: '완벽한 선물 찾기',
      subtitle: '고민 끝에 결국 못 삼. 편의점 가자',
      minutes: 100,
      category: ProductCategory.betterTomorrow,
    ),
    Product(
      id: 'do-first',
      title: '하려고 한 일부터',
      subtitle: '개선은 그 뒤에',
      minutes: 30,
      premium: true,
      category: ProductCategory.betterTomorrow,
    ),

    Product(
      id: 'get-ready',
      title: '외출 준비',
      subtitle: '옷 10벌 입어보기 포함. 결국 처음 꺼낸 걸로',
      minutes: 50,
      category: ProductCategory.meTime,
    ),
    Product(
      id: 'simple-cooking',
      title: '간단한 요리',
      subtitle: '"간단" 레시피의 배신. 설거지까지 하면 2시간',
      minutes: 85,
      category: ProductCategory.meTime,
    ),
    Product(
      id: 'find-phone',
      title: '핸드폰 찾기',
      subtitle: '집 안 어딘가 숨어있는 진동 소리 찾기 게임',
      minutes: 15,
      category: ProductCategory.meTime,
    ),
    Product(
      id: 'reply-thinking',
      title: '답장 고민',
      subtitle: '이 이모티콘? 저 이모티콘? 톤은 괜찮나? 다시 읽기',
      minutes: 20,
      category: ProductCategory.meTime,
    ),
    Product(
      id: 'choose-theme-colors',
      title: '테마 색상 정하기',
      subtitle: '와이어프레임은 시작도 못 함. 색만 50가지 시도',
      minutes: 30,
      category: ProductCategory.meTime,
    ),
    Product(
      id: 'stretch-and-water',
      title: '스트레칭 & 물 한잔',
      subtitle: '몸이 말하는 신호 듣기. 지금 잠깐 쉬어도 괜찮아',
      minutes: 5,
      premium: true,
      category: ProductCategory.meTime,
    ),
  ];

  @override
  List<Product> getAll() => List<Product>.unmodifiable(_products);

  @override
  void add(Product product) {
    // naive in-memory add for practice
    _products.insert(0, product);
  }
}
