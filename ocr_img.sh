#!/bin/bash

export TESSDATA_PREFIX=/usr/share/tessdata # Just in case

IMG_PATH="/tmp/ocr_capture.png"
TXT_PATH="/tmp/ocr_output.txt"

# Capture area
grim -g "$(slurp)" "$IMG_PATH"

if [[ "$1" == "--latex" ]]; then
  # Use LaTeX-OCR
  latexocr "$IMG_PATH" | wl-copy
  notify-send "LaTeX OCR" "Copied to clipboard."
else
  # Regular OCR (Croatian + English)
  tesseract "$IMG_PATH" "$TXT_PATH" -l hrv+eng &>/dev/null
  cat "${TXT_PATH}.txt" | wl-copy
  notify-send "OCR Complete" "Copied to clipboard"
fi
