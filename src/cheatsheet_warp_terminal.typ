#import "./templates/conf.typ": *

#show: template.with(
  title: "Warp 키보드 단축키 치트시트",
  header: [#datetime.today().display()],
  footer: "",
)

= 1. 기본 탐색 및 편집

== 커서 이동
- 줄 시작 이동
  - macOS: `Cmd + ←` 또는 `Ctrl + A`
  - Windows/Linux: `Home` 또는 `Ctrl + A`
- 줄 끝 이동
  - macOS: `Cmd + →` 또는 `Ctrl + E`
  - Windows/Linux: `End` 또는 `Ctrl + E`
- 단어 단위 왼쪽 이동
  - macOS: `Option + ←`
  - Windows/Linux: `Ctrl + ←`
- 단어 단위 오른쪽 이동
  - macOS: `Option + →`
  - Windows/Linux: `Ctrl + →`
- 한 글자 이동
  - 모든 OS: `Ctrl + F` (오른쪽), `Ctrl + B` (왼쪽)

== 텍스트 편집
- 커서부터 줄 끝까지 삭제
  - 모든 OS: `Ctrl + K`
- 커서부터 줄 시작까지 삭제
  - 모든 OS: `Ctrl + U`
- 이전 단어 삭제
  - 모든 OS: `Ctrl + W`
- 다음 단어 삭제
  - macOS: `Option + D`
  - Windows/Linux: `Ctrl + D`
- 삭제 텍스트 붙여넣기
  - 모든 OS: `Ctrl + Y`
- 문자 위치 변경
  - 모든 OS: `Ctrl + T`

== 히스토리
- 명령어 히스토리 검색
  - 모든 OS: `Ctrl + R` (역방향), `Ctrl + S` (정방향)
- 이전/다음 명령어
  - 모든 OS: `↑/↓` 또는 `Ctrl + P/N`

= 2. Warp 전용 기능

== 블록 관리
- 이전/다음 블록 이동
  - macOS: `Cmd + ↑/↓`
  - Windows/Linux: `Ctrl + Shift + ↑/↓`
- 블록 선택 이동
  - macOS: `Cmd + Shift + ↑/↓`
  - Windows/Linux: `Ctrl + Alt + ↑/↓`
- 블록 이동 (번호 입력)
  - macOS: `Cmd + G`
  - Windows/Linux: `Ctrl + G`
- 현재 블록 삭제
  - macOS: `Cmd + D`
  - Windows/Linux: `Ctrl + D`

== 명령어 팔레트
- 명령어 팔레트 열기
  - macOS: `Cmd + P`
  - Windows/Linux: `Ctrl + Shift + P`
- 빠른 명령어 검색
  - macOS: `Cmd + K`
  - Windows/Linux: `Ctrl + K`
- 설정 메뉴 열기
  - macOS: `Cmd + ,`
  - Windows/Linux: `Ctrl + ,`

== AI 및 자동완성
- 자동완성
  - 모든 OS: `Tab` (수락), `Shift + Tab` (거부)
- AI 어시스턴트 열기
  - macOS: `Cmd + I`
  - Windows/Linux: `Ctrl + I`
- AI 명령어 제안
  - macOS: `Cmd + J`
  - Windows/Linux: `Ctrl + J`
- AI 명령어 설명 요청
  - 모든 OS: `Ctrl + X + A`

= 3. 터미널 관리

== 탭 관리
- 새 탭 열기
  - macOS: `Cmd + T`
  - Windows/Linux: `Ctrl + Shift + T`
- 현재 탭 닫기
  - macOS: `Cmd + W`
  - Windows/Linux: `Ctrl + Shift + W`
- 닫힌 탭 다시 열기
  - macOS: `Cmd + Shift + T`
  - Windows/Linux: `Ctrl + Shift + Y`
- 탭 번호 이동
  - macOS: `Cmd + 1-9`
  - Windows/Linux: `Ctrl + 1-9`
- 이전/다음 탭 이동
  - macOS: `Cmd + Option + ←/→` 또는 `Cmd + [/]`
  - Windows/Linux: `Ctrl + PageUp/PageDown`

== 패널 분할
- 수직 패널 분할
  - macOS: `Cmd + D`
  - Windows/Linux: `Ctrl + Shift + D`
- 수평 패널 분할
  - macOS: `Cmd + Shift + D`
  - Windows/Linux: `Ctrl + Shift + H`
- 패널 간 이동
  - macOS: `Cmd + Option + ←/→/↑/↓`
  - Windows/Linux: `Ctrl + Alt + ←/→/↑/↓`
- 현재 패널 닫기
  - macOS: `Cmd + Shift + W`
  - Windows/Linux: `Ctrl + Shift + Q`

== 윈도우 관리
- 새 윈도우 열기
  - macOS: `Cmd + N`
  - Windows/Linux: `Ctrl + Shift + N`
