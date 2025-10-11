# 다트 심화 주차 과제

## 공통 요구사항

시나리오: 아래의 기능을 포함한 간단한 학생 성적 분석 프로그램(다트 콘솔 프로그램) 만들기

- 컬렉션을 활용하여 데이터 처리하기
- **파일 입출력**을 통해 데이터를 불러오고 저장하기
- 객체 지향을 활용한 전체 구조 생각하기

힌트 - 필수 정의

```dart
점수를 표현하기 위한 Score 클래스

- 속성(Property)
  - 점수(int)
- 메서드
  - 출력 메서드(showInfo())
    - 현재 점수를 출력합니다.
    - 출력 형태: "점수: 90"
```

```dart
학생의 점수를 위한 StudentScore 클래스

- 속성(Property)
  - 이름(String)
  - 점수(int)
- 메서드(Method)
  - 출력 메서드(showInfo())
    - 해당 학생의 정보를 출력합니다.
    - 출력 형태 : "이름: 홍길동, 점수: 90"
```

코드 실행 예시

```plaintext
어떤 학생의 통계를 확인하시겠습니까? 김영희
잘못된 학생 이름을 입력하셨습니다. 다시 입력해주세요.
어떤 학생의 통계를 확인하시겠습니까? 홍길동
이름 : 홍길동, 점수: 90
저장이 완료되었습니다.
```

## 필수 문제

### 실행 방법 (CLI)

```sh
# week3_dart_advanced 디렉토리에서 실행
dart bin/core_problem.dart
```

### 요구사항

#### 1. Score와 StudentScore 클래스를 구성하기

[ 설명 ]

- 점수를 표현하는 `Score` 클래스를 정의하고, 이를 상속받아 학생의 정보를 포함하는 `StudentScore` 클래스를 구현합니다.
- `Score` 클래스는 단순히 점수만 출력하지만, `StudentScore` 클래스는 학생 이름과 과목까지 포함하여 더 구체적인 정보를 출력합니다.

[ 조건 ]

- 상속 받는 클래스에서 함수 재정의하기. 함수 재정의는 아래와 같은 형식

```dart
@override
void showInfo() {
  // 코드 구현
}
```

[ 힌트 ]

- extends 키워드를 사용하여 클래스를 상속
- @override 어노테이션을 사용하여 메서드를 재정의

#### 2. 파일로부터 데이터 읽어오기 기능

[ 설명 ]

- 프로그램 시작 시 `students.txt` 파일에서 학생들 점수 목록을 받아옵니다.
- 파일은 CSV 형식으로, 한 줄에 이름,점수 형태의 데이터가 저장되어 있습니다.

```plaintext
홍길동,90
김철수,80
```

[ 조건 ]

- 파일의 각 줄을 읽어 이름(`String`), 점수(`int`)로 분리합니다.
- 분리한 데이터를 `StudentScore` 객체로 생성한 뒤, `List<StudentScore>`에 저장합니다.

[ 힌트 ]

dart:io 라이브러리의 File 클래스를 사용하여 파일을 읽습니다. ([File 클래스 문서](https://api.dart.dev/stable/3.5.3/dart-io/File-class.html))

- split() 메서드를 사용하여 CSV 데이터를 분리한 후 변수(name, score)에 선언해줍니다.
- 동기/비동기 두가지 방식으로 파일을 불러올 수 있습니다.

```dart
import 'dart:io';

void loadStudentData(String filePath) {
  try {
    final file = File(filePath);
    final lines = file.readAsLinesSync();

    for (var line in lines) {
      final parts = line.split(',');
      if (parts.length != 2) throw FormatException('잘못된 데이터 형식: $line');

      String name = parts[0];
      int score = int.parse(parts[1]);
    }
  } catch (e) {
    print("학생 데이터를 불러오는 데 실패했습니다: $e");
    exit(1);
  }
  return;
}
```

#### 3. 사용자로부터 입력 받아 학생 점수 확인 기능

[ 설명 ]

- 프로그램 시작 시 사용자로부터 과목 정보를 입력 받습니다.

[ 조건 ]

- `"어떤 학생의 통계를 확인하시겠습니까?"`라는 메시지를 출력합니다.
- 사용자가 `"홍길동"`, `"김철수"`중 하나를 입력하면 해당 과목의 평균 점수를 계산합니다.
  - 출력 예시: `"이름: 홍길동, 점수: 90"`
- 다른 값이 입력되면 `"잘못된 학생 이름을 입력하셨습니다. 다시 입력해주세요."`를 출력하고 다시 입력을 받습니다.
  - 이 동작은 올바른 값(홍길동/김철수)이 입력될 때까지 반복됩니다.

#### 4. 프로그램 종료 후, 결과를 파일에 저장하는 기능

[ 설명 ]

- 3번 기능 이후, 결과를 파일에 저장하며 프로그램을 종료합니다.
- result.txt 파일을 생성해서 여기에 결과를 저장해주세요.
- result.txt 파일에 `“이름: 홍길동, 점수: 90”`형태로 저장해주시면 됩니다.

[ 조건 ]

- 저장이 완료되면 `"저장이 완료되었습니다."`라는 메시지를 콘솔에 출력하세요.

[ 힌트 ]

dart:io 라이브러리의 writeAsStringSync() 을 이용하여 파일을 저장할 수 있습니다.

```dart
import 'dart:io';

void saveStringToFile(String filePath, String content) {
  try {
    final file = File(filePath);
    file.writeAsStringSync(content);
    print("저장이 완료되었습니다.");
  } catch (e) {
    print("저장에 실패했습니다: $e");
  }
}
```
