class Place {
  String addressName;
  String categoryGroupCode;
  String categoryGroupName;
  String categoryName;
  String distance;
  int id;
  String phone;
  String placeName;
  String placeUrl;
  String roadAddressName;
  double x;
  double y;

  Place({
    required this.addressName,
    required this.categoryGroupCode,
    required this.categoryGroupName,
    required this.categoryName,
    required this.distance,
    required this.id,
    required this.phone,
    required this.placeName,
    required this.placeUrl,
    required this.roadAddressName,
    required this.x,
    required this.y,
  });

  Place.fromJson(Map<String, dynamic> map)
    : this(
        addressName: map['address_name'],
        categoryGroupCode: map['category_group_code'],
        categoryGroupName: map['category_group_name'],
        categoryName: map['category_name'],
        distance: map['distance'],
        id: int.parse(map['id']),
        phone: map['phone'],
        placeName: map['place_name'],
        placeUrl: map['place_url'],
        roadAddressName: map['road_address_name'],
        x: double.parse(map['x']),
        y: double.parse(map['y']),
      );

  Map<String, dynamic> toJson() {
    return {
      'address_name': addressName,
      'category_group_code': categoryGroupCode,
      'category_group_name': categoryGroupName,
      'category_name': categoryName,
      'distance': distance,
      'id': id.toString(),
      'phone': phone,
      'place_name': placeName,
      'place_url': placeUrl,
      'road_address_name': roadAddressName,
      'x': x.toString(),
      'y': y.toString(),
    };
  }
}

