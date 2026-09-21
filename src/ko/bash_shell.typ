#import "../templates/conf.typ": *

#show: template.with(
  title: "Bash 스크립팅 핵심 치트시트",
  header: [최종 업데이트: #datetime.today().display()],
  footer: "Bash Shell Scripting & Parameter Expansion Cheat Sheet",
)

= 기본 문법 및 변수 (Variables & Quotes)

```bash
#!/usr/bin/env bash
name="John"
echo "Hello $name!"
```

== 변수와 따옴표 규칙
- `name="John"` : 변수 할당 (등호 앞뒤 공백 금지)
- `"$name"` / `"${name}!"` : 큰따옴표 (변수 및 명령 치환 허용)
- `'Hi $name'` : 작은따옴표 (리터럴 문자열 그대로 유지)
- `cp -$options $wildcard /tmp` : 와일드카드 전개 시 따옴표 제외

== 셸 실행 및 조건부 실행
- `$(pwd)` : 명령어 치환 (과거 백틱 `` `pwd` `` 대비 권장)
- `git commit && git push` : 앞 명령 성공 시에만 뒤 명령 실행
- `git commit || echo "실패"` : 앞 명령 실패 시 뒤 명령 실행

== 엄격 모드 (Strict Mode)
```bash
set -euo pipefail
IFS=$'\n\t'
```

= 중괄호 확장 (Brace Expansion)

- `{A,B}.js` -> `A.js B.js`
- `{1..5}` -> `1 2 3 4 5`
- `{5..50..5}` -> `5 10 15 ... 50` (증감폭 지정)
- `{{1..3},{7..9}}` -> `1 2 3 7 8 9`

= 매개변수 확장 (Parameter Expansions)

== 슬라이싱 및 길이
- `${name:0:2}` / `${name::2}` : 0번 인덱스부터 2글자 (`"Jo"`)
- `${name::-1}` : 뒤에서 1글자 제외 (`"Joh"`)
- `${name:(-1)}` : 맨 뒤 1글자 (`"n"`)
- `${name:(-2):1}` : 뒤에서 2번째 글자부터 1글자 (`"h"`)
- `${#name}` : 문자열 길이

== 경로 추출 및 패턴 치환
- `src="/path/to/foo.cpp"`
- `${src%.cpp}` -> `/path/to/foo` (확장자 제거)
- `${src%/*}` -> `/path/to` (디렉토리 경로)
- `${src##*/}` -> `foo.cpp` (파일명/베이스 경로)
- `${src##*.}` -> `cpp` (확장자만 추출)
- `${src/foo/bar}` : 첫 번째 일치 항목 치환
- `${src//foo/bar}` : 모든 일치 항목 치환
- `${src/#foo/bar}` : 접두사 일치 치환
- `${src/%foo/bar}` : 접미사 일치 치환

== 대소문자 변환 & 기본값 (Defaults)
- `${str,}` / `${str,,}` : 첫 글자 / 전체 소문자 변환
- `${str^}` / `${str^^}` : 첫 글자 / 전체 대문자 변환
- `${foo:-val}` : `foo`가 미설정이거나 null이면 `val` 반환
- `${foo:=val}` : `foo`가 미설정이면 `val`로 할당 후 반환
- `${foo:+val}` : `foo`가 설정되어 있으면 `val` 반환
- `${foo:?msg}` : `foo`가 미설정이면 에러 메시지 출력 후 스크립트 종료
- `${!prefix_*}` : 접두사로 시작하는 모든 변수 이름 목록
- `${!pointer}` : 간접 참조(Indirection)

= 조건문 및 비교 연산 (Conditionals)

== 조건식 (`[[ ... ]]` vs `(( ... ))`)
- 문자열 검사: `[[ -z "$str" ]]` (빈 문자열), `[[ -n "$str" ]]` (비어있지 않음)
- 문자열 비교: `[[ "$a" == "$b" ]]`, `[[ "$a" != "$b" ]]`, `[[ "$str" =~ ^[0-9]+$ ]]` (정규식)
- 산술 비교: `(( a < b ))`, `(( a >= b ))` 또는 `[[ $a -eq $b ]]`, `[[ $a -ne $b ]]`, `[[ $a -lt $b ]]`, `[[ $a -gt $b ]]`
- 파일 검사:
  - `[[ -e FILE ]]`: 존재 여부
  - `[[ -f FILE ]]`: 일반 파일
  - `[[ -d FILE ]]`: 디렉토리
  - `[[ -s FILE ]]`: 크기 > 0 바이트
  - `[[ -r FILE ]]`, `[[ -w FILE ]]`, `[[ -x FILE ]]`: 읽기/쓰기/실행 권한
  - `[[ -h FILE ]]`: 심볼릭 링크
  - `[[ F1 -nt F2 ]]`: F1이 F2보다 최신 파일
  - `[[ F1 -ef F2 ]]`: 동일한 하드링크/파일

