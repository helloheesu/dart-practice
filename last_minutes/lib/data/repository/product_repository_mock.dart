import '../model/product.dart';
import '../model/product_category.dart';
import 'product_repository.dart';

class ProductRepositoryMock implements ProductRepository {
  static final List<Product> _products = <Product>[
    // 📱 디지털 블랙홀 (9)
    Product(
      id: 'sns-scroll',
      title: 'SNS 틀어가기',
      minutes: 45,
      category: ProductCategory.digitalBlackhole,
    ),
    Product(
      id: 'bed-scroll-5min',
      title: '"5분만" 침대에서 스크롤',
      minutes: 35,
      category: ProductCategory.digitalBlackhole,
    ),
    Product(
      id: 'just-curious-wiki',
      title: '"그냥 궁금해서" 위키피디아 서핑',
      minutes: 45,
      category: ProductCategory.digitalBlackhole,
    ),
    Product(
      id: 'quick-search-17-tabs',
      title: '"빨리 검색만" → 브라우저 탭 17개',
      minutes: 65,
      category: ProductCategory.digitalBlackhole,
    ),
    Product(
      id: 'one-more-game',
      title: '좋아하는 게임 "딱 한판만"',
      minutes: 240,
      category: ProductCategory.digitalBlackhole,
    ),
    Product(
      id: 'check-notifications',
      title: '알림 확인',
      subtitle: '흑시 카톡 왔나? 열어보다가 넷플릭스까지',
      minutes: 20,
      category: ProductCategory.digitalBlackhole,
    ),
    Product(
      id: 'single-game',
      title: '게임 한 판만',
      subtitle: '컨 김에 왕까지, 할 일은 왕 다음',
      minutes: 90,
      category: ProductCategory.digitalBlackhole,
    ),
    Product(
      id: 'youtube-search',
      title: '유튜브 검색하기',
      subtitle: '찾으려던 영상 보다 말고 알고리즘 던진 입장',
      minutes: 120,
      category: ProductCategory.digitalBlackhole,
    ),
    Product(
      id: 'digital-detox-timer',
      title: '디지털 디톡스 타이머 설정',
      subtitle: '스스로에게 주는 작은 경계선',
      minutes: 2,
      premium: true,
      category: ProductCategory.digitalBlackhole,
    ),

    // 🎯 충동 프로젝트 (9)
    Product(
      id: 'binge-new-hobby',
      title: '새로운 취미 입문 유튜브 몰아보기',
      minutes: 180,
      category: ProductCategory.impulseProjects,
    ),
    Product(
      id: 'learn-language-buy-book',
      title: '새로운 언어 배우기 결심 (교재 구매까지)',
      minutes: 90,
      category: ProductCategory.impulseProjects,
    ),
    Product(
      id: 'room-remodel-plan',
      title: '방 전체 리모델링 계획 세우기',
      minutes: 120,
      category: ProductCategory.impulseProjects,
    ),
    Product(
      id: 'side-hustle-idea',
      title: '인생 바꿀 부업 아이디어 구상',
      minutes: 75,
      category: ProductCategory.impulseProjects,
    ),
    Product(
      id: 'perfect-playlist',
      title: '완벽한 플레이리스트 만들기',
      minutes: 55,
      category: ProductCategory.impulseProjects,
    ),
    Product(
      id: 'study-plan',
      title: '공부 계획하기',
      subtitle: '본 단위로 완벽한 계획 완료! 이제 피곤하니 자아겠다.',
      minutes: 85,
      category: ProductCategory.impulseProjects,
    ),
    Product(
      id: 'research-new-topic',
      title: '새 주제 탐색하기',
      subtitle: '하던 일은 멈추고 새로운 주제 연구하기',
      minutes: 150,
      category: ProductCategory.impulseProjects,
    ),
    Product(
      id: 'choose-focus-playlist',
      title: '집중용 플레이리스트 고르기',
      subtitle: '곡 찾다가 집중은 따남',
      minutes: 40,
      category: ProductCategory.impulseProjects,
    ),
    Product(
      id: 'one-thing-postit',
      title: '"이거 하나만" 포스트잇 붙이기',
      subtitle: '오늘 딱 한 가지만 정하기',
      minutes: 1,
      premium: true,
      category: ProductCategory.impulseProjects,
    ),

    // ⏰ 회피형 생산성 (9)
    Product(
      id: 'perfect-routine-tomorrow',
      title: '내일부터 완벽한 루틴 짜기',
      minutes: 60,
      category: ProductCategory.avoidantProductivity,
    ),
    Product(
      id: 'organize-other-tasks',
      title: '정작 해야 할 일 말고 다른 일 정리하기',
      minutes: 50,
      category: ProductCategory.avoidantProductivity,
    ),
    Product(
      id: 'drawer-cleaning',
      title: '갑자기 서랍장 전체 정리 시작',
      minutes: 95,
      category: ProductCategory.avoidantProductivity,
    ),
    Product(
      id: 'reply-unimportant-emails',
      title: '이메일 안 중요한 것부터 답장하기',
      minutes: 40,
      category: ProductCategory.avoidantProductivity,
    ),
    Product(
      id: 'desk-rearrange-again',
      title: '책상 배치 "이번엔 진짜" 바꾸기',
      minutes: 35,
      category: ProductCategory.avoidantProductivity,
    ),
    Product(
      id: 'memoapp-system',
      title: '메모앱 정리 시스템 구축',
      minutes: 80,
      category: ProductCategory.avoidantProductivity,
    ),
    Product(
      id: 'cleaning-nostalgia',
      title: '청소 시작했다가 추억의 물건 발견',
      minutes: 110,
      category: ProductCategory.avoidantProductivity,
    ),
    Product(
      id: 'perfect-gift-but-not-buy',
      title: '완벽한 선물 고르기 (결국 못 삼)',
      minutes: 100,
      category: ProductCategory.avoidantProductivity,
    ),
    Product(
      id: 'urgent-one-task',
      title: '진짜 급한 일 하나만 체크하기',
      subtitle: '완벽함 대신 완료를',
      minutes: 3,
      premium: true,
      category: ProductCategory.avoidantProductivity,
    ),

    // 😅 일상의 시간도둑 (9)
    Product(
      id: 'get-ready-outfit-10',
      title: '나갈 준비 (옷 10번 갈아입기 포함)',
      minutes: 50,
      category: ProductCategory.everydayTimeThieves,
    ),
    Product(
      id: 'simple-recipe-wasnt',
      title: '간단한 요리인 줄 알았던 레시피',
      minutes: 85,
      category: ProductCategory.everydayTimeThieves,
    ),
    Product(
      id: 'shower-thoughts-concert',
      title: '샤워 중 인생 고민 & 콘서트',
      minutes: 45,
      category: ProductCategory.everydayTimeThieves,
    ),
    Product(
      id: 'find-phone-home',
      title: '핸드폰 찾기 (집 안 어딘가)',
      minutes: 15,
      category: ProductCategory.everydayTimeThieves,
    ),
    Product(
      id: 'reply-friends-message',
      title: '친구 메시지 답장 고민하기',
      minutes: 20,
      category: ProductCategory.everydayTimeThieves,
    ),
    Product(
      id: 'pick-theme-colors',
      title: '테마 색상 정하기',
      subtitle: '와이어프레임은 시작도 못 함',
      minutes: 30,
      category: ProductCategory.everydayTimeThieves,
    ),
    Product(
      id: 'eat-first',
      title: '밥은 먹고 해야지',
      subtitle: '일하다 까먹은 식사. 밥 먹으면서도 일 생각이 나서 체한다.',
      minutes: 90,
      category: ProductCategory.everydayTimeThieves,
    ),
    Product(
      id: 'lie-down-30min',
      title: '30분만 눕자',
      subtitle: '과몰입 후 갑자기 밀려온 피로. 눈 뜨니 마감 시간.',
      minutes: 150,
      category: ProductCategory.everydayTimeThieves,
    ),
    Product(
      id: 'stretch-and-water',
      title: '스트레칭 & 물 한잔',
      subtitle: '몸이 말하는 신호 듣기',
      minutes: 5,
      premium: true,
      category: ProductCategory.everydayTimeThieves,
    ),
  ];

  @override
  List<Product> getAll() => List<Product>.unmodifiable(_products);
}
