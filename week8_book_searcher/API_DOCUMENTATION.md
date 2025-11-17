# 카카오 로컬 API - 카테고리 그룹 코드 장소 검색 문서

## 개요

카카오 로컬 API의 카테고리 그룹 코드를 이용한 장소 검색 API 문서입니다. 이 API는 특정 카테고리 그룹 코드에 해당하는 장소들을 검색할 수 있습니다.

## API 엔드포인트

```
GET /v2/local/search/category.json
```

## 요청 (Request)

### 쿼리 파라미터

| 프로퍼티              | 타입      | 설명                                                      | 필수 |
| --------------------- | --------- | --------------------------------------------------------- | ---- |
| `category_group_code` | `string`  | 카테고리 그룹 코드                                        | O    |
| `x`                   | `string`  | X좌표 (경도, longitude)                                   | X    |
| `y`                   | `string`  | Y좌표 (위도, latitude)                                    | X    |
| `radius`              | `integer` | 중심 좌표부터의 반경 거리 (미터, 0~20000)                 | X    |
| `rect`                | `string`  | 사각형 범위 내에서 제한 검색을 위한 좌표                  | X    |
| `page`                | `integer` | 결과 페이지 번호 (1~45, 기본값: 1)                        | X    |
| `size`                | `integer` | 한 페이지에 보여질 문서 수 (1~15, 기본값: 15)             | X    |
| `sort`                | `string`  | 결과 정렬 기준 (distance 또는 accuracy, 기본값: accuracy) | X    |

### 파라미터 상세 설명

#### `category_group_code`

카테고리 그룹 코드. 아래 카테고리 그룹 코드 목록 참조.

#### `x`, `y`, `radius`

- 특정 지역을 중심으로 검색할 때 사용
- `x`, `y`는 중심 좌표 (경도, 위도)
- `radius`는 중심 좌표로부터의 반경 거리 (미터 단위, 0~20000)
- `distance` 정렬을 사용할 경우 `x`, `y` 파라미터 필수

#### `rect`

- 사각형 범위 내에서 제한 검색을 위한 좌표
- 형식: `좌측 X 좌표,좌측 Y 좌표,우측 X 좌표,우측 Y 좌표`
- `(x, y, radius)` 또는 `rect` 중 하나는 필수

#### `page`

- 결과 페이지 번호
- 1~45 사이의 값
- 기본값: 1

#### `size`

- 한 페이지에 보여질 문서의 개수
- 1~15 사이의 값
- 기본값: 15

#### `sort`

- 결과 정렬 순서
- `distance`: 거리순 정렬 (x, y 파라미터 필요)
- `accuracy`: 정확도순 정렬
- 기본값: `accuracy`

## 카테고리 그룹 코드 (CategoryGroupCode)

| 코드  | 설명             |
| ----- | ---------------- |
| `MT1` | 대형마트         |
| `CS2` | 편의점           |
| `PS3` | 어린이집, 유치원 |
| `SC4` | 학교             |
| `AC5` | 학원             |
| `PK6` | 주차장           |
| `OL7` | 주유소, 충전소   |
| `SW8` | 지하철역         |
| `BK9` | 은행             |
| `CT1` | 문화시설         |
| `AG2` | 중개업소         |
| `PO3` | 공공기관         |
| `AT4` | 관광명소         |
| `AD5` | 숙박             |
| `FD6` | 음식점           |
| `CE7` | 카페             |
| `HP8` | 병원             |
| `PM9` | 약국             |

## 응답 (Response)

### 헤더 (Header)

| 이름           | 설명                                                                                     | 필수 |
| -------------- | ---------------------------------------------------------------------------------------- | ---- |
| `Content-Type` | 응답 데이터 타입<br/>`application/json; charset=UTF-8` 또는<br/>`text/xml;charset=UTF-8` | O    |

### 본문 (Body)

| 이름        | 타입         | 설명           |
| ----------- | ------------ | -------------- |
| `meta`      | `Meta`       | 응답 관련 정보 |
| `documents` | `Document[]` | 응답 결과      |

### Meta

| 이름             | 타입       | 설명                                                                                                        |
| ---------------- | ---------- | ----------------------------------------------------------------------------------------------------------- |
| `total_count`    | `Integer`  | 검색된 문서 수                                                                                              |
| `pageable_count` | `Integer`  | total_count 중 노출 가능 문서 수 (최대값: 45)                                                               |
| `is_end`         | `Boolean`  | 현재 페이지가 마지막 페이지인지 여부<br/>값이 false면 다음 요청 시 page 값을 증가시켜 다음 페이지 요청 가능 |
| `same_name`      | `SameName` | 질의어의 지역 및 키워드 분석 정보                                                                           |

### SameName