// {
//   "documents": [
//     {
//       "address_name": "대전 중구 은행동 145-1",
//       "category_group_code": "FD6",
//       "category_group_name": "음식점",
//       "category_name": "음식점 > 간식 > 제과,베이커리",
//       "distance": "",
//       "id": "17733090",
//       "phone": "1588-8069",
//       "place_name": "성심당 본점",
//       "place_url": "http://place.map.kakao.com/17733090",
//       "road_address_name": "대전 중구 대종로480번길 15",
//       "x": "127.42727719121109",
//       "y": "36.32765802936324"
//     },
//     {
//       "address_name": "전북특별자치도 군산시 중앙로1가 12-2",
//       "category_group_code": "FD6",
//       "category_group_name": "음식점",
//       "category_name": "음식점 > 간식 > 제과,베이커리",
//       "distance": "",
//       "id": "8055670",
//       "phone": "063-445-2772",
//       "place_name": "이성당 본점",
//       "place_url": "http://place.map.kakao.com/8055670",
//       "road_address_name": "전북특별자치도 군산시 중앙로 177",
//       "x": "126.71126336899455",
//       "y": "35.987200639723106"
//     },
//     {
//       "address_name": "서울 중구 명동2가 25-36",
//       "category_group_code": "FD6",
//       "category_group_name": "음식점",
//       "category_name": "음식점 > 분식",
//       "distance": "",
//       "id": "10332413",
//       "phone": "02-776-5348",
//       "place_name": "명동교자 본점",
//       "place_url": "http://place.map.kakao.com/10332413",
//       "road_address_name": "서울 중구 명동10길 29",
//       "x": "126.98561429978552",
//       "y": "37.56255453417897"
//     },
//     {
//       "address_name": "부산 중구 신창동1가 2-1",
//       "category_group_code": "FD6",
//       "category_group_name": "음식점",
//       "category_name": "음식점 > 양식 > 피자",
//       "distance": "",
//       "id": "10070964",
//       "phone": "051-255-9494",
//       "place_name": "이재모피자 본점",
//       "place_url": "http://place.map.kakao.com/10070964",
//       "road_address_name": "부산 중구 광복중앙로 31",
//       "x": "129.030747190728",
//       "y": "35.10204215079571"
//     },
//     {
//       "address_name": "대전 유성구 도룡동 4-19",
//       "category_group_code": "FD6",
//       "category_group_name": "음식점",
//       "category_name": "음식점 > 간식 > 제과,베이커리",
//       "distance": "",
//       "id": "1148545656",
//       "phone": "1588-8069",
//       "place_name": "성심당 DCC점",
//       "place_url": "http://place.map.kakao.com/1148545656",
//       "road_address_name": "대전 유성구 엑스포로 107",
//       "x": "127.39238984121546",
//       "y": "36.375314602374466"
//     },
//     {
//       "address_name": "경기 수원시 팔달구 인계동 958-1",
//       "category_group_code": "FD6",
//       "category_group_name": "음식점",
//       "category_name": "음식점 > 한식 > 육류,고기 > 갈비",
//       "distance": "",
//       "id": "8108863",
//       "phone": "1600-3883",
//       "place_name": "가보정 1관",
//       "place_url": "http://place.map.kakao.com/8108863",
//       "road_address_name": "경기 수원시 팔달구 장다리로 282",
//       "x": "127.02866468823686",
//       "y": "37.2742169796329"
//     },
//     {
//       "address_name": "강원특별자치도 속초시 조양동 1555-1",
//       "category_group_code": "FD6",
//       "category_group_name": "음식점",
//       "category_name": "음식점 > 한식 > 해물,생선 > 회",
//       "distance": "",
//       "id": "26602585",
//       "phone": "0502-5552-1893",
//       "place_name": "청초수물회 속초본점",
//       "place_url": "http://place.map.kakao.com/26602585",
//       "road_address_name": "강원특별자치도 속초시 엑스포로 12-36",
//       "x": "128.5905399503119",
//       "y": "38.19214711524039"
//     },
//     {
//       "address_name": "제주특별자치도 제주시 이호일동 651-3",
//       "category_group_code": "FD6",
//       "category_group_name": "음식점",
//       "category_name": "음식점 > 한식 > 국수",
//       "distance": "",
//       "id": "21455793",
//       "phone": "064-746-2222",
//       "place_name": "자매국수",
//       "place_url": "http://place.map.kakao.com/21455793",
//       "road_address_name": "제주특별자치도 제주시 항골남길 46",
//       "x": "126.45914433997106",
//       "y": "33.498577203781664"
//     },
//     {
//       "address_name": "충남 천안시 동남구 구룡동 564-27",
//       "category_group_code": "FD6",
//       "category_group_name": "음식점",
//       "category_name": "음식점 > 간식 > 제과,베이커리",
//       "distance": "",
//       "id": "23578013",
//       "phone": "041-578-0036",
//       "place_name": "뚜쥬루 돌가마점",
//       "place_url": "http://place.map.kakao.com/23578013",
//       "road_address_name": "충남 천안시 동남구 풍세로 706",
//       "x": "127.13965203895398",
//       "y": "36.77312336918423"
//     },
//     {
//       "address_name": "강원특별자치도 춘천시 신북읍 천전리 38-26",
//       "category_group_code": "FD6",
//       "category_group_name": "음식점",
//       "category_name": "음식점 > 한식 > 육류,고기 > 닭요리",
//       "distance": "",
//       "id": "8107636",
//       "phone": "033-241-5999",
//       "place_name": "통나무집닭갈비 본점",
//       "place_url": "http://place.map.kakao.com/8107636",
//       "road_address_name": "강원특별자치도 춘천시 신북읍 신샘밭로 763",
//       "x": "127.79328557859613",
//       "y": "37.93312540516689"
//     },
//     {
//       "address_name": "경기 남양주시 진건읍 사능리 580-5",
//       "category_group_code": "FD6",
//       "category_group_name": "음식점",
//       "category_name": "음식점 > 한식",
//       "distance": "",
//       "id": "26953677",
//       "phone": "031-575-9602",
//       "place_name": "소리소시골밥상",
//       "place_url": "http://place.map.kakao.com/26953677",
//       "road_address_name": "경기 남양주시 진건읍 진건우회로 95-1",
//       "x": "127.18151632694531",
//       "y": "37.6504947269557"
//     },
//     {
//       "address_name": "대전 동구 정동 1-1",
//       "category_group_code": "FD6",
//       "category_group_name": "음식점",
//       "category_name": "음식점 > 간식 > 제과,베이커리",
//       "distance": "",
//       "id": "21537026",
//       "phone": "042-220-4138",
//       "place_name": "성심당 대전역점",
//       "place_url": "http://place.map.kakao.com/21537026",
//       "road_address_name": "대전 동구 중앙로 215",
//       "x": "127.4337196562067",
//       "y": "36.332217306511836"
//     },
//     {
//       "address_name": "경기 남양주시 별내동 2184-63",
//       "category_group_code": "FD6",
//       "category_group_name": "음식점",
//       "category_name": "음식점 > 한식 > 해물,생선 > 장어",
//       "distance": "",
//       "id": "27219812",
//       "phone": "031-574-1254",
//       "place_name": "장어의꿈",
//       "place_url": "http://place.map.kakao.com/27219812",
//       "road_address_name": "경기 남양주시 순화궁로 492-6",
//       "x": "127.1186736231229",
//       "y": "37.669524117952726"
//     },
//     {
//       "address_name": "제주특별자치도 제주시 삼도이동 831",
//       "category_group_code": "FD6",
//       "category_group_name": "음식점",
//       "category_name": "음식점 > 한식 > 해장국",
//       "distance": "",
//       "id": "11547525",
//       "phone": "064-757-3393",
//       "place_name": "우진해장국",
//       "place_url": "http://place.map.kakao.com/11547525",
//       "road_address_name": "제주특별자치도 제주시 서사로 11",
//       "x": "126.52000128027187",
//       "y": "33.51151689656457"
//     },
//     {
//       "address_name": "제주특별자치도 서귀포시 색달동 2132-2",
//       "category_group_code": "FD6",
//       "category_group_name": "음식점",
//       "category_name": "음식점 > 일식 > 돈까스,우동",
//       "distance": "",
//       "id": "1890778114",
//       "phone": "0507-1386-7060",
//       "place_name": "연돈",
//       "place_url": "http://place.map.kakao.com/1890778114",
//       "road_address_name": "제주특별자치도 서귀포시 색달로 10",
//       "x": "126.40610781515082",
//       "y": "33.25884970372605"
//     }
//   ],
//   "meta": {
//     "is_end": false,
//     "pageable_count": 45,
//     "same_name": null,
//     "total_count": 597846
//   }
// }
