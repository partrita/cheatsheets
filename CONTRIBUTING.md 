# 🚀 기여 가이드라인

관심을 가져주셔서 감사합니다. 여러분의 기여는 이 프로젝트를 더욱 풍성하고 유용하게 만드는 데 큰 힘이 됩니다. 이 가이드라인은 여러분이 프로젝트에 참여하는 과정을 최대한 원활하게 돕기 위해 작성되었습니다.


## 💡 기여를 시작하기 전에

프로젝트에 기여하기 전에 몇 가지 사항을 확인해주세요.

1.  **Issue 확인**: 기여하고 싶은 아이디어가 있다면, 먼저 [Issue](https://github.com/partrita/cheatsheets/issues) 목록을 확인하여 이미 논의 중이거나 해결된 문제는 아닌지 확인해주세요. 새로운 기능 제안이나 버그 보고는 Issue를 통해 먼저 알려주시면 감사하겠습니다.

2.  **README 확인**: 프로젝트의 전반적인 목표와 구조를 이해하기 위해 `README.md` 파일을 읽어주세요.
3.  **코드 스타일**: 이 프로젝트는 특정 코드 스타일(예: Black, isort)을 따르고 있습니다. 기여하기 전에 `.pre-commit-config.yaml` 파일을 확인하여 사용하는 도구와 설정을 숙지해주세요.


## 🛠️ 기여하는 방법 (워크플로우)

다음은 이 프로젝트에 기여하는 일반적인 단계입니다.

### 저장소 포크 (Fork)

프로젝트에 기여하려면 먼저 이 저장소를 여러분의 GitHub 계정으로 포크(Fork)해야 합니다. GitHub 페이지 우측 상단의 "Fork" 버튼을 클릭하여 포크하세요.

### 포크된 저장소 클론 (Clone)

포크한 저장소를 여러분의 로컬 개발 환경으로 클론합니다.

```bash
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name
```

(여기서 `your-username`은 여러분의 GitHub 사용자 이름으로 바꿔주세요.)

### 새 브랜치 생성

변경 사항을 독립적으로 관리하고 다른 기여자들과의 충돌을 피하기 위해 항상 **새로운 브랜치**에서 작업해주세요.

```bash
git checkout -b feature/your-feature-name # 새로운 기능 추가 시
git checkout -b bugfix/issue-number     # 버그 수정 시
```

브랜치 이름은 `feature/`, `bugfix/`, `docs/`, `refactor/` 등으로 시작하고, 그 뒤에 작업 내용을 간략하게 설명하는 이름을 붙이는 것을 권장합니다.

### 변경 사항 적용 및 테스트

원하는 변경 사항을 적용합니다. 이는 새로운 치트시트를 추가하거나, 기존 치트시트를 개선하거나, 버그를 수정하는 등 어떤 형태든 될 수 있습니다.

  * **새로운 치트시트 추가**: `src/` 디렉토리에 `.typ` 파일을 추가합니다. 파일명은 `cheatsheet_언어이름.typ` 또는 `cheatsheet_도구이름.typ`과 같이 명확하게 지어주세요.
  * **README.md 업데이트**: 새로운 치트시트를 추가했다면, `README.md` 파일의 "주요 치트시트 목록" 섹션에도 해당 내용을 추가해주세요.

변경 사항을 적용한 후에는 반드시 **테스트**를 수행하여 의도대로 작동하는지 확인해주세요. `typst` 파일을 추가하거나 수정했다면, 로컬에서 빌드하여 PDF가 올바르게 생성되는지 확인하는 것이 좋습니다.

```bash
typst compile src/cheatsheet_your_new.typ
```

### `pre-commit` 훅 실행 (선택 사항이지만 권장)

코드를 커밋하기 전에 `pre-commit` 훅을 실행하여 코드 스타일 및 품질 검사를 수행하는 것을 강력히 권장합니다.

```bash
pre-commit run --all-files
```

혹은 `pre-commit install`을 통해 Git 훅을 설치했다면 `git commit` 시 자동으로 실행됩니다.

### 변경 사항 커밋 (Commit)

의미 있는 작은 단위로 변경 사항을 커밋합니다. **커밋 메시지**는 해당 커밋에서 무엇을 변경했는지 명확하고 간결하게 설명해야 합니다.

* 좋은 예: `feat: add new Go concurrency cheatsheet` (새로운 기능 추가)
* 좋은 예: `fix: correct typo in Seurat workflow` (오타 수정)
* 좋은 예: `docs: update build instructions in README` (문서 업데이트)

<!-- end list -->

```bash
git add .
git commit -m "feat: add new cheatsheet for [Your Topic]"
```

### 변경 사항 푸시 (Push)

커밋된 변경 사항을 포크한 저장소로 푸시합니다.

```bash
git push origin feature/your-feature-name
```

### 풀 리퀘스트 (Pull Request) 생성

GitHub에서 여러분의 포크된 저장소 페이지로 이동하면, 방금 푸시한 브랜치에 대한 "Compare & pull request" 버튼이 보일 것입니다. 이를 클릭하여 풀 리퀘스트(Pull Request, PR)를 생성해주세요.

풀 리퀘스트를 생성할 때 다음 내용을 포함해주세요.

* **제목**: 간결하고 명확하게 PR의 내용을 요약합니다 (예: `Feat: Go 언어 채널 치트시트 추가`).
* **설명**: PR이 어떤 문제를 해결하는지, 어떤 기능을 추가하는지, 또는 어떤 개선을 하는지 자세히 설명합니다. 관련 Issue가 있다면 링크를 걸어주세요 (예: `Closes #123`).
* **스크린샷 또는 데모**: 시각적인 변경 사항이 있다면 스크린샷이나 GIF를 첨부하면 좋습니다. (예: 새로 추가된 치트시트의 PDF 스크린샷)

### 리뷰 및 병합 (Merge)

풀 리퀘스트를 생성하면 프로젝트 관리자가 이를 검토하고 피드백을 제공할 것입니다. 피드백을 반영하여 코드를 수정하고, 모든 것이 만족스러우면 여러분의 변경 사항이 `main` 브랜치에 병합됩니다.


## 🙏 기타

* **질문**: 궁금한 점이 있다면 언제든지 [Issue](https://github.com/your-username/your-repo-name/issues)를 열어 질문해주세요.
* **격려**: 이 프로젝트가 유용하다고 생각하신다면, 저장소에 별표(Star)를 눌러주세요. 여러분의 지지는 큰 힘이 됩니다.

다시 한번 기여에 대한 관심에 감사드립니다. 여러분의 참여를 기대합니다.