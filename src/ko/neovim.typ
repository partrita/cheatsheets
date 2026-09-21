#import "../templates/conf.typ": *

#show: template.with(
  title: "Neovim 치트시트",
  header: [#datetime.today().display()],
  footer: "https://neovim.io/doc/",
)

= 핵심 개념

Neovim은 확장성이 뛰어난 모달(Modal) 텍스트 에디터입니다. 내장 LSP, Lua 설정 환경, Tree-sitter 연동, 내장 패키지 관리자를 제공합니다.

- *모달 편집*: 일반(이동/명령), 입력(작성), 비주얼(선택), 커맨드(실행).
- *Lua 기반*: `~/.config/nvim/init.lua` 파일로 전체 설정 관리.
- *내장 LSP 및 Treesitter*: 외부 의존성 없는 IDE 기능과 고성능 구문 분석.
- *내장 패키지 관리자*: Neovim 0.12+ 내장 `vim.pack`으로 플러그인 직접 관리.

= 필수 탐색 및 이동

== 빠른 커서 이동
- `h j k l`: 왼쪽 / 아래 / 위 / 오른쪽
- `w` / `b`: 다음 / 이전 단어의 시작으로 이동
- `e` / `ge`: 현재 / 이전 단어의 끝으로 이동
- `0` / `^` / `\$`: 줄 맨 앞 / 첫 글자(공백 제외) / 줄 맨 끝
- `gg` / `G`: 문서 첫 줄 / 마지막 줄로 이동
- `:<N>` 또는 `<N>G`: N번째 줄로 직접 이동
- `%`: 짝이 맞는 괄호 `()`, `{}`, `[]`로 이동
- `f<문자>` / `F<문자>`: 현재 줄에서 특정 문자로 전방 / 후방 이동 (`;` 다음, `,` 이전)
- `t<문자>` / `T<문자>`: 특정 문자 바로 앞까지 전방 / 후방 이동
- `Ctrl-d` / `Ctrl-u`: 반 페이지 아래 / 위로 스크롤
- `zz` / `zt` / `zb`: 현재 커서 줄을 화면 중앙 / 상단 / 하단으로 정렬

== 점프 리스트 및 마크
- `Ctrl-o` / `Ctrl-i`: 이전 / 다음 커서 위치로 점프
- `g;` / `g,`: 이전 / 다음 편집 위치로 점프
- `m<a-z>`: 현재 위치에 로컬 마크 설정
- `'<a-z>` / `` `<a-z>` ``: 지정 마크의 줄 / 정확한 위치로 이동
- `''`: 직전 점프 전 위치로 복귀

= 고빈도 핵심 편집

== 입력 모드 전환
- `i` / `I`: 커서 앞 / 줄 맨 앞에서 입력 시작
- `a` / `A`: 커서 뒤 / 줄 맨 끝에서 입력 시작
- `o` / `O`: 현재 줄 아래 / 위에 새 줄 만들고 입력 시작
- `s` / `S`: 한 글자 지우고 입력 / 한 줄 전체 지우고 입력
- `C`: 커서부터 줄 끝까지 삭제 후 입력 시작 (`c\$`)
- `D`: 커서부터 줄 끝까지 삭제 (`d\$`)

== 연산자 + 모션 (`d`, `c`, `y`)
- `dd` / `yy`: 현재 줄 잘라내기(삭제) / 복사(Yank)
- `cc`: 현재 줄 전체 지우고 입력 시작
- `p` / `P`: 커서 뒤 / 앞에 붙여넣기
- `x`: 한 글자 삭제
- `r<문자>`: 한 글자 즉시 변경
- `~`: 커서 위치 문자 대소문자 전환
- `>` / `<`: 들여쓰기 / 내어쓰기 (`>>` / `<<` 현재 줄)
- `==`: 현재 줄 자동 인덴트 (`gg=G` 파일 전체 정렬)
- `.`: *직전 편집 명령 반복* (가장 강력한 기본 기능)

