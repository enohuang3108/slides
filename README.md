# Slidev Monorepo

一個用於管理多個 Slidev 的 monorepo 專案，支援自動部署到 GitHub Pages。

## 🎯 專案特色

- 📦 **Monorepo 架構**: 在單一倉庫中管理多個 Slidev 演示文稿
- 🚀 **自動部署**: 透過 GitHub Actions 自動部署到 GitHub Pages

## 🚀 快速開始

### 安裝與設定

1. **複製專案**

   ```bash
   git clone https://github.com/enohuang3108/mono-slidev.git
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
   cd demo/demo-basic
   pnpm dev
   ```

4. **建置所有演示文稿**
   ```bash
   pnpm build
   ```

## 📖 GitHub Pages 部署指南

### 自動部署設定

1. **啟用 GitHub Pages**
   - 前往 GitHub 專案的 Settings
   - 在 Pages 頁面中選擇 "Deploy from a branch"
   - 選擇 "GitHub Actions" 作為 Source

2. **推送代碼觸發部署**

   ```bash
   git add .
   git commit -m "new commit"
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

## 🔧 新增 Slide

```bash
cd 2025
npx slidev init new-slide
```

## Cool Example

- py-intro
   - [Slidev](https://kareimgazer.github.io/py-intro/)
   - [Source Code](https://github.com/KareimGazer/py-intro)

## 🔗 相關連結

- [Slidev 官方文檔](https://sli.dev)
- [Slidev GitHub](https://github.com/slidevjs/slidev)
- [Vue.js 文檔](https://vuejs.org)
- [Vite 文檔](https://vitejs.dev)
