# To Do 앱 UI 만들기

## 요구사항

- 아이콘, 텍스트 위젯, 버튼 위젯, ListView 활용
- 버튼 기능을 통해 다른 페이지로 이동

## 데이터 구조

`TaskEntity` Class

```dart
  final String title;
  final String? description;
  final bool isFavorite;
  final bool isDone;
```

## 화면별 요구사항

### 남은 할 일

- 할일 플레이스홀더의 높이 조정
- 이미지 webp로 변경
- 앱바, 할일플레이스홀더 색상을 테마로 변경

### 기본 화면(Task 리스트가 없는 화면 - `EmptyTasksPlaceholder`)

타이틀

- title에 ‘수강생 이름`s Tasks’ 넣기
- AppBar title에 사이즈 20, 볼드체 적용 하기

레이아웃

- margin & padding 20 적용하기
- 백그라운드 컬러 및 테두리 라운딩에 circular(12) 적용하기
- Column을 이용하여 수직으로 순서대로 배치(각 요소간 간격 12 설정)
  - 원하는 이미지(가로&세로 100씩, webp로 변환해서 넣기(Android Studio 사용!)
  - 텍스트1(사이즈16, 볼드체 적용)
  - 텍스트2(사이즈14, 높이 1.5, 가운데 정렬 적용, AppBar에 적용한 title을 받아 사용)

아이콘

- Icon 사용하기 (Icon Class의 add icon 사용)
- 아이콘은 흰색, 사이즈 24, 배경은 원하는 색상, 버튼 모양은 원형 적용
- 눌렀을 때 작동 될 `_showAddTaskBottomSheet()` 함수 작성 및 위젯에 연결

### To Do를 추가하는 화면 (`AddTaskBottomSheet`)

레이아웃

- BottomSheet의 좌우 패딩 20, 위의 패딩 12, 하단 패딩은 0.
- 만든 BottomSheet에 TextField를 넣기(Task title 입력 용, hint : 새 할 일, 텍스트 사이즈 16)
- 자동으로 Task 추가 창이 뜰 때 키보드가 뜨도록 구현, title 입력용 TextField에 focus가 잡히도록 구현
- 해당 BottomSheet가 키보드 위로 잡히도록 bottom Padding 수정
  (MediaQuery.of(context).viewInsets.bottom 사용)
- title 입력용 TextField에서는 줄바꿈 대신 저장이(`onSubmitted()`) 적용되도록 구현
  (title이 비었을때는 작동되지 않도록 구현)

아이콘

- title 텍스트 입력 창 밑으로 Row를 사용해 Icon 2개 추가하기
  (설명(short_text_rounded), 즐겨찾기(star/star_border), 아이콘 사이즈24)
  - 공식 Icon Class 관련 홈페이지 참고해서 원하는 Icon 검색하기
  - bool 값을 이용하여 즐겨찾기 상태에 따라 내부가 차 있는 아이콘과 라인만 있는 아이콘으로 상태 표시하기
  - 설명 Icon 을 눌렀을 때, description용 TextField 보이게 하기
    (hint : 세부정보 추가, 텍스트 사이즈 14, TextField 화면 표시 시, description 용 Icon 숨기기)
- 아이콘들이 있는 라인에 Row를 이용하여 끝에 ‘저장’ 버튼이 있도록 구현
  - ‘저장’ 버튼은 title에 입력된 요소가 있을 때만 활성화(색상 차이 구현)
  - Task를 저장하는 함수(`onSubmitted()`)를 만들어서 연결
- 저장이 작동되면 Task 객체를 반환하고 창 닫기(Navigator.of(context).pop() 사용)

text field

- description 입력용 TextField에서는 줄바꿈이 적용되도록 구현
  (세부사항 줄이 늘어났을 때, view가 깨지지 않도록 ~expanded로 감싸줄 것~! => `minLines`/`maxLines`로 구현)

FAB

- Scaffold의 resizeToAvoidBottomInset을 사용하여, 키보드 노출과 무관하게 FloatingActionButton의 위치가 변하지 않게 만들기

### To Do가 추가 된 화면 (`HomePage` - `TaskView`)

TaskView

- TaskEntity 를 인자로 받는 TaskView 위젯 만들기
  - 마진 수직 8, 패딩 수평 16, 라운딩 12, 내부 요소들 간 간격 12으로 구현
    - Icon(circle & check_circle) : 버튼이 눌렸을 때 Done 상태 변경
    - 텍스트(To Do의 title) : Done 상태에 따라서 취소선 상태 적용
    - Icon(star & star_border) : 버튼이 눌렸을 때 Favorite 상태 변경
  - Task 객체를 외부에서 받아오므로, 이를 수정할 수 있는 함수(`onSubmitted()`) 또한 외부에서 받아야 합니다.
    (`ValueChanged` 을 인자로 받으세요!)
- To Do가 없을 때는 처음 만들었던 `EmptyTasksPlaceholder`를,
  있을 때는 `TaskView`가 리스트 뷰를 이용해서 화면에 표시되도록 구현

```dart
class TaskView extends StatelessWidget {
  const TaskView({
    super.key,
    required this.task,
    required this.onToggleFavorite,
    required this. onToggleDone,
  });

  final TaskEntity task;
  final VoidCallback onToggleFavorite; final VoidCallback onToggleDone;
// ...
}
```

### Task 상세 보기 화면

기능

- AppBar에 leading과 actions 사용하기
- back button을 통해서 뒤로가기 구현하기
- favorite 변경 구현하기(현재 페이지, 뒤로 간 페이지 모두 반영되어야 합니다.)

레이아웃

- TaskEntity를 받아서 화면 컨텐츠 채우기
