#!/usr/bin/env bash

# ffmpeg -i dummy.mov -vn -ar 16000 -acodec pcm_s16le dummy.wav
# Generates a .wav file with 16kHz from the input file (can be a video file)

INPUT_FILE_PATH="$1"
INPUT_FILE=$(basename "$INPUT_FILE_PATH")
INPUT_FILE_NAME_NO_EXTENSION="${INPUT_FILE%.*}"
INPUT_FILE_EXTENSION="${INPUT_FILE##*.}"

if [[ "$extension" == "wav" ]]; then
	OUTPUT_FILE="$INPUT_FILE"
else
	OUTPUT_FILE="${INPUT_FILE%.*}.wav"
fi

ffmpeg -i "$INPUT_FILE_PATH" -vn -ar 16000 -acodec pcm_s16le -y "$OUTPUT_FILE"

