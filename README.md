# 📱 Refly
Flutter로 제작한 고민 관리 앱
기록을 통해 마음을 정리하고, 해결 과정을 추적하며 성장하는 나를 확인할 수 있어요.

<p align="center">
<img src=https://github.com/user-attachments/assets/4c8f8566-8739-4f4e-915f-baa6d54b703c/ width = 800></img>
</p>

## Refly 1.0.0
개발기간 : 2025.04.01 - 2025.06.17 (2개월)


## 📲 앱 다운로드
Appstore : https://apps.apple.com/kr/app/%EB%A6%AC%ED%94%8C%EB%9D%BC%EC%9D%B4/id6747218275

## 🛠 기술 스택
- 프레임워크 : Flutter / Dart
- 상태관리 : Riverpod / flutter_hooks
- 아키텍처 : MVVM / Clean Architecture
- 백엔드 : Supabase / Supabase Edge Functions
- 기타 : Freezed / Equatable / Go_Router

## 🧱 프로젝트 구조

```
lib
 ┣ src
 ┃ ┣ core # 공통 로직 및 유틸
 ┃ ┃ ┣ error # 에러 관련
 ┃ ┃ ┣ extensions # 공통 extensions
 ┃ ┃ ┣ mixins # 공통 mixins
 ┃ ┃ ┣ providers
 ┃ ┃ ┣ routes # 라우팅 설정
 ┃ ┃ ┣ theme # 앱 테마 설정
 ┃ ┃ ┣ ui # 앱 공통 UI
 ┃ ┃ ┃ ┣ viewModels # 앱 공통 ViewModels
 ┃ ┃ ┃ ┣ views # 앱 공통 Views
 ┃ ┃ ┃ ┗ widgets # 앱 공통 Widgets
 ┃ ┃ ┗ usecases # 앱 공통 Usecases
 ┃ ┗ feature # 기능 별
 ┃ ┃ ┃ ┣ data
 ┃ ┃ ┃ ┃ ┣ datasources # 기능별 Api 엔드포인트
 ┃ ┃ ┃ ┃ ┣ dtos # DTO 관련
 ┃ ┃ ┃ ┃ ┗ models # Model 정의 관련
 ┃ ┃ ┃ ┣ domain
 ┃ ┃ ┃ ┃ ┣ entities # Entity 정의 관련
 ┃ ┃ ┃ ┃ ┣ repositories # 기능별 repository
 ┃ ┃ ┃ ┃ ┗ usecases # 기능별 Usecases
 ┃ ┃ ┃ ┗ ui # 기능별 UI
 ┃ ┃ ┃ ┃ ┣ viewModels # 기능별 ViewModels
 ┃ ┃ ┃ ┃ ┣ views # 기능별 Views
 ┃ ┃ ┃ ┃ ┗ widgets 기능별 Widgets
 ┗ main.dart
```

## 개발 기록
- 2025.04.01 프로젝트 시작
- 2025.04.15 메인 UI 디자인 확정 및 제작 시작
- 2025.05.27 MVVM과 더불어 Clean Architecture 도입
- 2025.06.03 시트 애니메이션을 위한 정확한 위치 관계식 개선
- 2025.06.14 Supabase Edge Functions를 이용한 사용자 회원탈퇴 기능 제작
- 2025.06.15 iOS 배포를 위한 빌드 완료 및 첫번째 심사 제출
- 2025.06.17 iOS 앱스토어 배포 완료

## 💡 주요 기능
- 📅 날짜별 고민 기록

  매일매일 고민을 작성하고 저장할 수 있어요.

- 🔁 해결 과정 기록

  시간이 지난 후 해결 방법을 남기며 나의 성장도 확인해보세요.

- ⭐️ 즐겨찾기 기능

  자주 떠오르는 고민과 해결책을 쉽게 다시 볼 수 있어요.

- 📊 해결률 통계

  내가 해결한 고민이 전체 중 몇 개인지 한눈에 볼 수 있어요.


## 📸 앱 스크린샷
<table>
  <tr>
    <td>
      <img src = https://github.com/user-attachments/assets/a9411e38-6ec2-4745-8d43-7e96a4a14797>
    </td>
    <td>
      <img src = https://github.com/user-attachments/assets/f5b68f96-eae7-4def-b292-a9b5f73ad7a0>
    </td>
    <td>
      <img src = https://github.com/user-attachments/assets/512141ee-bcd8-4c5c-ac8d-ed46cfc50726>
    </td>
    <td>
      <img src = https://github.com/user-attachments/assets/c4b97ee2-71de-46c9-997c-d1d7d5fdecf7>
    </td>
    <td>
      <img src = https://github.com/user-attachments/assets/36c4a997-05f0-4f88-b80d-b1061a04452f>
    </td>
    <td>
      <img src = https://github.com/user-attachments/assets/eb6be8a7-6f2e-47ab-9090-3e2481f3c9d0>
    </td>
  </tr>
</table>

## 📌 TODO
- [O] Supabase 연동
- [ ] 테스트 커버리지 100 % 달성
- [O] iOS 배포
- [ ] Android 배포
- [ ] CICD 구축



