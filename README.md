# 각종 치트 시트 모음🤗

![GitHub Repo stars](https://img.shields.io/github/stars/partrita/cheatsheets?style=social)
![GitHub last commit](https://img.shields.io/github/last-commit/partrita/cheatsheets)
![GitHub issues](https://img.shields.io/github/issues/partrita/cheatsheets)
![GitHub pull requests](https://img.shields.io/github/issues-pr/partrita/cheatsheets)
![GitHub license](https://img.shields.io/github/license/partrita/cheatsheets)


![](./demo.png)

## 🚀 소개

이 저장소는 다양한 프로그래밍 언어 및 데이터 과학 도구에 대한 저의 개인적인 치트시트 모음입니다. 모든 치트시트는 현대적이고 강력한 조판 시스템인 Typst 문서로 작성되었습니다. 각 치트시트는 빠른 참조, 핵심 개념 상기, 그리고 효율적인 학습을 돕기 위해 간결하고 명확하게 정리되어 있습니다.

> 종이로 뽑아서 컴퓨터 주변에 두기 위해 만들었습니다.

관심 있는 모든 분들이 이 자료를 통해 작업 효율성을 높이고 새로운 지식을 습득하는 데 도움을 받으시길 바랍니다.


## 📥 PDF 다운로드

각 치트시트의 PDF 버전은 릴리즈 페이지에 자동으로 업로드됩니다. 가장 최신 버전의 치트시트를 손쉽게 확인하고 다운로드하여 오프라인에서도 편리하게 활용하세요.

## 🛠️ Typst 문서 빌드 방법

Typst 문서를 직접 빌드하여 PDF 또는 다른 형식으로 변환할 수 있습니다.

1.  pixi를 사용하여 Typst를 설치합니다. pixi는 프로젝트별 종속성을 관리하는 데 유용합니다.
    ```bash
    pixi install
    ```
    (만약 pixi를 사용하지 않고 전역으로 Typst를 설치하고 싶다면, Typst 공식 설치 가이드를 참고하세요.)
2.  설치가 완료되면, 다음 명령어로 모든 `.typ` 파일을 일괄 빌드할 수 있습니다.
    ```bash
    pixi run build
    ```
    이 명령은 `dist/` 디렉토리에 모든 치트시트의 PDF 버전을 생성합니다.

```bash
pixi run check
```

### 특정 치트시트 개별 빌드 및 실시간 미리보기

특정 파일만 빌드하거나, 수정하면서 실시간으로 결과를 확인하고 싶을 때 다음 명령어를 사용합니다.

- 개별 PDF 빌드:
  ```bash
  pixi run typst compile --font-path src/fonts src/특정파일.typ 특정파일.pdf
  ```
- 실시간 미리보기 (Watch Mode):
  파일을 저장할 때마다 PDF가 자동으로 업데이트됩니다.
  ```bash
  pixi run typst watch --font-path src/fonts src/특정파일.typ
  ```

## 웹사이트 생성 및 미리보기

이 프로젝트는 Quarto를 사용하여 웹사이트를 생성합니다. 로컬에서 웹사이트를 미리 확인하려면 다음 명령어를 사용하세요:

```bash
pixi run site-preview
```

웹사이트를 정적 파일로 생성하려면:

```bash
pixi run site-build
```
이 결과물은 `site_output/` 디렉토리에 생성됩니다.

## 🤝 기여 방법

이 프로젝트는 오픈 소스 기여를 환영합니다. 여러분만의 유용한 치트시트를 추가하거나 기존 치트시트를 개선하는 데 참여하실 수 있습니다.

1.  이 저장소를 포크(Fork)하세요.
2.  포크한 저장소를 로컬로 클론(Clone)하세요.
3.  새로운 `.typ` 파일을 추가하거나 기존 파일을 수정하세요.
4.  변경 사항을 커밋(Commit)하고 푸시(Push)하세요.
5.  이 저장소로 풀 리퀘스트(Pull Request)를 생성하세요.
6.  여러분의 기여가 병합되기를 기다리세요.

자세한 기여 가이드라인은 [CONTRIBUTING.md](./CONTRIBUTING.md) 파일을 참고해주세요. 여러분의 참여는 이 저장소를 더욱 풍성하게 만듭니다.


## 📜 라이선스

이 프로젝트는 MIT License를 따릅니다.
자세한 내용은 [LICENSE](./LICENSE) 파일을 참고하세요. 자유롭게 사용하고, 수정하고, 배포할 수 있습니다.