| 이름              | 타입       | 설명                                                                                        |
| ----------------- | ---------- | ------------------------------------------------------------------------------------------- |
| `region`          | `String[]` | 질의어에서 인식된 지역의 리스트<br/>(예: '중앙로 맛집'에서 '중앙로'에 해당하는 지역 리스트) |
| `keyword`         | `String`   | 질의어에서 지역 정보를 제외한 키워드<br/>(예: '중앙로 맛집'에서 '맛집')                     |
| `selected_region` | `String`   | 인식된 지역 리스트 중 현재 검색에 사용된 지역 정보                                          |

### Document

| 이름                  | 타입     | 설명                                                                              |
| --------------------- | -------- | --------------------------------------------------------------------------------- |
| `id`                  | `String` | 장소 ID                                                                           |
| `place_name`          | `String` | 장소명, 업체명                                                                    |
| `category_name`       | `String` | 카테고리 이름                                                                     |
| `category_group_code` | `String` | 중요 카테고리만 그룹핑한 카테고리 그룹 코드                                       |
| `category_group_name` | `String` | 중요 카테고리만 그룹핑한 카테고리 그룹명                                          |
| `phone`               | `String` | 전화번호                                                                          |
| `address_name`        | `String` | 전체 지번 주소                                                                    |
| `road_address_name`   | `String` | 전체 도로명 주소                                                                  |
| `x`                   | `String` | X 좌표 혹은 경도(longitude)                                                       |
| `y`                   | `String` | Y 좌표 혹은 위도(latitude)                                                        |
| `place_url`           | `String` | 장소 상세 페이지 URL                                                              |
| `distance`            | `String` | 중심좌표까지의 거리<br/>(단, x,y 파라미터를 준 경우에만 존재)<br/>(단위: 미터(m)) |

## 예제 요청

### 기본 요청 (음식점 검색)

```
GET /v2/local/search/category.json?category_group_code=FD6
```

### 특정 지역 중심 검색 (반경 1000m)

```
GET /v2/local/search/category.json?category_group_code=FD6&x=127.123456&y=37.123456&radius=1000
```

### 거리순 정렬

```
GET /v2/local/search/category.json?category_group_code=FD6&x=127.123456&y=37.123456&sort=distance
```

### 페이지네이션

```
GET /v2/local/search/category.json?category_group_code=FD6&page=2&size=10
```

## 예제 응답

```json
{
  "documents": [
    {
      "address_name": "대전 중구 은행동 145-1",
      "category_group_code": "FD6",
      "category_group_name": "음식점",
      "category_name": "음식점 > 간식 > 제과,베이커리",
      "distance": "",
      "id": "17733090",
      "phone": "1588-8069",
      "place_name": "성심당 본점",
      "place_url": "http://place.map.kakao.com/17733090",
      "road_address_name": "대전 중구 대종로480번길 15",
      "x": "127.42727719121109",
      "y": "36.32765802936324"
    }
  ],
  "meta": {
    "is_end": false,
    "pageable_count": 45,
    "same_name": null,
    "total_count": 597846
  }
}
```

## 프로젝트 구현

### Place 모델

프로젝트에서 사용하는 `Place` 모델은 다음과 같은 필드를 포함합니다:

```dart
class Place {
  String addressName;           // address_name
  String categoryGroupCode;     // category_group_code
  String categoryGroupName;     // category_group_name
  String categoryName;          // category_name
  String distance;              // distance
  int id;                       // id
  String phone;                 // phone
  String placeName;             // place_name
  String placeUrl;              // place_url
  String roadAddressName;       // road_address_name
  double x;                     // x (경도)
  double y;                     // y (위도)
}
```

### PlaceRepository

`PlaceRepository` 클래스는 카카오 로컬 API를 호출하여 장소 목록을 가져옵니다:

```dart
class PlaceRepository {
  Future<List<Place>> searchPlaces() async {
    // API 호출 및 응답 파싱
    // Place 객체 리스트 반환
  }
}
```

## 인증

API 호출 시 `Authorization` 헤더에 카카오 REST API 키를 포함해야 합니다:

```
Authorization: KakaoAK {REST_API_KEY}
```

## 주의사항

1. **파라미터 조합**: `(x, y, radius)` 또는 `rect` 중 하나는 필수입니다.
2. **거리 정렬**: `sort=distance`를 사용할 경우 `x`, `y` 파라미터가 필수입니다.
3. **페이지 제한**: `page`는 최대 45까지 가능합니다.
4. **페이지 크기**: `size`는 최대 15까지 가능합니다.
5. **반경 제한**: `radius`는 0~20000 미터 사이의 값만 가능합니다.

## 참고 자료

- [카카오 로컬 API 공식 문서](https://developers.kakao.com/docs/latest/ko/local/dev-guide#search-by-category)
