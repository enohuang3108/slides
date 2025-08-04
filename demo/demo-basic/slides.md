---
theme: default
title: Slidev 入門教學
info: |
  ## Slidev 基礎入門
  適合初學者的 Slidev 基本功能介紹
class: text-center
drawings:
  persist: false
transition: slide-left
fonts:
  local: LINESeedTW
---

# Slidev 入門教學

為開發者設計的演示文稿工具

<div class="pt-12">
  <span @click="$slidev.nav.next" class="px-2 py-1 rounded cursor-pointer" hover="bg-white bg-opacity-10">
    開始學習 <carbon:arrow-right class="inline"/>
  </span>
</div>

---
layout: iframe-right

# the web page source
url: https://caniuse.com/ttf

# a custom class name to the content
class: my-cool-content-on-the-left
---
layout: two-cols

# Left

This shows on the left

::right::

# Right

This shows on the right
---

# 什麼是 Slidev？

一個簡單易用的演示文稿工具

- 📝 **Markdown 語法** - 像寫文件一樣簡單
- ⚡ **快速上手** - 無需複雜設定
- 🎨 **美觀主題** - 內建多種主題
- 💻 **程式碼友好** - 程式碼高亮支援

---

# 基本語法

## 創建新投影片

用三個破折號分隔投影片：

````markdown
---
# 這是標題

內容放在這裡

---
# 下一頁標題
````

---

# 文字格式

使用 Markdown 語法格式化文字：

- **粗體文字**
- *斜體文字*
- `程式碼`
- [連結](https://sli.dev)

## 清單

1. 有序清單項目一
2. 有序清單項目二

- 無序清單項目
- 另一個項目

---

# 程式碼區塊

```javascript
// JavaScript 範例
function hello() {
  console.log("Hello Slidev!");
}
```

```python
# Python 範例
def greet(name):
    return f"Hello, {name}!"
```

---

# 圖片和連結

## 插入圖片
```markdown
![描述文字](圖片網址)
```

## 建立連結
```markdown
[連結文字](網址)
```

---

# 基本佈局

## 居中佈局
```yaml
---
layout: center
class: text-center
---
```

## 圖文並排
```yaml
---
layout: image-right
image: 圖片網址
---
```

---
layout: center
class: text-center
---

# 恭喜！

你已經學會了 Slidev 的基礎用法

<div class="pt-8">
  <a href="https://sli.dev" target="_blank" class="px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700">
    繼續學習
  </a>
</div>
