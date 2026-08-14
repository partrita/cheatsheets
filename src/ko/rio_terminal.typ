#import "../templates/conf.typ": *

#show: template.with(
  title: "Rio 터미널 설정 치트시트",
  header: [#datetime.today().display()],
  footer: "Rio Terminal Configuration Guide (raphamorim.io/rio)",
)

= Rio 개요 및 설정 경로

Rio는 Rust 및 WebGPU/wgpu 기반으로 개발된 초고속 크로스 플랫폼 하드웨어 가속 터미널 에뮬레이터입니다.

== 설정 파일 위치 (`config.toml`)
- *Linux / macOS*: `~/.config/rio/config.toml`
- *Windows*: `%APPDATA%\rio\config.toml`
- 설정 파일은 저장 즉시 터미널에 실시간 핫 리로드(Hot-reload)됩니다.

= 창 및 네비게이션 (`[window]`, `[navigation]`)

== 윈도우 스타일 및 투명도
```toml
# 기본 창 크기 및 여백
padding-x = 10
line-height = 1.0

[window]
width = 1000
height = 600
mode = "Windowed" # Windowed | Maximized | Fullscreen
background-opacity = 0.92
blur = true
decorations = "Enabled" # Enabled | Disabled
```

== 탭 및 네비게이션 모드
```toml
[navigation]
# 탭 바 표시 모드
mode = "CollapsedTab" 
# 선택지: CollapsedTab | TopTab | BottomTab | Breadcrumb | Plain

clickable = true
use-current-path = true
use-split = true
color-automation = []
```

= 폰트 및 렌더러 (`[fonts]`, `[renderer]`)

== 폰트 설정
```toml
[fonts]
size = 15

# 기본 글꼴 패밀리
family = "Fira Code"

[fonts.bold]
family = "Fira Code"
weight = 700

[fonts.italic]
family = "Fira Code"
style = "italic"
```

== 렌더러 최적화
```toml
[renderer]
# 렌더링 성능 (High: 최대 주사율, Low: 절전)
performance = "High"

# 백엔드: Automatic | Metal | Vulkan | Dx12
backend = "Automatic"

# 비활성 창 렌더링 일시정지 (배터리 절약)
disable-renderer-when-unfocused = true
```

= 커서 및 셸 환경 설정

== 커서 스타일
```toml
# 커서 모양: 'block' | 'beam' | 'underline'
cursor = 'block'
blinking-cursor = false
hide-cursor-when-typing = true
```

== 기본 셸 및 에디터
```toml
editor = "nvim"

# 기본 시작 셸 지정
[shell]
program = "zsh"
args = ["--login"]
```

== 키보드 및 플랫폼 옵션
```toml
use-fork = false
working-dir = ""
option-as-alt = "Both" # macOS: Option 키를 Alt로 매핑
```

= 테마 및 색상 (`theme`, `[colors]`)

== 내장 테마 활성화
```toml
# 내장 테마 이름 지정
theme = "nord"
# 지원: dracula, catppuccin-mocha, gruvbox, solarized-dark 등
```

== 커스텀 색상 팔레트 정의
```toml
[colors]
background = '#24273A'
foreground = '#CAD3F5'
cursor = '#F4DBD6'

[colors.tabs]
active = '#8AADF4'
inactive = '#494D64'

# ANSI 표준 색상
[colors.regular]
black = '#494D64'
red = '#ED8796'
green = '#A6DA95'
yellow = '#EED49F'
blue = '#8AADF4'
magenta = '#F5BDE6'
cyan = '#8BD5CA'
white = '#B8C0E0'
```

= 키바인딩 및 단축키 (`[bindings]`)

== 기본 단축키 목록
- *새 탭*: `Cmd/Ctrl + T`
- *탭 닫기*: `Cmd/Ctrl + W`
- *다음/이전 탭*: `Ctrl + Tab` / `Ctrl + Shift + Tab`
- *탭 번호 이동*: `Cmd/Ctrl + 1~9`
- *창 분할(우측)*: `Cmd/Ctrl + Shift + D`
- *창 분할(하단)*: `Cmd/Ctrl + Shift + E`
- *패널 닫기*: `Cmd/Ctrl + Shift + W`
- *폰트 크기 조절*: `Cmd/Ctrl + + / - / 0`
- *복사 / 붙여넣기*: `Cmd/Ctrl + Shift + C / V`

== 커스텀 키바인딩 예시
```toml
[bindings]
keys = [
  { key = "t", with = "super", action = "CreateTab" },
  { key = "w", with = "super", action = "CloseTab" },
  { key = "d", with = "super | shift", action = "SplitRight" },
  { key = "e", with = "super | shift", action = "SplitDown" },
  { key = "f", with = "super", action = "SearchHistory" },
  { key = "0", with = "super", action = "ResetFontSize" },
]
```

= 실전 유용한 설정 팁

- *GPU 가속 최적화*: 노트북 배터리 절약을 위해 `disable-renderer-when-unfocused = true` 설정을 권장합니다.
- *디렉토리 동기화*: `navigation.use-current-path = true` 활성화 시 새 탭 및 분할 패널이 현재 디렉토리 경로에서 시작됩니다.
- *macOS 메타 키*: Neovim/Emacs 사용자는 `option-as-alt = "Both"` 설정이 유용합니다.
