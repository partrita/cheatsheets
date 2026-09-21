#import "../templates/conf.typ": *

#show: template.with(
  title: "PyMOL 치트시트",
  header: [최종 업데이트: #datetime.today().display()],
  footer: "PyMOL Reference & Command Cheat Sheet",
)

= 모드 및 파일 불러오기 (Modes & Loading Files)
- 도움말 확인: `help <keyword>`
- 파일 로드: `load data/test/pept.pdb`
- PDB ID로 직접 다운로드 및 로드: `fetch 1ake` (또는 `fetch 1ake, type=cif`)
- 터미널에서 로드: `pymol data/test/pept.pdb`
- 텍스트 및 그래픽 화면 전환: `Esc`
- Y축 회전 전환 (Rocking): `rock`
- 입체 화면 전환 (Stereo): `stereo on` / `stereo off`
- 입체 유형 설정: `stereo crosseye` / `walleye` / `quadbuffer`
- 작업 취소: `undo`
- 화면 초기화 (뷰 리셋): `reset`
- PyMOL 재초기화 (전체 초기화): `reinitialize`
- 프로그램 강제 종료: `quit`

= 마우스 조작 (Mouse Control)
== 마우스 3버튼 조작 모드 (3-Button Viewing)
#bordered-table(
  columns: 5,
  [조합], [L (Left)], [M (Middle)], [R (Right)], [Wheel],
  [기본], [회전 (Rota)], [이동 (Move)], [Z축 이동 (MovZ)], [Slab 조정],
  [Shift], [+Box (선택 추가)], [-Box (선택 제외)], [Clip (클리핑)], [MovS (슬래브 이동)],
  [Ctrl], [+/- (선택 반전)], [PkAt (원자 피킹)], [Pk1 (단일 피킹)], [--],
  [CtSh], [Sele (박스 선택)], [Cent (화면 중심)], [Menu (컨텍스트 메뉴)], [--],
  [DblClk], [Menu (메뉴 호출)], [Cent (중심 이동)], [PkAt (원자 피킹)], [--],
)
- 회전 중심 설정: `origin <selection>` (예: `origin /pept//a`)

= 기본 명령어 (Basic Commands)
== 화면 제어 및 뷰포트
- 선택 영역으로 화면 채우기: `zoom /pept//a`
- 선택 영역 화면 중앙 정렬: `center /pept//a`
- 배경 색상 설정: `bg_color white` / `bg_color black`
- 뷰포트 크기 변경 (pts): `viewport 640, 480`
- 선택 영역 회전: `rotate <axis>, <angle>, <selection>` (예: `rotate y, 90, pept`)
- 선택 영역 좌표 이동: `translate [<x>, <y>, <z>], <selection>`

== 분자 표현 형태 (Representations)
- 전체 숨기기: `hide all` (또는 `hide everything`)
- Lines (선 형태): `show lines, /pept`
- Sticks (스틱 형태): `show sticks, a//`
- Cartoon (카툰 형태): `show cartoon, a//` (또는 `show cartoon automatic, a//`)
- Spheres (vdW 구형 형태): `show spheres, 156/ca`
- Surface (표면 형태): `show surface, /pept`
- Mesh (메쉬 표면): `show mesh, /pept`
- Dots (점 형태 표면): `show dots, /pept`
- Ribbon (리본 형태): `show ribbon, /pept`
- Nonbonded (비공유 원자): `show nonbonded, /pept`
- Nb Spheres (비공유 구형): `show nb_spheres, /pept`
- 특정 표현만 설정: `as cartoon, pept` (`show` 및 기타 숨김 동시 적용)

== 색상 지정 (Coloring)
- 선택 영역 색상 변경: `color pink, /pept//a` (또는 `colour`)
- 색상 다시 적용: `recolor`
- 원소별 기본 색상 적용 (탄소 기준): `util.cbaw`, `util.cbag`, `util.cbac`, `util.cbak`
- B-factor / pLDDT 기반 색상: `spectrum b, rainbow_rev, minimum=50, maximum=90`
- 2차 구조별 색상: `color red, ss h` (나선), `color yellow, ss s` (시트), `color green, ss l+""` (루프)

= 원자 선택 문법 (Atom Selection)
기본 형식: `object-name/segi-id/chain-id/resi-id/name-id`

== 선택 계층 구조 예시
- 분자 시스템 선택: `/pept`
- 분자 세그먼트 선택: `/pept/lig`
- 사슬(Chain) 선택: `/pept/lig/a` 또는 `chain a`
- 잔기(Residue) 선택: `/pept/lig/a/10` 또는 `resi 10`
- 특정 원자 선택: `/pept/lig/a/10/ca` 또는 `name ca`
- 잔기 범위 선택: `lig/a/10-12/ca` 또는 `resi 10-12`
- 사슬 및 잔기/원자 범위 선택: `a/6+8/c+o`
- 누락된 요소 선택 (공백 슬래시): `/pept//a` (pept 내 모든 a 사슬)

== 선택 명령어 및 연산자
- 선택 영역 이름 지정: `select bb, name c+o+n+ca`
- 선택 영역 원자 수 세기: `count_atoms bb`
- 선택 영역에서 원자 제거: `remove resi 5` / `remove hydro` / `remove solvent`
- 기타 선택 키워드: `all`, `none`, `hydro`, `hetatm`, `visible`, `present`, `solvent`, `polymer`
- 특정 영역 제외 선택: `select sidechains, ! bb`
- 거리 기반 선택:
  - vdW 간격 3 Å 미만 원자 선택: `resi 6 around 3`
  - 간격 1.0 Å 미만 원자 중심 선택: `resi 6 near 1`
  - 4.0 Å 이내 원자 중심 선택: `within 4 of resi 6`
  - 주변 전체 잔기 선택: `byres (ligand around 5.0)`
  - 잔기 확장 선택: `expand 4, resi 6`

