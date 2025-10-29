# 시간당

"시간 = 가격"으로 보여주는 재치있는 시간 쇼핑몰. 일상에서 시간을 잡아먹는 행동들을 상품처럼 진열해 스스로 시간 감각을 깨우는 것을 목표로 합니다.
실제 상점이 아닌 개발 연습용 프로젝트입니다.

## 전체적인 컬러 설정

시간을 삼키는 블랙홀의 이미지를 시각화하기 위해, 우주를 연상시키는 어두운 네이비/블루그레이 톤을 핵심 컬러로 사용했습니다.

## 실행

```bash
flutter pub get
flutter run
```

## 기능

## 주요 화면

- 상품 목록: 앱 최초 진입. 탭(홈/카테고리) + 반응형 그리드 카드 UI
- 상품 상세: 제목/설명/시간 배지/카테고리/프리미엄 표시, 추가 버튼
- 상품 등록: 간단한 폼으로 로컬 Mock 레포에 항목 추가
- 장바구니: 담긴 상품 목록/수량 증감/개별·총합 시간/예약 버튼(알람 연동)
- 관리자: 앱바 설정 아이콘 → 상품 등록 등 관리 기능 진입

## 주요 인터랙션

- 카드 탭: 상세 화면으로 이동 → 하단 버튼으로 담기 가능
- 카드 우하단 장바구니: 수량 증/감(컴팩트 +/− 버튼 UI)
- 홈 탭: 카테고리 카드 탭 시 해당 카테고리 탭으로 이동
- 카테고리 탭: 탭바에서 카테고리 전환, 탭바 상태 강조
- 장바구니: 0분일 때 예약 버튼 비활성 + 안내 문구 노출
- 알람 처리: 활성 알람 있을 때 버튼 라벨/동작이 수정/취소로 전환, 울릴 때 중지 다이얼로그 표시
- FAB: 장바구니 총합 시간을 축약 포맷(예: 1.5시간)으로 뱃지 표시
- 시간 색상: 분(min)에 따라 동적 컬러(≤5, ≤60, ≤119, 그 이상)
- 프리미엄(💎): '의미 있게 쓰는 시간' 아이템을 강조하는 아이콘

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

## 그 외 신경 쓴 디테일

### UX

- 탭바/홈 전환 시 애니메이션 및 시각적 강조 유지
- 카드 영역 분리: 탭은 상세, 우하단 컨트롤은 장바구니로 명확한 역할 분리
- 컴팩트 수량 컨트롤: 작은 터치 타겟이지만 테두리/배경 대비로 명확한 affordance
- 예약 버튼 가드: 0분일 때 비활성 + 명확한 라벨("0분은 예약할 수 없어요")
- 활성 알람 컨텍스트 처리: 남은 시간 포함한 라벨로 현재 상태를 즉시 인지
- FAB 뱃지 요약 표기: 긴 시간도 한눈에 인지 가능한 축약 포맷
- 입력 폼 유효성: 제목 필수/분 숫자 검증, 선택 입력은 자유
- 안전 영역 고려: 하단 버튼/요약 행 SafeArea 보장
- 대비/가독성: 시간 컬러 스케일, 칩/버튼 전경·배경 대비, 일관 타이포

### 데이터 구조

- 카테고리: enhanced enum(`Category`) 한 곳에서 code/label/emoji/order 관리
- 테마: 네이비/블루그레이 기반 팔레트(`AppColors`), 칩/카드/시간 색상 토큰화
