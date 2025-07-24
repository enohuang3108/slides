#!/bin/bash

# 確保 dist 目錄存在
mkdir -p dist

# 寫入 HTML 模板的開頭部分
cat > dist/index.html << 'EOF'
<!DOCTYPE html>
<html lang="zh-TW">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Slides</title>
  <style>
    body {
      font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
      max-width: 800px;
      margin: 0 auto;
      padding: 2rem;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      min-height: 100vh;
      color: white;
    }
    h1 {
      text-align: center;
      margin-bottom: 2rem;
      font-size: 2.5rem;
      font-weight: 300;
    }
    .presentations {
      display: grid;
      gap: 1.5rem;
    }
    .presentation-card {
      background: rgba(255, 255, 255, 0.1);
      border: 1px solid rgba(255, 255, 255, 0.2);
      border-radius: 12px;
      padding: 1.5rem;
      text-decoration: none;
      color: inherit;
      transition: all 0.3s ease;
      display: block;
    }
    .presentation-card:hover {
      transform: translateY(-2px);
      background: rgba(255, 255, 255, 0.2);
      box-shadow: 0 12px 24px rgba(0, 0, 0, 0.2);
    }
    .presentation-title {
      font-size: 1.5rem;
      font-weight: 600;
      margin-bottom: 0.5rem;
    }
    .presentation-desc {
      opacity: 0.8;
      line-height: 1.6;
    }
    .footer {
      text-align: center;
      margin-top: 3rem;
      opacity: 0.7;
    }
    .footer a {
      color: white;
      text-decoration: none;
    }
    .footer a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
  <div class="presentations">
EOF

# 尋找所有 slides.md，排除 node_modules，並動態生成卡片
find . -path '*/node_modules/*' -prune -o -name slides.md -print | sort | while read -r slides_md; do
  dir=$(dirname "${slides_md}")
  dir_path=${dir#./}

  # 從 slides.md 的 frontmatter 提取 title
  title=$(grep '^title:' "${slides_md}" | head -n 1 | sed 's/^title: *//;s/"//g')


  # 如果沒有 title，使用目錄名作為備用
  if [ -z "$title" ]; then
    title=$(basename "$dir_path")
  fi

  # 根據目錄名添加 emoji
  emoji="📚"
  if [[ "$dir_path" == *"advanced"* ]]; then
    emoji="🚀"
  elif [[ "$dir_path" == *"demo"* ]]; then
    emoji="🧪"
  elif [[ "$dir_path" == *"2025"* ]]; then
    emoji="🗓️"
  fi

  # 將生成的卡片附加到 index.html
  cat >> dist/index.html << EOF
      <a href="./${dir_path}/" class="presentation-card">
        <div class="presentation-title">${emoji} ${title}</div>
        <div class="presentation-desc">${description}</div>
      </a>
EOF
done

# 寫入 HTML 模板的結尾部分
cat >> dist/index.html << 'EOF'
  </div>
</body>
</html>
EOF

echo "Index page created successfully at dist/index.html"