- 새 incognito 윈도우
  - macOS: `Cmd + Shift + N`
  - Windows/Linux: `Ctrl + Shift + P`
- 윈도우 최소화
  - macOS: `Cmd + M`
  - Windows/Linux: `Ctrl + Shift + M`
- 전체화면 토글
  - macOS: `Cmd + Enter`
  - Windows/Linux: `F11`
- 폰트 크기 조절
  - macOS: `Cmd + +/-/0`
  - Windows/Linux: `Ctrl + +/-/0`

= 4. 검색 및 필터링

== 텍스트 검색
- 페이지 찾기
  - macOS: `Cmd + F`
  - Windows/Linux: `Ctrl + F`
- 다음/이전 검색 결과
  - macOS: `Cmd + G` / `Cmd + Shift + G`
  - Windows/Linux: `F3` / `Shift + F3`
- 검색 닫기
  - 모든 OS: `Escape`

== 블록 필터링
- 블록 필터 열기
  - macOS: `Cmd + Shift + F`
  - Windows/Linux: `Ctrl + Shift + F`
- 결과 필터링
  - macOS: `Cmd + Shift + R`
  - Windows/Linux: `Ctrl + Shift + R`
- 오류 블록 표시
  - macOS: `Cmd + Shift + E`
  - Windows/Linux: `Ctrl + Shift + E`
- 필터 지우기
  - macOS: `Cmd + Shift + C`
  - Windows/Linux: `Ctrl + Shift + C`

= 5. 출력 및 복사

== 복사/붙여넣기
- 선택 텍스트 복사
  - macOS: `Cmd + C`
  - Windows/Linux: `Ctrl + C`
- 붙여넣기
  - macOS: `Cmd + V`
  - Windows/Linux: `Ctrl + V`
- 블록 전체 복사
  - macOS: `Cmd + Shift + C`
  - Windows/Linux: `Ctrl + Shift + C`
- 포맷 없이 붙여넣기
  - macOS: `Cmd + Shift + V`
  - Windows/Linux: `Ctrl + Shift + V`
- 명령어만 복사
  - macOS: `Cmd + Option + C`
  - Windows/Linux: `Ctrl + Alt + C`
- 모든 텍스트 선택
  - macOS: `Cmd + A`
  - Windows/Linux: `Ctrl + A`

== 출력 관리
- 화면 지우기
  - macOS: `Cmd + L`
  - Windows/Linux: `Ctrl + L`
- 스크롤백 지우기
  - macOS: `Cmd + Shift + L`
  - Windows/Linux: `Ctrl + Shift + L`
- 현재 명령어 재실행
  - macOS: `Cmd + R`
  - Windows/Linux: `Ctrl + R`
- 블록 재실행
  - macOS: `Cmd + Shift + R`
  - Windows/Linux: `Ctrl + Shift + R`

= 6. 북마크 및 즐겨찾기

== 워크플로우
- 현재 워크플로우 저장
  - macOS: `Cmd + S`
  - Windows/Linux: `Ctrl + S`
- 워크플로우 열기
  - macOS: `Cmd + O`
  - Windows/Linux: `Ctrl + O`
- 다른 이름 저장
  - macOS: `Cmd + Shift + S`
  - Windows/Linux: `Ctrl + Shift + S`

== 명령어 북마크
- 북마크 추가
  - macOS: `Cmd + B`
  - Windows/Linux: `Ctrl + B`
- 북마크 패널 토글
  - macOS: `Cmd + Shift + B`
  - Windows/Linux: `Ctrl + Shift + B`
- 북마크 명령어 실행
  - macOS: `Cmd + 1-0`
  - Windows/Linux: `Ctrl + 1-0`

= 7. 설정 및 환경설정

== 테마 및 외관
- 설정 열기
  - macOS: `Cmd + ,`
  - Windows/Linux: `Ctrl + ,`
- 키보드 단축키 설정
  - macOS: `Cmd + Shift + ,`
  - Windows/Linux: `Ctrl + Shift + ,`
- 테마 변경
  - macOS: `Cmd + Option + T`
  - Windows/Linux: `Ctrl + Alt + T`
- 투명도 조절
  - macOS: `Cmd + Shift + I`
  - Windows/Linux: `Ctrl + Shift + I`

== 프로필 관리
- 새 프로필 세션 시작
  - macOS: `Cmd + Shift + N`
  - Windows/Linux: `Ctrl + Shift + Alt + N`
- 프로필 전환
  - macOS: `Cmd + Option + P`
  - Windows/Linux: `Ctrl + Alt + P`
- 세션 데이터 삭제
  - macOS: `Cmd + Shift + Delete`
  - Windows/Linux: `Ctrl + Shift + Delete`

= 8. 고급 기능

== 개발자 도구
- 개발자 도구 열기
  - macOS: `Cmd + Option + I`
  - Windows/Linux: `Ctrl + Shift + I`
