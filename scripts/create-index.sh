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
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    body {
      font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
      background: #f8fafc;
      color: #1e293b;
      line-height: 1.6;
    }
    .container {
      max-width: 1000px;
      margin: 0 auto;
      padding: 3rem 2rem;
    }
    h1 {
      font-size: 2.5rem;
      font-weight: 700;
      text-align: center;
      margin-bottom: 3rem;
      color: #0f172a;
    }
    .presentations {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
      gap: 1.5rem;
    }
    .presentation-card {
      background: white;
      border: 1px solid #e2e8f0;
      border-radius: 8px;
      padding: 1.5rem;
      text-decoration: none;
      color: inherit;
      transition: all 0.2s ease;
      display: block;
      box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
    }
    .presentation-card:hover {
      transform: translateY(-1px);
      border-color: #3b82f6;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
    }
    .presentation-title {
      font-size: 1.25rem;
      font-weight: 600;
      margin-bottom: 0.5rem;
      color: #0f172a;
    }
    .presentation-desc {
      color: #64748b;
      font-size: 0.875rem;
    }
    .search-container {
      margin-bottom: 2rem;
      text-align: center;
    }
    .search-input {
      width: 100%;
      max-width: 400px;
      padding: 0.75rem 1rem;
      border: 1px solid #e2e8f0;
      border-radius: 8px;
      font-size: 1rem;
      background: white;
      transition: border-color 0.2s ease;
    }
    .search-input:focus {
      outline: none;
      border-color: #3b82f6;
      box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
    }
    .search-input::placeholder {
      color: #94a3b8;
    }
    .presentation-card.hidden {
      display: none;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>Slides</h1>
    <div class="search-container">
      <input type="text" class="search-input" placeholder="搜尋簡報標題或年分..." id="searchInput">
    </div>
    <div class="presentations">
EOF

# 尋找所有 slides.md，排除 node_modules，並動態生成卡片
find . -path '*/node_modules/*' -prune -o -name slides.md -print | sort | while read -r slides_md; do
  dir=$(dirname "${slides_md}")
  dir_path=${dir#./}

  # 從 slides.md 的 frontmatter 提取 title
  title=$(grep '^title:' "${slides_md}" | head -n 1 | sed 's/^title: *//;s/"//g')
  info=$(grep '^info:' "${slides_md}" | head -n 1 | sed 's/^info: *//;s/"//g')


  # 如果沒有 title，使用目錄名作為備用
  if [ -z "$title" ]; then
    title=$(basename "$dir_path")
  fi

  # 將生成的卡片附加到 index.html
  cat >> dist/index.html << EOF
      <a href="./${dir_path}/" class="presentation-card">
        <div class="presentation-title">${title}</div>
        <div class="presentation-desc">${info}</div>
      </a>
EOF
done

# 寫入 HTML 模板的結尾部分
cat >> dist/index.html << 'EOF'
    </div>
  </div>

  <script>
    const searchInput = document.getElementById('searchInput');
    const cards = document.querySelectorAll('.presentation-card');

    searchInput.addEventListener('input', function() {
      const searchTerm = this.value.toLowerCase().trim();

      cards.forEach(card => {
        const title = card.querySelector('.presentation-title').textContent.toLowerCase();
        const desc = card.querySelector('.presentation-desc').textContent.toLowerCase();
        const searchText = title + ' ' + desc;

        if (searchTerm === '' || searchText.includes(searchTerm)) {
          card.classList.remove('hidden');
        } else {
          card.classList.add('hidden');
        }
      });
    });
  </script>
</body>
</html>
EOF

echo "Index page created successfully at dist/index.html"
