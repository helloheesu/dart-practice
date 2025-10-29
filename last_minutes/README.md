# 시간당

"시간 = 가격"으로 보여주는 재치있는 시간 쇼핑몰. 실제 상점이 아닌 개발 연습용 프로젝트입니다. 아기자기하고 따뜻한 레트로 감성으로, 일상에서 시간을 잡아먹는 행동들을 상품처럼 진열해 스스로 시간 감각을 깨우는 것을 목표로 합니다.

## 주요 화면

- 상품 목록: 앱 최초 진입. 카테고리 필터 + 반응형 그리드 카드 UI
- 상품 상세: 제목/설명/시간 배지/카테고리/프리미엄 표시
- 상품 등록: 간단한 폼으로 로컬 Mock 레포에 항목 추가
- 장바구니: 담긴 상품 수량/개별 시간/총합 시간 표시, 길게 눌러 제거

## 실행

```bash
flutter run
```

## 코드 구조

프로젝트는 기능 확장을 고려해 `core / data / ui` 3계층으로 구성합니다. UI는 `pages`(화면)와 `widgets`(재사용 컴포넌트)로 나눕니다. 화면 클래스는 Page 접미사를 사용합니다.

```text
lib/
  app/
    app.dart                      # MaterialApp 루트(초기 진입: ProductListPage)
  core/
    theme/app_theme.dart          # 네이비/블루그레이 기반 테마
    utils/format.dart             # 분 → "3시간 30분" 포맷터
    constants/strings.dart        # 공용 문자열
  data/
    model/
      product.dart                # Product 엔티티 (id, title, minutes, category, premium, subtitle)
      product_category.dart       # 카테고리 enhanced enum (code/label/emoji/order)
    repository/
      product_repository.dart     # 레포 인터페이스
      product_repository_mock.dart# In-memory Mock(36개 데이터, add 지원)
  ui/
    pages/
      products/
        product_list_page.dart    # 목록 + 필터 + 그리드
        product_detail_page.dart  # 상세 화면
        product_create_page.dart  # 등록 화면(FAB 경유)
      cart/
        cart_page.dart            # 장바구니 화면(총합/결제 버튼)
    widgets/
      products/
        product_card.dart         # 카드 컴포넌트(시간/프리미엄 뱃지)
        category_filter_bar.dart  # 카테고리 ChoiceChip 바
```

## 주요 인터랙션

- 카드 길게 누르기: 해당 상품을 장바구니에 즉시 담기(SnackBar 안내)
- 카드 탭: 상세 화면으로 이동 → 하단 버튼으로 담기 가능
- 카테고리 칩: 선택 시 강조(네이비 배경/화이트 텍스트), 비선택은 블루그레이
- 시간 색상: 분(min)에 따라 동적 컬러(≤5, ≤60, ≤119, 그 이상)로 가독성 향상
- 프리미엄(💎): 프리미엄 강조 색상 및 배지 표시

## 설계 메모

- 카테고리: enhanced enum(`Category`) 한 곳에서 code/label/emoji/order 관리
- 테마: 네이비/블루그레이 기반 팔레트(`AppColors`), 칩/카드/시간 색상 토큰화

### 네이밍/규칙

- 파일/디렉터리는 영어, 사용자 노출 텍스트는 한국어
- 화면: `...Page` (`ProductListPage`, `ProductDetailPage`, `ProductCreatePage`)
- 금칙어: 사용자-facing 텍스트/문서/데이터 전반에서 특정 진단/의학적 용어를 직접적으로 사용하지 않습니다.

### 확장 포인트

- 상태관리(ViewModel 등) 도입 시 `lib/ui/view_models/` 추가
- 영속 저장소로 교체 시 `ProductRepository` 구현체만 갈아끼우기
- 마지막 선택 카테고리 저장, 다크 모드 튜닝 등 추가 예정