- JS 콘솔 열기
  - macOS: `Cmd + Shift + J`
  - Windows/Linux: `Ctrl + Shift + J`

== 디버깅
- 디버그 모드 토글
  - macOS: `Cmd + Shift + D`
  - Windows/Linux: `Ctrl + Shift + Alt + D`
- 로그 레벨 변경
  - macOS: `Cmd + Option + L`
  - Windows/Linux: `Ctrl + Alt + L`

== 익스포트
- 현재 세션 내보내기
  - macOS: `Cmd + E`
  - Windows/Linux: `Ctrl + E`
- 블록 이미지 내보내기
  - macOS: `Cmd + Shift + E`
  - Windows/Linux: `Ctrl + Shift + E`
- HTML 내보내기
  - macOS: `Cmd + Option + E`
  - Windows/Linux: `Ctrl + Alt + E`

= 9. 시스템 통합

== 파일 관리
- 파일 탐색기 현재 디렉토리 열기
  - macOS: `Cmd + Option + O` (Finder)
  - Windows: `Ctrl + Alt + O` (File Explorer)
  - Linux: `Ctrl + Alt + O` (파일 관리자)
- 파일 선택 대화상자
  - macOS: `Cmd + Shift + O`
  - Windows/Linux: `Ctrl + Shift + O`
- VS Code 현재 디렉토리 열기
  - macOS: `Cmd + Option + R`
  - Windows/Linux: `Ctrl + Alt + R`

== 시스템 명령어 (OS별 차이)
- 앱 전환
  - macOS: `Cmd + Tab`
  - Windows: `Alt + Tab`
  - Linux: `Alt + Tab`
- 강제 종료
  - macOS: `Cmd + Option + Esc`
  - Windows: `Ctrl + Alt + Delete`
  - Linux: `Ctrl + Alt + T` (시스템 모니터)

= 10. 접근성 및 편의 기능

== 화면 확대/축소
- 확대/축소
  - macOS: `Cmd + =/Cmd + -`
  - Windows/Linux: `Ctrl + =/Ctrl + -`
- 기본 크기 복원
  - macOS: `Cmd + 0`
  - Windows/Linux: `Ctrl + 0`
- 마우스 휠 확대/축소
  - macOS: `Cmd + Scroll`
  - Windows/Linux: `Ctrl + Scroll`

== 접근성 (macOS 전용)
- VoiceOver 토글: `Cmd + F5`
- 확대/축소 토글: `Cmd + Option + 8`

== 도움말
- 도움말 메뉴
  - macOS: `Cmd + ?`
  - Windows/Linux: `F1`
- 단축키 도움말
  - macOS: `Cmd + Shift + ?`
  - Windows/Linux: `Ctrl + Shift + ?`

= 11. 프로세스 제어 (공통)

== 프로세스 제어
- `Ctrl + C`: 명령어 중단 (SIGINT)
- `Ctrl + Z`: 프로세스 일시 정지 (SIGTSTP)
- `Ctrl + D`: EOF 전송 (로그아웃)
- `Ctrl + \`: 프로세스 강제 종료 (SIGQUIT)

== 출력 제어
- `Ctrl + S`: 출력 일시 정지
- `Ctrl + Q`: 출력 재개
- `Ctrl + L`: 화면 지우기

= 12. OS별 특수 기능

== macOS 전용
- Spotlight 검색: `Cmd + Space`
- Mission Control: `F3`
- Launchpad: `F4`
- 알림 센터: 트랙패드 오른쪽 끝 왼쪽 스와이프

== Windows 전용
- 시작 메뉴: `Win`
- 작업 관리자: `Ctrl + Shift + Esc`
- 가상 데스크톱: `Win + Tab`
- 실행: `Win + R`

== Linux 전용
- 앱 메뉴: `Alt + F1` 또는 `Super`
- 시스템 모니터: `Ctrl + Alt + Delete`
- 터미널: `Ctrl + Alt + T`
- 작업 공간 전환: `Ctrl + Alt + ←/→`

= 13. 사용자 정의 설정

Warp 설정을 통해 커스터마이징 가능:

- 단축키 재할당
- 테마 및 색상
- 글꼴 및 크기
- AI 기능
- 워크플로우
- 플러그인 및 확장

설정 접근:
- macOS: `Cmd + ,`
- Windows/Linux: `Ctrl + ,`

= 14. 실용적인 팁

== 효율적 사용법
- 블록 기반 탐색 활용
- AI 이용 명령어 생성 및 설명
- 워크플로우 활용 자동화
- 북마크 자주 사용하는 명령어 실행
- 필터링 특정 결과 확인

== 성능 최적화
- 히스토리 정리로 검색 속도 향상
- 테마 설정으로 눈의 피로 감소
- 단축키 활용 마우스 최소화