== 필수 텍스트 오브젝트 (Text Objects)
연산자와 조합: `d`(삭제), `c`(변경), `y`(복사), `v`(선택).
- `ciw` / `diw` / `yiw`: 단어 내부(공백 제외) 변경 / 삭제 / 복사
- `caw` / `daw`: 공백 포함 단어 전체 변경 / 삭제
- `ci"` / `ca"`: 큰따옴표 안쪽 / 따옴표 포함 전체
- `ci'` / `ca'`: 작은따옴표 안쪽 / 따옴표 포함 전체
- `ci(` / `ca(`: 괄호 안쪽 / 괄호 포함 전체 (`cib` / `cab` 동일)
- `ci{` / `ca{`: 중괄호 안쪽 / 중괄호 포함 전체 (`ciB` / `caB` 동일)
- `ci[` / `ca[`: 대괄호 안쪽 / 대괄호 포함 전체
- `cit` / `cat`: HTML/XML 태그 안쪽 / 태그 포함 전체
- `cip` / `dap`: 문단 안쪽 / 문단 전체

= 비주얼 및 블록 모드

- `v`: 글자 단위 비주얼 선택
- `V`: 줄 단위 비주얼 선택
- `Ctrl-v`: 블록(세로 열) 비주얼 선택
- `gv`: 마지막 비주얼 선택 영역 다시 선택
- `o`: 선택 영역의 반대쪽 끝으로 커서 전환

== 다중 라인 블록 일괄 편집
1. `Ctrl-v`로 편집할 여러 줄을 세로로 선택.
2. `I` (맨 앞 입력) 또는 `A` (맨 뒤 입력) 누름.
3. 삽입할 텍스트 입력.
4. `Esc`를 누르면 선택한 모든 줄에 동시 적용.

= 검색 및 치환

- `/패턴`: 전방 검색 (`n` 다음 일치, `N` 이전 일치)
- `?패턴`: 후방 검색
- `*` / `\#`: 커서 위치 단어 즉시 전방 / 후방 검색
- `:noh` 또는 `<Esc>`: 검색 강조 표시 해제
- `:%s/기존/신규/g`: 문서 전체 치환
- `:%s/기존/신규/gc`: 확인 프롬프트와 함께 개별 치환
- `cgn`: 현재 검색 일치 항목 수정 후, `.` 키로 다음 일치 항목 연속 수정
- `:g/패턴/d`: 패턴과 일치하는 모든 줄 삭제
- `:v/패턴/d`: 패턴과 일치하지 않는 모든 줄 삭제

= 창 분할, 버퍼 및 탭

== 창 분할 (Splits)
- `:vsp` / `:sp`: 세로(수직) / 가로(수평) 분할
- `Ctrl-w v` / `Ctrl-w s`: 단축키로 세로 / 가로 분할
- `Ctrl-w h/j/k/l`: 좌/하/상/우 창으로 포커스 이동
- `Ctrl-w c` / `Ctrl-w o`: 현재 창 닫기 / 현재 창 제외 모두 닫기
- `Ctrl-w =`: 모든 분할 창 크기 균등 정렬

== 버퍼 (Buffers)
- `:ls` 또는 `:buffers`: 열려 있는 버퍼 목록 확인
- `:b <이름/번호>`: 특정 버퍼로 전환
- `:bn` / `:bp`: 다음 / 이전 버퍼로 전환
- `:bd`: 현재 버퍼 닫기
- `Ctrl-^`: 최근 사용한 두 버퍼 간 빠른 전환

== 탭 (Tabs)
- `:tabnew [파일]`: 새 탭 열기
- `gt` / `gT`: 다음 / 이전 탭으로 이동
- `<N>gt`: N번째 탭으로 직접 이동
- `:tabclose`: 현재 탭 닫기

= Neovim 내장 기능

== 내장 LSP 단축키
Neovim은 추가 플러그인 없이 자체 LSP 클라이언트를 지원합니다:
- `K`: 호버 문서(타입/문서화) 확인
- `gd`: 정의(Definition)로 이동
- `gD`: 선언(Declaration)으로 이동
- `gr`: 참조(References) 목록 조회
- `gi`: 구현체(Implementation)로 이동
- `[d` / `]d`: 이전 / 다음 진단(에러/경고) 위치로 점프
- `vim.lsp.buf.rename()`: 심볼 이름 일괄 변경
- `vim.lsp.buf.code_action()`: 퀵픽스 및 코드 액션 실행
- `vim.lsp.buf.format()`: 현재 버퍼 코드 자동 포맷팅
- `:checkhealth`: 설정, 환경, 헬스체크 진단 실행