= 카툰 설정 (Cartoon Settings)
== 카툰 스타일 커스터마이징
- 원통형 나선 설정: `set cartoon_cylindrical_helices, 1`
- 입체형 가장자리 나선 설정: `set cartoon_fancy_helices, 1`
- 평면 시트 설정: `set cartoon_flat_sheets, 1`
- 매끄러운 루프 설정: `set cartoon_smooth_loops, 1`
- 고리 구조 탐색: `set cartoon_ring_finder, [1,2,3,4]`
- 고리 모드 설정: `set cartoon_ring_mode, [1,2,3]`
- 핵산 모드 설정: `set nucleic_acid_mode, [0,1,2,3,4]`
- 곁사슬 재구성 보조 설정: `set cartoon_side_chain_helper, 1; rebuild`
- 1차 색상 설정: `set cartoon_color, blue`
- 2차 색상 설정: `set cartoon_highlight_color, grey`
- 2차 구조별 색상 제한: `set cartoon_discrete_colors, on`
- 투명도 설정: `set cartoon_transparency, 0.5`

== 카툰 형태 보기
- 루프 형태 보기: `show cartoon loop, a//`
- 직사각형 형태 보기: `show cartoon rect, a//`
- 타원형 형태 보기: `show cartoon oval, a//`
- 튜브 형태 보기: `show cartoon tube, a//`
- 화살표 형태 보기: `show cartoon arrow, a//`
- 덤벨 형태 보기: `show cartoon dumbbell, a//`

= 측정, 수소결합 및 라벨 (Hydrogen Bonding & Labels)
== 거리 및 결합 측정
- 원자 간 직선/거리 측정: `distance dist01, 542/oe1, 538/ne`
- 각도 측정: `angle ang01, 542/oe1, 542/cd, 542/cg`
- 이면각 측정: `dihedral dih01, 1/n, 1/ca, 1/c, 2/n`
- 점선 간격 설정: `set dash_gap, 0.09`
- 점선 굵기 설정: `set dash_width, 3.0`
- 점선 반경 설정: `set dash_radius, 0.0`
- 점선 길이 설정: `set dash_length, 0.15`
- 점선 둥근 모서리 설정: `set dash_round_ends, on`
- 라벨 숨기기: `hide labels, dist01`

== 텍스트 라벨 (Labels)
- 잔기/원자 라벨 표시: `label (542/oe1), "%s" % ("E542")`
- 아미노산 3문자+번호 라벨: `label name ca, "%s%s" % (resn, resi)`
- 라벨 글꼴 설정: `set label_font_id, 4`
- 라벨 글꼴 크기: `set label_size, 14`
- 라벨 색상 설정: `set label_color, white`
- 라벨 윤곽선 색상: `set label_outline_color, black`

= 정전기 및 표면 (Electrostatics & Surfaces)
- 정전기 표면 생성 (GUI 조작): `Action > generate > vacuum electrostatics > protein contact potential`
- APBS 플러그인 이용: `Plugin > APBS Electrostatics`
- 표면 투명도 설정: `set transparency, 0.5`
- 표면 색상 설정: `set surface_color, white, pept`
- 캐비티 표면 탐색 모드: `set surface_cavity_mode, 1`

= 이미지 출력 및 렌더링 (Image Output)
- 저해상도 렌더링: `ray`
- 고해상도 렌더링: `ray 2000, 2000`
- 초고해상도 렌더링: `ray 5000, 5000`
- 기본 크기 변경 (pts): `viewport 640, 480`
- 그림자 효과 제어: `set ray_shadow, 0`
- 안개(fog) 효과 제어: `set ray_trace_fog, 0`
- 입체감 깊이 제어: `set depth_cue, 0`
- 안티앨리어싱 제어: `set antialias, 1`
- 투명 배경 활성화: `set ray_opaque_background, off`
- PNG 파일 내보내기: `png image.png, dpi=300`

= 동영상 및 애니메이션 (PyMOL Movies)
== 재생 및 타임라인 제어
- 동영상 재생: `mplay`
- 동영상 정지: `mstop`
- 시작 지점으로 이동: `rewind`
- 중간 지점으로 이동: `middle`
- 끝 지점으로 이동: `ending`
- 한 프레임 앞으로 이동: `forward`
- 한 프레임 뒤로 이동: `backwards`
- 특정 프레임 표시: `frame <number>`
- 현재 프레임 확인: `get_frame`
- 동영상 캐시 삭제: `mclear`
- 초당 프레임 수 재설정: `meter_reset`
- 현재 동영상 명령 덤프: `mdump`

== 카메라 이동 및 프레임 스크립트
- 카메라 평면 이동: `move x, 10`
- 카메라 회전: `turn x, 90` / `turn y, 90`
- 프레임 내 명령 실행: `mdo 1, turn x, 5; turn y, 5;`
- PNG 파일 일괄 내보내기: `mpng <prefix> [, first [, last]]`

= 구조 중첩 및 세션 관리 (Alignment & Sessions)
- 서열 기반 구조 정렬: `align mobile, target`
- 서열 비의존 3D 구조 중첩: `super mobile, target`
- CE 구조 정렬 알고리즘: `cealign target, mobile`
- 지정 원자 쌍 일치: `pair_fit sele1, sele2`
- 세션 파일 저장: `save session.pse`
- PDB 파일 내보내기: `save molecule.pdb, <selection>`
- PyMOL 스크립트 실행: `@script.pml` 또는 `run script.py`
