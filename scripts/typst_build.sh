#!/bin/bash
set -e
set -o pipefail

# 통합 Typst 빌드/체크 스크립트
# 사용법:
#   ./scripts/typst_build.sh check   - 임시 위치에서 전체 컴파일 가능 여부 확인 (출력 미보관)
#   ./scripts/typst_build.sh build   - dist/ 아래 최종 PDF 출력

MODE="${1:-build}"

if [[ "$MODE" != "check" && "$MODE" != "build" ]]; then
  echo "Usage: $0 [check|build]" >&2
  exit 2
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
SRC_DIR="$ROOT_DIR/src"
DIST_DIR="$ROOT_DIR/dist"
TEMP_DIR="$ROOT_DIR/.typ_build_temp"

if [[ "$MODE" == "check" ]]; then
  OUTPUT_DIR="$TEMP_DIR"
  CLEANUP_ON_DONE=true
else
  OUTPUT_DIR="$DIST_DIR"
  CLEANUP_ON_DONE=false
fi

mkdir -p "$OUTPUT_DIR"

cleanup() {
  if [[ "$CLEANUP_ON_DONE" == true ]]; then
    rm -rf "$TEMP_DIR"
  fi
}
trap cleanup EXIT

echo "--- Typst $MODE: src/ 이하 .typ 컴파일 (템플릿 제외) ---"

failures=0
while IFS= read -r -d '' typ_file; do
  rel_path="${typ_file#"$SRC_DIR"/}"
  output_rel_path="${rel_path%.typ}.pdf"
  output_path="$OUTPUT_DIR/$output_rel_path"

  mkdir -p "$(dirname "$output_path")"

  if [[ "$MODE" == "check" ]]; then
    echo "Checking: $typ_file"
  else
    echo "Compiling: $typ_file -> $output_path"
  fi

  if ! pixi run typst compile --root "$ROOT_DIR" --font-path "$SRC_DIR/fonts" "$typ_file" "$output_path"; then
    echo "ERROR: $typ_file 컴파일 실패" >&2
    failures=$((failures + 1))
  fi
done < <(find "$SRC_DIR" -name "*.typ" -not -path "*/templates/*" -print0)

if [[ "$failures" -gt 0 ]]; then
  echo "--- Typst 컴파일 중 $failures개 파일 실패 ---" >&2
  exit 1
fi

echo "--- Typst $MODE 완료 ($failures개 오류) ---"
exit 0
