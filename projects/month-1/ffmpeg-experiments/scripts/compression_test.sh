#!/bin/bash
# Video compression test suite for poor internet optimization

INPUT_FILE="$1"
if [ -z "$INPUT_FILE" ]; then
    echo "Usage: ./compression_test.sh input_video.mp4"
    exit 1
fi

echo "Starting compression tests for: $INPUT_FILE"
echo "================================"

# Test 1: Better compression
echo "Test 1: Better compression..."
ffmpeg -i "$INPUT_FILE" -c:v libx264 -preset fast -crf 30 -threads 2 "better_compression_$(basename "$INPUT_FILE")" -y

# Test 2: Mobile optimized
echo "Test 2: Mobile optimized..."
ffmpeg -i "$INPUT_FILE" -c:v libx264 -preset fast -crf 30 -s 854x480 -b:v 400k -threads 2 "mobile_$(basename "$INPUT_FILE")" -y

# Test 3: 2G optimized (our target)
echo "Test 3: 2G network optimized..."
ffmpeg -i "$INPUT_FILE" -c:v libx264 -preset fast -crf 35 -s 640x360 -b:v 200k -threads 2 "2G_optimized_$(basename "$INPUT_FILE")" -y

# Test 4: Extreme compression
echo "Test 4: Extreme compression..."
ffmpeg -i "$INPUT_FILE" -c:v libx264 -preset slow -crf 40 -s 480x270 -b:v 100k -threads 2 "extreme_$(basename "$INPUT_FILE")" -y

echo "================================"
echo "Compression tests complete!"
echo "File size comparison:"
ls -lh "$INPUT_FILE" *_"$(basename "$INPUT_FILE")"
