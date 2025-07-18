# cheatsheets🤗

## 소개

이 저장소는 다양한 프로그래밍 언어 및 데이터 과학 도구에 대한 개인 치트시트를 Typst 문서로 정리한 자료입니다. 각 치트시트는 빠른 참고와 학습을 위해 작성되었습니다.

# PDF 다운로드

릴리즈 페이지에 자동으로 업로드되어 있는 PDF 파일을 다운로드할 수 있습니다. 최신 버전의 치트시트를 확인하고 다운로드하세요.

## 주요 치트시트 목록

- **Go 언어** ([src/cheatsheet_go.typ](src/cheatsheet_go.typ)): Go 언어의 기본 문법, 패키지 관리, 고루틴, 채널 등 핵심 개념 정리
- **Seurat** ([src/cheatsheet_seurat.typ](src/cheatsheet_seurat.typ)): R 기반 단일세포 분석 도구 Seurat의 주요 명령어 및 워크플로우
- **Tidyverse** ([src/cheatsheet_tidyverse.typ](src/cheatsheet_tidyverse.typ)): R 데이터 분석을 위한 Tidyverse 패키지 사용법
- **Typst 문법** ([src/cheatsheet_typst_syntax.typ](src/cheatsheet_typst_syntax.typ)): Typst 문서 작성 기본 문법 및 예제
- **기타**: Python, mypy, nvim 등 다양한 도구와 언어에 대한 치트시트 포함

## Typst 문서 빌드 방법

1. [pixi](https://prefix.dev)로 [Typst](https://typst.app)를 설치합니다.
   ```bash
   pixi add typst
   ```
2. 원하는 `.typ` 파일을 Typst로 컴파일하여 PDF 등으로 변환할 수 있습니다.
   ```bash
   typst compile src/cheatsheet_go.typ
   ```


# 라이선스

MIT License. 자세한 내용은 [LICENSE](./LICENSE) 파일을 참고하세요.
