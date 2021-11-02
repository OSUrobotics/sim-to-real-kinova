for f in debug_video_[0-9]*; do
  mv "$f" "$(printf 'debug_video_%03d' "${f#debug_video_}")"
done

for f in video_[0-9]*; do
  mv "$f" "$(printf 'video_%03d' "${f#video_}")"
done

for f in *; do
  mv "$f" "$f.gif";
done
