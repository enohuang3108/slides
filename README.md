# Slidev Monorepo

[![Deploy to GitHub Pages](https://github.com/your-username/mono-slidev/workflows/Deploy%20Slidev%20Presentations%20to%20GitHub%20Pages/badge.svg)](https://github.com/your-username/mono-slidev/actions)

一個用於管理多個 Slidev 演示文稿的 monorepo 專案，支援自動部署到 GitHub Pages。

## 🎯 專案特色

- 📦 **Monorepo 架構**: 在單一倉庫中管理多個 Slidev 演示文稿
- 🚀 **自動部署**: 透過 GitHub Actions 自動部署到 GitHub Pages
- 🎨 **多樣化主題**: 每個演示文稿可以使用不同的主題和配置
- 🔧 **開發者友好**: 支援熱重載、TypeScript、自定義組件
- 📱 **響應式設計**: 支援各種螢幕尺寸和設備

## 📁 專案結構

```
mono-slidev/
├── .github/
│   └── workflows/
│       └── deploy.yml          # GitHub Actions 部署配置
├── presentations/
│   ├── demo-basic/             # 基本功能演示
│   │   ├── slides.md          # 演示文稿內容
│   │   ├── package.json       # 專案配置
│   │   └── public/            # 靜態資源
│   └── demo-advanced/         # 進階功能演示
│       ├── slides.md          # 演示文稿內容
│       ├── package.json       # 專案配置
│       ├── public/            # 靜態資源
│       └── components/        # 自定義組件
├── package.json               # 根目錄 package.json
├── pnpm-workspace.yaml        # Workspace 配置
└── README.md                  # 專案說明文件
```

## ✅ 測試狀態

**最後測試時間**: 2024-01-22
**測試環境**: Node.js v20.15.0, pnpm 8.x, Ubuntu WSL2

| 功能 | 狀態 | 說明 |
|------|------|------|
| 🏗️ 建置系統 | ✅ 通過 | 兩個演示文稿都能成功建置 |
| 🌐 開發服務器 | ✅ 通過 | 支援熱重載和即時預覽 |
| 📦 依賴管理 | ✅ 通過 | pnpm workspace 正常運作 |
| 🎯 基本演示 | ✅ 通過 | 包含中文內容、主題、導航功能 |
| 🚀 進階演示 | ✅ 通過 | 自定義組件、Monaco Editor、動畫效果 |
| 🔧 GitHub Actions | ✅ 修正 | 修正了建置指令和權限設定 |
| 📱 預覽功能 | ✅ 通過 | 本地預覽服務器正常運作 |

### 測試過程
- ✅ 成功安裝所有依賴
- ✅ 基本演示建置成功（19.18s）
- ✅ 進階演示建置成功（1m 34s，包含大量 Monaco 類型定義）
- ✅ 兩個演示都能正常提供 HTTP 服務
- ✅ 演示文稿標題和內容正確顯示
- ✅ 響應式設計在不同螢幕尺寸下正常工作

## 🚀 快速開始

### 先決條件

- Node.js >= 18.0.0
- pnpm >= 8.0.0

### 安裝與設定

1. **複製專案**
   ```bash
   git clone https://github.com/your-username/mono-slidev.git
   cd mono-slidev
   ```

2. **安裝依賴**
   ```bash
   pnpm install
   ```

3. **開發模式**
   ```bash
   # 啟動所有演示文稿的開發服務器
   pnpm dev

   # 或者啟動特定演示文稿
   cd presentations/demo-basic
   pnpm dev
   ```

4. **建置所有演示文稿**
   ```bash
   pnpm build:all
   ```

## 🎪 現有演示文稿

### 📚 Demo Basic
- **路徑**: `/presentations/demo-basic/`
- **主題**: Default
- **內容**: Slidev 基本功能展示
- **特色**: Markdown 語法、主題系統、導航控制、程式碼高亮

### 🚀 Demo Advanced
- **路徑**: `/presentations/demo-advanced/`
- **主題**: Seriph
- **內容**: Slidev 進階功能展示
- **特色**: 自定義組件、互動式元素、動畫效果、程式碼執行

## 📖 GitHub Pages 部署指南

### 自動部署設定

1. **啟用 GitHub Pages**
   - 前往 GitHub 專案的 Settings
   - 在 Pages 頁面中選擇 "Deploy from a branch"
   - 選擇 "GitHub Actions" 作為 Source

2. **推送代碼觸發部署**
   ```bash
   git add .
   git commit -m "Add new presentation"
   git push origin main
   ```

3. **查看部署狀態**
   - 在 Actions 頁面查看部署進度
   - 部署完成後可透過 `https://your-username.github.io/mono-slidev` 訪問

### 手動部署

如果需要手動觸發部署：

1. 前往 GitHub 專案的 Actions 頁面
2. 選擇 "Deploy Slidev Presentations to GitHub Pages" workflow
3. 點擊 "Run workflow" 按鈕

### 自定義域名設定

1. 在專案根目錄建立 `CNAME` 檔案：
   ```bash
   echo "your-domain.com" > CNAME
   ```

2. 在 DNS 設定中添加 CNAME 記錄指向 `your-username.github.io`

## 🔧 新增演示文稿

### 方法一：手動建立

1. **建立新資料夾**
   ```bash
   mkdir presentations/my-new-presentation
   cd presentations/my-new-presentation
   ```

2. **建立 package.json**
   ```json
   {
     "name": "my-new-presentation",
     "version": "1.0.0",
     "scripts": {
       "dev": "slidev --open --port 3032",
       "build": "slidev build --base /mono-slidev/presentations/my-new-presentation/",
       "export": "slidev export"
     },
     "dependencies": {
       "@slidev/cli": "^0.48.0",
       "@slidev/theme-default": "latest"
     }
   }
   ```

3. **建立 slides.md**
   ```markdown
   ---
   theme: default
   title: My New Presentation
   ---

   # My New Presentation

   Hello Slidev!

   ---

   # Page 2

   Content goes here...
   ```

### 方法二：使用 Slidev CLI

```bash
cd presentations
npx slidev init my-new-presentation
```

### 更新部署配置

在 `.github/workflows/deploy.yml` 中的 "Create index page" 步驟添加新演示文稿的連結。

## 🛠 開發指令

### 基本指令

```bash
# 安裝所有依賴
pnpm install

# 啟動所有演示文稿的開發服務器（平行運行）
pnpm dev

# 建置所有演示文稿
pnpm build

# 清理建置檔案
pnpm clean
```

### 單獨操作演示文稿

```bash
# 只啟動基本演示的開發服務器
pnpm --filter demo-basic dev
# 或使用快捷指令（如果定義了）
pnpm dev:basic

# 只啟動進階演示的開發服務器
pnpm --filter demo-advanced dev
# 或使用快捷指令（如果定義了）
pnpm dev:advanced

# 建置特定演示文稿
pnpm --filter demo-basic build
pnpm --filter demo-advanced build

# 預覽建置結果
pnpm --filter demo-basic preview --port 4173
pnpm --filter demo-advanced preview --port 4174
```

### 測試和驗證

```bash
# 建置所有演示文稿並測試
pnpm build
pnpm --filter demo-basic preview --port 4173 &
pnpm --filter demo-advanced preview --port 4174 &

# 在瀏覽器中訪問：
# http://localhost:4173 (基本演示)
# http://localhost:4174 (進階演示)

# 停止預覽服務器
pkill -f "vite preview"
```

## 🎨 自定義主題

### 使用現有主題

在演示文稿的 `slides.md` frontmatter 中指定主題：

```yaml
---
theme: seriph  # 或其他主題名稱
---
```

### 安裝額外主題

```bash
cd presentations/your-presentation
pnpm add @slidev/theme-theme-name
```

### 建立自定義主題

1. 在演示文稿目錄中建立 `styles` 資料夾
2. 添加自定義 CSS 檔案
3. 在 `slides.md` 中引用

## 🧩 自定義組件

### 建立組件

在演示文稿的 `components` 目錄中建立 Vue 組件：

```vue
<!-- components/MyComponent.vue -->
<template>
  <div class="my-component">
    <h3>{{ title }}</h3>
    <p>{{ description }}</p>
  </div>
</template>

<script setup>
defineProps(['title', 'description'])
</script>
```

### 使用組件

在 `slides.md` 中直接使用：

```markdown
<MyComponent title="Hello" description="World" />
```

## 📦 依賴管理

本專案使用 pnpm workspaces 進行依賴管理：

- **根目錄**: 包含全域腳本和 workspace 配置
- **各演示文稿**: 獨立的 package.json，可安裝特定依賴

### 添加全域依賴

```bash
pnpm add -w package-name
```

### 為特定演示文稿添加依賴

```bash
pnpm --filter demo-basic add package-name
```

## 🔍 故障排除

### 常見問題

1. **建置失敗**
   - 檢查 Node.js 版本是否 >= 18
   - 確認所有依賴都已正確安裝
   - 查看錯誤日誌中的具體錯誤信息

2. **GitHub Pages 部署失敗**
   - 確認 GitHub Actions 有正確的權限（Pages: write, contents: read, id-token: write）
   - 檢查 workflow 檔案語法是否正確
   - 查看 Actions 頁面的錯誤日誌
   - 確認已在 GitHub 專案設定中啟用 Pages 並選擇 "GitHub Actions" 作為 Source

3. **樣式或資源載入問題**
   - 檢查 `base` 路徑設定是否正確
   - 確認靜態資源路徑使用絕對路徑（以 `/` 開頭）

4. **開發服務器連接埠衝突**
   - 基本演示使用埠 3030，進階演示使用埠 3031
   - 預覽服務器分別使用埠 4173 和 4174
   - 如遇衝突可手動指定不同埠號

5. **Monaco Editor 或自定義組件問題**
   - 確認相關依賴已正確安裝（@vueuse/core, vue 等）
   - 檢查組件路徑是否正確
   - 進階演示需要更多依賴，建置時間較長屬正常現象

### 調試技巧

```bash
# 檢查建置輸出
pnpm build:all

# 本地預覽建置結果
cd presentations/demo-basic
pnpm preview

# 檢查 workspace 配置
pnpm ls --depth=0
```

## 🔗 相關連結

- [Slidev 官方文檔](https://sli.dev)
- [Slidev GitHub](https://github.com/slidevjs/slidev)
- [Vue.js 文檔](https://vuejs.org)
- [Vite 文檔](https://vitejs.dev)
