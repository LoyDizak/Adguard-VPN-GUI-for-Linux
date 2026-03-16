#!/usr/bin/env bash
set -e

ENTRY_POINT="main.py"
APP_NAME="Adguard VPN GUI"
TARGET_DIR="builds"
BUILD_NAME="${APP_NAME}"

python3 -m PyInstaller \
  --onefile \
  --name "${APP_NAME}" \
  "${ENTRY_POINT}"

mkdir -p "${TARGET_DIR}"

NEW_NAME="${BUILD_NAME}"
count=1

while [[ -e "${TARGET_DIR}/${NEW_NAME}" ]]; do
    NEW_NAME="${APP_NAME} (${count})"
    ((count++))
done

mv -f "dist/${BUILD_NAME}" "${TARGET_DIR}/${NEW_NAME}"
chmod +x "${TARGET_DIR}/${NEW_NAME}"

rm -rf build dist
rm -f "${APP_NAME}.spec"

read -p "Press Enter to continue..."