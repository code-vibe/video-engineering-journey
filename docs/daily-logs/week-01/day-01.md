# Day 1 - [Today's Date]

## Today's Goal
Set up FFmpeg compression testing and establish baseline for video optimization

## What I Learned
### Technical Concepts
- Hardware acceleration options: VAAPI, QSV, CUDA
- CRF (Constant Rate Factor) for quality control
- Preset effects on compression speed vs efficiency
- Resolution scaling for bandwidth optimization

### Practical Skills
- FFmpeg command optimization for CPU temperature control
- Systematic compression testing methodology
- File size vs quality trade-off analysis

## Code Written
```bash
# CPU-safe compression tests
ffmpeg -i test_input.mp4 -c:v libx264 -preset ultrafast -crf 28 -threads 2 output_cpu_safe.mp4
ffmpeg -i test_input.mp4 -c:v libx264 -preset fast -crf 30 -threads 2 output_better_compression.mp4
ffmpeg -i test_input.mp4 -c:v libx264 -preset fast -crf 30 -s 854x480 -b:v 400k -threads 2 output_mobile.mp4
ffmpeg -i test_input.mp4 -c:v libx264 -preset fast -crf 35 -s 640x360 -b:v 200k -threads 2 output_2G_optimized.mp4
ffmpeg -i test_input.mp4 -c:v libx264 -preset slow -crf 40 -s 480x270 -b:v 100k -threads 2 output_extreme_compression.mp4
