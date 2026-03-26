#import "./templates/conf.typ": *

#show: template.with(
  title: "Windows cmd 치트시트",
  header: [#datetime.today().display()],
  footer: "",
)

= 1. 파일 및 디렉토리 관리

- `dir`: 현재 디렉토리 파일/디렉토리 목록 표시
  - `/a:[attributes]`: 특정 속성 파일 표시 (예: `/ah` 숨김 파일, `/ad` 디렉토리)
  - `/o:[sortorder]`: 지정 순서 정렬 (예: `/on` 이름순, `/os` 크기순, `/od` 날짜순)
  - `/b`: 기본 형식(경로 정보 없음) 표시
  - `/s`: 하위 디렉토리 파일까지 모두 표시
- `cd` 또는 `chdir`: 현재 작업 디렉토리 변경/표시
  - `cd ..`: 상위 디렉토리 이동
  - `cd C:\Users`: 특정 경로 이동
  - `cd`: 현재 디렉토리 경로 표시
  - `cd /d [drive:][path]`: 드라이브 및 디렉토리 동시 변경
- `mkdir` 또는 `md`: 새 디렉토리 생성
  - `mkdir C:\A\B\C`: 중간 디렉토리 없을 시 오류 발생
- `rmdir` 또는 `rd`: 비어있는 디렉토리 삭제
  - `/s`: 지정 디렉토리 및 모든 하위 파일/디렉토리 삭제
  - `/q`: 조용한 모드. 삭제 확인 프롬프트 생략
- `del` 또는 `erase`: 하나 이상의 파일 삭제
  - `/p`: 삭제 전 확인 메시지 표시
  - `/f`: 읽기 전용 파일 강제 삭제
  - `/s`: 지정 디렉토리 및 모든 하위 디렉토리 파일 삭제
  - `/q`: 조용한 모드
- `copy`: 파일 복사
  - `copy file1.txt + file2.txt newfile.txt`: 여러 파일 병합
  - `/y`: 대상 파일 존재 시 확인 생략
- `xcopy`: 파일 및 디렉토리 트리 복사
  - `/s`: 비어 있지 않은 하위 디렉토리 포함 복사
  - `/e`: 비어 있는 디렉토리 포함 모든 하위 디렉토리 복사
  - `/h`: 숨김 및 시스템 파일 포함 복사
- `robocopy`: 강력한 파일 복사 유틸리티
  - `robocopy <source> <destination> /mir`: 원본-대상 미러링 (원본에 없는 파일 삭제)
- `move`: 파일 이동
- `ren` 또는 `rename`: 파일/디렉토리 이름 변경
- `type`: 텍스트 파일 내용 표시
- `find`: 파일 내 문자열 검색
- `findstr`: 정규 표현식 지원 문자열 검색 도구



= 2. 시스템 정보 및 네트워크 관리

- `cls`: 화면 지우기
- `systeminfo`: 시스템 상세 정보 표시
- `ver`: Windows 버전 표시
- `driverquery`: 장치 드라이버 목록/속성 표시
  - `-v`: 상세 정보 표시
- `getmac`: MAC 주소 표시
- `whoami`: 현재 사용자 정보 표시 (`/groups` 그룹, `/priv` 권한)
- `ipconfig`: 네트워크 어댑터 IP 구성 표시
  - `/all`: 상세 구성(MAC, DNS 등) 표시
  - `/release`: IP 주소 해제
  - `/renew`: IP 주소 갱신
  - `/flushdns`: DNS 캐시 비우기
- `ping <host>`: 네트워크 연결 테스트
  - `-t`: 중지 전까지 계속 실행
  - `-n <count>`: 지정 횟수만큼 실행
- `tracert <host>`: 호스트 경로 추적 및 지연 시간 표시
- `pathping <host>`: 경로 노드별 패킷 손실 정보 제공
- `netstat`: 활성 연결, 포트, 통계 표시
  - `-a`: 모든 연결 및 포트 표시
  - `-n`: 주소/포트 번호 숫자 표시
  - `-o`: 프로세스 ID(PID) 표시
  - `-b`: 실행 파일 표시 (관리자 권한 필수)
- `nslookup <domain>`: DNS 서버 쿼리 및 정보 획득

= 3. 프로세스 및 서비스 관리

- `tasklist`: 실행 중인 프로세스 목록 표시
  - `/svc`: 호스팅 서비스 표시
  - `/m <module>`: 특정 DLL 사용 프로세스 검색
- `taskkill`: 프로세스 종료
  - `/pid <processid>`: PID로 종료
  - `/im <imagename>`: 이름으로 종료
  - `/f`: 강제 종료
  - `/t`: 자식 프로세스 포함 종료
- `sc`: 서비스 제어 명령
  - `sc query`: 모든 서비스 상태 표시
  - `sc query <servicename>`: 특정 서비스 상태 표시
  - `sc start <servicename>`: 서비스 시작
  - `sc stop <servicename>`: 서비스 중지
  - `sc config <servicename> start= <boot|system|auto|demand|disabled>`: 시작 유형 변경
- `sfc /scannow`: 시스템 파일 무결성 검사 및 복구
- `chkdsk`: 파일 시스템 오류 검사 및 수정
  - `/f`: 오류 수정
  - `/r`: 불량 섹터 검출 및 복구

= 4. 기타 유용한 명령어

- `powershell`: PowerShell 시작
- `runas /user:<username> <command>`: 다른 사용자 권한으로 실행
- `gpupdate /force`: 그룹 정책 강제 업데이트
- `shutdown`: 종료/재시작
  - `/s`: 종료
  - `/r`: 재시작
  - `/t <seconds>`: 지정 시간(초) 후 실행
  - `/a`: 예약 취소
  - `/hybrid`: 빠른 시작 모드 종료
- `assoc`: 확장자-파일 형식 연결 표시/수정
- `ftype`: 파일 형식 열기 명령 표시/수정
- `powercfg`: 전원 설정 및 절전 모드 제어
  - `powercfg /list`: 전원 관리 옵션 나열
  - `powercfg /hibernate on|off`: 최대 절전 모드 토글
  - `powercfg /energy`: 에너지 효율성 분석 보고
- `wevtutil`: 이벤트 로그 검색
  - `wevtutil qe System /c:1 /rd:true /f:text`: 시스템 로그 최근 이벤트 표시
