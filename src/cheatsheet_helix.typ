#import "./templates/conf.typ": *

#show: template.with(
  title: "Helix 치트시트",
  header: [#datetime.today().display()],
  footer: "",
)

= 기본 개념
Helix는 Vim과 유사한 모달 편집기이지만, Kakoune에서 영감을 받은 '객체-동사' 모델을 사용합니다. 먼저 선택(객체)을 하고, 그 다음 동작(동사)을 수행합니다.

= 모드
- `Normal` (기본 모드): `esc` 키로 진입. 이동 및 조작 명령.
- `Insert`: `i` (앞), `a` (뒤), `o` (아래 줄), `O` (윗 줄)로 진입. 텍스트 입력.
- `Select`: `v`로 진입. 텍스트 선택. Normal 모드의 대부분의 이동키를 사용하여 선택 영역 확장/축소.

= 필수 명령어 (Normal 모드)
- `:q`: 종료 (변경사항이 있으면 실패)
- `:q!`: 강제 종료
- `:w`: 저장
- `:wq`: 저장 후 종료
- `:o <filename>`: 파일 열기
- `:h`: 도움말 열기
- `esc`: 모든 모드에서 Normal 모드로 전환

= 이동
- `h`, `j`, `k`, `l`: 좌, 하, 상, 우
- `w`, `b`: 다음/이전 단어로 이동
- `f`, `t`: 특정 문자로 이동 (f: 위로, t: 전까지)
- `gg`, `ge`: 파일 시작/끝으로 이동
- `m`: 매치되는 괄호로 이동
- `Alt-o`, `Alt-i`: 이전/다음 점프리스트 위치로 이동
- `Ctrl-o`, `Ctrl-i`: 이전/다음 변경 위치로 이동

= 선택 (Select 모드)
- `v`: 선택 모드 시작
- `x`: 현재 줄 선택
- `i` + `object` 또는 `a` + `object`: 텍스트 객체 선택
  - `iw`: 현재 단어 (inner word)
  - `aw`: 현재 단어 + 공백 (a word)
  - `i"`: 따옴표 안의 내용
  - `a"`: 따옴표를 포함한 내용
  - `ip`, `ap`: 문단
  - `i)`, `i]`, `i}`: 괄호 안의 내용
- `s`: 정규식으로 선택 영역 분할
- `,`: 선택 영역 유지 및 커서 위치 변경

= 편집 (Normal 모드)
- `d`: 선택 영역 삭제 (delete)
- `c`: 선택 영역 삭제 후 Insert 모드로 전환 (change)
- `y`: 선택 영역 복사 (yank)
- `p`: 커서 뒤에 붙여넣기 (paste)
- `P`: 커서 앞에 붙여넣기
- `r`: 문자를 다른 문자로 교체
- `.` (점): 마지막 변경 사항 반복
- `u`: 실행 취소 (undo)
- `U`: 다시 실행 (redo)
- `>` / `<`: 들여쓰기 / 내어쓰기
- `g` + `command`:
  - `gd`: 정의로 이동 (go to definition)
  - `gr`: 참조 찾기 (go to references)
  - `gy`: 타입 정의로 이동 (go to type definition)
  - `ga`: 코드 액션 (code action)

= Space 키 메뉴 (강력한 기능)
- `space-f`: 파일 피커 열기 (file picker)
- `space-s`: 작업 공간 심볼 피커 (workspace symbol)
- `space-d`: 진단 정보 피커 (diagnostics)
- `space-S`: 선택 모드에서 정렬 (sort)
- `space-k`: 호버 정보 표시 (LSP)
- `space-r`: 이름 변경 (rename)
- `space-w`: 작업 공간 메뉴
- `space-?`: 명령어 검색

= 다중 커서
- `C`: 선택 영역의 각 줄 끝에 커서 추가
- `Alt-c`: 다음 일치 항목에 커서 추가/선택
- `Alt-x`: 다음 일치 항목 건너뛰기
- `s`: 정규식으로 선택 영역을 분할하여 다중 커서 생성
- `i` 또는 `a`: 다중 커서 상태에서 Insert 모드로 전환하여 동시에 편집
