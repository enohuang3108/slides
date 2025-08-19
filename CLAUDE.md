# 關於 Slidev 的使用方式

## layout
以下是我常用的 layout:
- two-cols，常用在兩欄的內容，右邊如果放圖片可以這樣寫:
```
---
layout: two-cols
---

left content...

::right::

<div class="flex items-center h-full">
  <img src="/image-path"/>
</div>
```
- 如果右邊不是放圖片，可以用 grid 排版:
```
<div class="grid grid-cols-2 gap-2">
   <div>
      left content
   </div>
   <div>
      right content
   </div>
</div>
```

## Icon
直接使用以下 tag 就會顯示 icon，以下是我常用的 Icon:
 - 警告: <line-md-alert-square-loop />

## Image
- 用 `npx cwebp-bin input.png -q 80 -o output.webp` 轉換圖片成 webp