== Case / Switch 문
```bash
case "$1" in
  start | up) vagrant up ;;
  stop) vagrant halt ;;
  *) echo "사용법: $0 {start|stop}" ;;
esac
```

= 반복문 (Loops)

== For & While
```bash
# 기본 및 C 스타일 루프
for i in /etc/rc.*; do echo "$i"; done
for ((i = 0; i < 100; i++)); do echo "$i"; done

# 한 줄씩 파일 읽기 (안전한 read)
while read -r line; do
  echo "$line"
done < file.txt
```

= 함수 및 특수 변수 (Functions & Arguments)

```bash
myfunc() {
  local myresult="결과"
  echo "$myresult $1"
  return 0
}
result=$(myfunc "전달값")
```

== 특수 매개변수
- `$#` : 전달된 인자 개수
- `$*` : 모든 인자를 하나의 단어로 결합 (`"$*"`)
- `$@` : 모든 인자를 개별 단어로 분리 (`"$@"`)
- `$?` : 마지막 실행 명령어 종료 상태 (0: 성공)
- `$$` : 현재 셸의 PID
- `$!` : 최근 백그라운드 작업 PID
- `$0` : 실행 스크립트 경로
- `$_` : 이전 명령의 마지막 인자
- `${PIPESTATUS[@]}` : 파이프라인의 각 명령 종료 상태 배열

= 배열 및 연관 배열 (Arrays & Dictionaries)

== 배열 (Arrays)
```bash
Fruits=('Apple' 'Banana' 'Orange')
Fruits+=('Watermelon')         # 요소 추가 (Push)
echo "${Fruits[0]}"            # 첫 번째 요소
echo "${Fruits[-1]}"           # 마지막 요소
echo "${Fruits[@]}"            # 전체 요소
echo "${#Fruits[@]}"           # 전체 길이
echo "${!Fruits[@]}"           # 전체 인덱스
unset Fruits[1]                # 요소 제거
```

== 연관 배열 (Dictionaries)
```bash
declare -A sounds
sounds[dog]="bark"
sounds[cow]="moo"

echo "${sounds[dog]}"
for key in "${!sounds[@]}"; do
  echo "$key 소리: ${sounds[$key]}"
done
```

= 입출력 리다이렉션 & 치환 (Redirection & Process)

- `cmd > file` : 표준 출력(stdout) 덮어쓰기
- `cmd >> file` : stdout 이어쓰기
- `cmd 2> err.log` : 표준 에러(stderr) 저장
- `cmd 2>&1` / `cmd &> file` : stdout과 stderr 병합 출력
- `cmd > /dev/null 2>&1` / `cmd &> /dev/null` : 모든 출력 버리기
- `cmd < file.txt` : 파일에서 stdin 읽기
- `cat << 'EOF'` : 다중 라인 Heredoc
- `tr '[:lower:]' '[:upper:]' <<< "문자열"` : Herestring
- `diff <(ls dir1) <(ls dir2)` : 프로세스 치환 (결과를 파일처럼 취급)

= 셸 옵션 및 에러 트랩 (Options & Trap)

- `set -o noclobber` : 기존 파일 덮어쓰기 방지
- `set -o errexit` (`-e`) : 에러 발생 시 즉시 중단
- `set -o pipefail` : 파이프라인 중간 에러 감지
- `set -o nounset` (`-u`) : 선언되지 않은 변수 참조 시 에러
- `shopt -s globstar` : `**` 재귀적 디렉토리 글로빙 활성화
- `shopt -s nullglob` : 일치하지 않는 패턴을 빈 문자열로 처리
- `trap 'echo $LINENO번째 줄에서 오류 발생' ERR` : 에러 포착 트랩
- `cd -` : 이전 작업 디렉토리로 복귀