== 내장 터미널 (Terminal)
- `:terminal`: 터미널 버퍼 열기
- `i` / `a`: 터미널 입력 모드 진입
- `Ctrl-\ Ctrl-n`: 터미널 모드에서 Normal 모드로 복귀

= 기본 설정 (`init.lua`)

`~/.config/nvim/init.lua` 핵심 시작 설정:

```lua
-- 리더 키(Leader) 설정
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 필수 기본 옵션
local opt = vim.opt
opt.number = true          -- 줄 번호 표시
opt.relativenumber = true  -- 상대 줄 번호 표시
opt.expandtab = true       -- 탭 대신 공백 사용
opt.shiftwidth = 2        -- 들여쓰기 너비
opt.tabstop = 2
opt.smartindent = true     -- 스마트 자동 들여쓰기
opt.ignorecase = true      -- 검색 시 대소문자 무시
opt.smartcase = true       -- 대문자 입력 시 대소문자 구분
opt.termguicolors = true   -- 24비트 트루컬러 지원
opt.scrolloff = 8          -- 스크롤 시 여유 줄 수
opt.signcolumn = "yes"     -- 사인 컬럼 고정
opt.undofile = true        -- 영구 Undo 히스토리 보존

-- 키 매핑: vim.keymap.set(모드, 키, 동작, 옵션)
local keymap = vim.keymap.set
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>")
keymap("n", "<leader>w", "<cmd>w<CR>")
keymap("n", "<leader>q", "<cmd>q<CR>")
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-l>", "<C-w>l")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
```

= 플러그인 관리 (`vim.pack`)

Neovim 0.12+부터 내장 패키지 관리자인 `vim.pack`을 기본 제공합니다.

== `vim.pack.add`로 플러그인 등록

`init.lua`에 플러그인 목록을 선언합니다:

```lua
vim.pack.add({
  -- 문자열 형태: Git 저장소 URL 직접 지정
  "https://github.com/folke/tokyonight.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/echasnovski/mini.nvim",
  "https://github.com/keaising/im-select.nvim",

  -- 테이블 형태: 특정 브랜치/태그 버전 고정
  {
    src = "https://github.com/nvim-telescope/telescope.nvim",
    version = "0.1.x",
  },
})

-- 패키지 로드 후 플러그인 설정
vim.cmd.colorscheme("tokyonight")
require("gitsigns").setup()
require("im_select").setup({})
```

== `vim.pack` 주요 기능 및 명령어
- `:packadd <이름>`: 옵션 패키지를 필요 시점에 수동 로드
- `vim.pack.update()`: 설치된 플러그인을 최신 커밋으로 업데이트
- `vim.pack.del()`: 관리 중인 플러그인 삭제
- `vim.pack-lockfile`: 커밋 SHA를 고정하여 다른 환경에서도 동일한 버전 보장
- `:help vim.pack`: 내장 도움말 확인

= 추천 모던 플러그인

== 구문 분석 및 하이라이팅
- *nvim-treesitter/nvim-treesitter*: AST 기반 정밀 구문 강조, 스마트 들여쓰기, 점진적 영역 선택.

== LSP 및 개발 도구
- *neovim/nvim-lspconfig*: 다양한 언어 서버의 공식 표준 설정 모음.
- *williamboman/mason.nvim*: LSP 서버, DAP, 린터, 포매터를 손쉽게 설치/관리하는 도구.
- *williamboman/mason-lspconfig.nvim*: mason과 nvim-lspconfig 간의 간편한 연동 브리지.

== 자동완성 (Autocompletion)
- *Saghen/blink.cmp*: 매우 빠르고 가벼운 고성능 차세대 자동완성 엔진 (스니펫/LSP 통합).
- *hrsh7th/nvim-cmp*: 다양한 확장을 지원하는 널리 쓰이는 모듈형 자동완성 엔진.

