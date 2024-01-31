# 스파르타 코딩클럽 강의  결과물
## 1. UserDefaults와 CoreData의 차이점
|차이점|UserDefaults와|CoreData|
|------|---|---|
|사용 데이터|간단한 설정값 및 작은 데이터 집합|대규모 데이터 집합|
|저장방식|키 - 값| 객체 그래프로 구성|
|관계 설정|X|O|
|데이터 접근|키값을 통해 쉽게 접근가능|NSPersistentContainer와 NSManagedObjectContext를 통해 접근가능|
|Read|key에 관련된 모든 데이터 Read|필요한 데이터만 가져올수 있음|
## 2. 구조설명
### 1. `ProfileViewController` - Profile 디렉토리
### 2. 데이터 일관성 구현화면 - UseCoreData-LV3 디렉토리
