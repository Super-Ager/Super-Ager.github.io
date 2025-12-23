#!/bin/bash
# 文件名示例：batch_push.sh

FOLDER="protein_images"   # 图片所在目录
BATCH_SIZE=50             # 每批处理的文件数
BRANCH="main"             # 推送的分支名

# 收集所有 PNG 文件（按名字排序）
files=()
for file in "$FOLDER"/*.png; do
  [[ -f "$file" ]] && files+=("$file")
done

# 对文件数组进行排序（使用临时文件确保兼容性）
if (( ${#files[@]} > 0 )); then
  tmpfile=$(mktemp)
  printf '%s\n' "${files[@]}" | sort > "$tmpfile"
  files=()
  while IFS= read -r line; do
    [[ -n "$line" ]] && files+=("$line")
  done < "$tmpfile"
  rm -f "$tmpfile"
fi

total=${#files[@]}

if (( total == 0 )); then
  echo "未找到 PNG 文件，检查 FOLDER 配置"; exit 1
fi

echo "找到 $total 个 PNG 文件，将分 $(( (total + BATCH_SIZE - 1) / BATCH_SIZE )) 批处理"

batch=1
for ((i=0; i<total; i+=BATCH_SIZE)); do
  batch_files=("${files[@]:i:BATCH_SIZE}")
  count=${#batch_files[@]}
  first=$(basename "${batch_files[0]}")
  last_idx=$((count - 1))
  last=$(basename "${batch_files[$last_idx]}")

  echo ""
  echo "========== 批次 $batch（$count 个）: $first ... $last =========="

  git add "${batch_files[@]}" || { echo "git add 失败"; exit 1; }

  git commit -m "Add batch $batch: $count images ($first to $last)" || {
    echo "commit 失败，可能没有变更，继续下一批？(y/n)"
    read -r ans
    [[ $ans == y ]] || exit 1
    ((batch++))
    continue
  }

  git push origin "$BRANCH" || {
    echo "push 失败，检查网络/权限后重试"; exit 1;
  }

  ((batch++))
done

echo "全部完成，共处理 $total 个文件。"
