#import "../templates/conf.typ": *

#show: template.with(
  title: "skills CLI 치트시트 (vercel-labs)",
  header: [Last updated: 2026-08-25],
  footer: "skills Cheat Sheet (skills.sh / github.com/vercel-labs/skills)",
)

= 개요

오픈 에이전트 스킬 생태계 CLI (`npx skills`).
`SKILL.md` 기반 스킬을 Claude Code, Codex, OpenCode,
Cursor, Antigravity 등 75+ 에이전트에 설치.

- 설치 불필요 — `npx`로 바로 실행
- 스킬 레지스트리/탐색: *skills.sh*
- 표준 스펙: agentskills.io

= 핵심 명령어

== 설치
- `npx skills add <owner/repo>`: GitHub에서 설치
- `npx skills add vercel-labs/agent-skills --list`: 저장소의 스킬 미리 보기
- `npx skills add vercel-labs/agent-skills --skill frontend-design -a claude-code -y`: 단일 스킬을 특정 에이전트에
- `npx skills add https://github.com/...`: 전체 URL 소스
- 모노레포 경로: `.../tree/main/skills/<이름>` 지원
- `--skill '*' --agent '*'`: 전체 설치

== 관리
- `npx skills list` (`ls`): 설치된 스킬 목록
- `npx skills ls -g`: 전역만 표시
- `npx skills ls -a claude-code -a cursor`: 에이전트별 필터
- `npx skills find [검색어]`: 대화형(fzf 스타일) 또는 키워드 검색
- `npx skills remove [스킬]`: 설치된 스킬 제거
- `npx skills check`: 업데이트 확인
- `npx skills update [스킬]`: 최신 버전으로 업데이트
- `npx skills init [이름]`: 새 SKILL.md 템플릿 생성
- `npx skills use <소스>`: 설치 없이 한 번 사용해 보기

== 주요 플래그
- `-g, --global`: 전역 스코프 (사용자 디렉터리)
- `-a, --agent <이름>`: 대상 에이전트 (반복 지정 가능)
- `--skill <이름>`: 특정 스킬 선택
- `-y, --yes`: 확인 프롬프트 건너뛰기
- `--all`: `--skill '*' --agent '*' -y`
- `--copy`: 심링크 대신 복사 (심링크 미지원 환경)
- CI: `npx skills@latest`로 버전 고정

= SKILL.md 형식

== 구조
```
my-skill/
├── SKILL.md        # 필수
├── scripts/        # 선택적 자동화 스크립트
└── references/
```

== Frontmatter
```markdown
---
name: my-skill
description: 에이전트가 ... 이 필요할 때 사용
---
Markdown으로 작성된 지침...
```
- `name`, `description` 필수
- description이 자동 활성화 조건이 됨

== 스킬 vs 규칙 (AGENTS.md)
- 규칙: 모든 작업에 항상 적용 → AGENTS.md
- 스킬: 특화되고 가끔 사용하는 워크플로 → 스킬

= 지원 에이전트 (예시)

| Agent | `--agent` | 프로젝트 경로 |
|---|---|---|
| Claude Code | `claude-code` | `.claude/skills/` |
| Codex | `codex` | `.agents/skills/` |
| OpenCode | `opencode` | `.agents/skills/` |
| Cursor | `cursor` | `.cursor/skills/` |
| Antigravity | `antigravity` | `.agents/skills/` |

전역 경로는 에이전트마다 다름
(예: `~/.claude/skills/`, `~/.config/agents/skills/`)
- 기본은 심볼릭 링크 설치 (단일 공유 복사본)

= 배포 및 팁
- 별도 publish 절차 없음: 스킬 폴더를 Git 저장소에 push하면
  `npx skills add` 설치 시점에 skills.sh에 자동 노출
- 권장 저장소 구성: 스킬 폴더 + README + 라이선스
- 보안: 스킬도 코드처럼 취급 — 설치 전 검토,
  `scripts/` 주의, 업데이트 시 diff 확인
- 관련 도구: *skills-npm* (antfu) — npm 패키지에 번들된
  스킬을 `prepare` 스크립트로 심링크