== 퍼지 파인더 및 탐색
- *nvim-telescope/telescope.nvim*: 파일, 커밋, Grep 텍스트, LSP 심볼 검색을 지원하는 고확장성 검색기.
- *ibhagwan/fzf-lua* / *folke/snacks.nvim*: 빠른 속도를 제공하는 모던 검색 대안.

== Git 연동
- *lewis6991/gitsigns.nvim*: 변경 사항 사인컬럼 표시, 인라인 diff 미리보기, 헝크 스테이징, 블레임 라인.
- *tpope/vim-fugitive*: 완성도 높은 Neovim Git 래퍼 플러그인.

== 편집 보조 및 UI 강화
- *echasnovski/mini.nvim*: 감싸기, 주석, 확장 텍스트 오브젝트, 파일 탐색 등을 지원하는 독립 모듈 모음.
- *keaising/im-select.nvim*: 입력 모드를 벗어날 때 영문 입력기로 자동 전환하여 한글 오입력 방지.
- *nvim-lualine/lualine.nvim*: 빠르고 커스터마이징이 쉬운 상태 표시줄.
- *folke/which-key.nvim*: 입력 중인 단축키의 조합을 팝업으로 안내.

= mini.nvim 모듈 가이드

`mini.nvim`은 독립된 경량 모듈을 제공합니다. 필요한 모듈만 각각 활성화하여 사용합니다:

```lua
require('mini.surround').setup()
require('mini.comment').setup()
require('mini.ai').setup()
require('mini.pairs').setup()
require('mini.files').setup()
require('mini.bracketed').setup()
```

== mini.surround (괄호 및 따옴표 조작)
- `saiw"`: 단어 바깥에 `"` 추가 (Surround Add)
- `sd"`: 감싸고 있는 `"` 삭제 (Surround Delete)
- `sr"'`: 감싸고 있는 `"`를 `'`로 변경 (Surround Replace)
- `sh)`: 둘러싼 `()` 강조 표시 (Surround Highlight)

== mini.comment (고속 주석 처리)
- `gcc`: 현재 줄 주석 토글
- `gc` (비주얼 모드): 선택 영역 주석 토글
- `gc<모션>`: 지정 모션 범위 주석 처리 (예: 문단 단위 `gcip`)

== mini.ai (확장 텍스트 오브젝트)
- `via` / `cia`: 함수 인자 내부 선택 / 변경
- `vaa` / `daa`: 쉼표 포함 함수 인자 전체 선택 / 삭제
- `vif` / `cif`: 함수 내부 본문 선택 / 변경
- `vaf` / `daf`: 함수 전체 선언부 선택 / 삭제

== mini.files (버퍼 기반 파일 탐색기)
- `MiniFiles.open()`: 파일 탐색기 열기
- `h j k l` 키로 디렉터리 탐색.
- 버퍼 텍스트 편집하듯 파일/폴더명을 직접 수정.
- 버퍼 저장(`:w`) 시 파일 이름 변경, 생성, 삭제가 실제 디스크에 즉시 반영.

== mini.bracketed (대괄호 탐색)
- `[b` / `]b`: 이전 / 다음 버퍼
- `[d` / `]d`: 이전 / 다음 진단(에러/경고)
- `[q` / `]q`: 이전 / 다음 퀵픽스 항목

= 한영 입력기 자동 전환 (`im-select.nvim`)

입력 모드(Insert)를 나갈 때 입력기를 영문으로 자동 전환합니다. Normal 모드에서 한글 입력으로 인한 명령 오류를 방지합니다.

```lua
require('im_select').setup({
  -- 기본 영문 입력기 엔진 설정
  -- macOS: "com.apple.keylayout.ABC"
  -- Windows: "1033"
  -- Linux (fcitx5): "keyboard-us"
  default_im_select = "keyboard-us",
  -- 입력 모드 재진입 시 직전 사용 언어(한글 등) 복원
  set_previous_events = { "InsertEnter" },
})
```
