#!/bin/bash

# 오류 발생 시 즉시 종료합니다.
set -e
set -o pipefail

echo "--- Running Typst compilation check for all .typ files in src/ ---"

# 임시 PDF 파일 출력을 위한 디렉터리 정의
TEMP_PDF_DIR=".typ_build_temp"
mkdir -p "$TEMP_PDF_DIR"

# 오류 발생 시 임시 디렉터리를 정리하고 스크립트를 종료하는 함수
cleanup_on_error() {
    echo "--- Typst compilation FAILED! Cleaning up temporary directory. ---"
    rm -rf "$TEMP_PDF_DIR"
    exit 1
}

# `find` 명령으로 .typ 파일을 찾아 `while` 루프에서 처리합니다.
# `pipefail`은 `find`가 실패하면 루프도 실패하게 만들지만,
# `pixi run`의 종료 코드는 직접 확인해야 합니다.
find src/ -name "*.typ" -print0 | while IFS= read -r -d '' typ_file; do
    echo "Attempting to compile: ${typ_file}"

    # 임시 디렉터리에 PDF 출력 경로 설정
    pdf_output="${TEMP_PDF_DIR}/$(basename "${typ_file%.typ}.pdf")"

    # Typst 컴파일 명령을 실행하고 즉시 종료 코드를 확인합니다.
    pixi run typst compile --font-path src/fonts "${typ_file}" "${pdf_output}"

    # 명령의 종료 코드가 0이 아닌 경우 (오류 발생),
    # 오류 처리 함수를 호출하고 스크립트를 종료합니다.
    if [ $? -ne 0 ]; then
        cleanup_on_error
    fi
done

echo "--- All .typ files in src/ compiled successfully! ---"

# 성공적으로 완료되면 임시 디렉터리 정리
rm -rf "$TEMP_PDF_DIR"

exit 0