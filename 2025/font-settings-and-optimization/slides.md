---
theme: apple-basic
title: 字型設置與優化
transition: slide-left
colorSchema: light
layout: section
fonts:
  sans: "Noto Sans TC, Robot"
  serif: Roboto Slab
  mono: Fira Code
---

# 字型設置與優化

---

# 字型設置與優化
<Toc minDepth="1"/>

---

# 字體小知識

- 一般來說字型會使用 Regular、Bold 兩種字重。
- 有些字體是 **Variable Font**，本身支援多種字重。
  - 但 Variable Font 檔案本身較大，需評估使用它還是直接用特定的 Regular、Bold 字體。
  - Google Fonts 會特別標示 Variable Font。

<br/>
<br/>
<br/>

<img src="/VariableFont.webp" alt="Variable Font Example" class="m-auto" />

---
layout: iframe-right
url: https://caniuse.com/?search=ttf
---

# 字體格式

常見的字型格式包含：

| 檔案副檔名 |  壓縮程度      | 不支援的瀏覽器 |
| ----------  | ------------- | -------------- |
| `.ttf`      | 無（或極少）  | IE 部分支援    |
| `.otf`      | 無（或極少）  | IE 部分支援    |
| `.woff`     | 約 ttf 的 60% | 主流都支援     |
| `.woff2`    | 約 ttf 的 40% | IE 不支援      |

---

# 自訂字體

使用 `@font-face` 可以在 CSS 中定義自己的字體。

```css
@font-face {
  font-family: "MyWebFont";
  src: url("/fonts/MyWebFont.woff2") format("woff2");
}

body {
  font-family: "MyWebFont", sans-serif;
}
```

---

# 設定字重

若自訂字體只設定特定字重，瀏覽器會 fallback 到最接近的字重。

```css {*}{maxHeight:'400px'}
@font-face {
  font-family: "New-Font";
  font-weight: 400;
  src: url(./font-regular.ttf);
}
@font-face {
  font-family: "New-Font";
  font-weight: 600;
  src: url(./font-bold.ttf);
}

.text {
  font-weight: 300;
} /* -> 選擇 400 */
.text {
  font-weight: 400;
} /* -> 選擇 400 */
.text {
  font-weight: 500;
} /* -> 選擇 400 (瀏覽器偏好向下 fallback) */
.text {
  font-weight: 600;
} /* -> 選擇 600 */
.text {
  font-weight: 700;
} /* -> 選擇 600 */
```

---
layout: two-cols
---

# 瀏覽器會模擬字體樣式
瀏覽器可以模擬粗體、斜體、下上標
```css
{
  font-synthesis: none; /* 禁止模擬 */
  font-synthesis: weight; /* 模擬字重 */
  ...
}
```
<div class="absolute bottom-0 text-xs">
<a href="https://developer.mozilla.org/en-US/docs/Web/CSS/font-synthesis" target="_blank">MDN: font-synthesis</a>
</div>
::right::

<MaxHeightContainer>
<FontTest/>
</MaxHeightContainer>
---

# 字型加載：渲染阻塞
字型下載會阻塞畫面渲染

若 CSS 中設定的 `font-family` 是使用者電腦沒有的字體，瀏覽器需要先下載它，這會造成**渲染阻塞** (Render Blocking)，頁面會呈現空白，直到字體下載完成。

<span v-mark="{ color: 'orange' }">所以主要字體的檔案不能太大</span>

```css
/* MyWebFont 不是內建字體，會觸發下載並阻塞渲染 */
body {
  font-family: "MyWebFont", Arial, sans-serif;
}
```

<br/>
<br/>

<line-md-alert-square-loop /> <span>使用 `font-display: swap` 可以先顯示備用字體，但會造成 FOUT (Flash of Unstyled Text) 字體閃爍問題。</span>

---

# 字型加載：懶加載

### 瀏覽器會延遲加載

如果首頁沒有使用到某個字體（例如中文字型），瀏覽器會等到真正需要時（例如切換到有中文的頁面）才去下載該字型。

<img src="/browser-lazy-load.webp" class="m-auto" />


---

# 提前下載字體

當我們為 Regular 和 Bold 分別提供字體檔案時，可以利用 `preload` 提前下載：

```html
<head>
  <link
    rel="preload"
    href="/src/fonts/Inter-Bold.ttf"
    as="font"
    type="font/ttf"
    crossorigin
  />
  <link
    rel="preload"
    href="/src/fonts/Inter-Regular.ttf"
    as="font"
    type="font/ttf"
    crossorigin
  />
</head>
```
<div class="pt-2 text-xs">
<line-md-alert-square-loop /> <span>雖然是同源檔案但還是要加 <code>crossorigin</code>。<a href="https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Attributes/rel/preload#cors-enabled_fetches" target="_blank">MDN Web</a></span>
</div>

---

# 提前下載字體
### 沒有 preload

<img src="/download-fonts-not-same-time.png" class="m-auto" />

---

# 提前下載字體
### 有 preload

<img src="/download-fonts-same-time.png" class="m-auto" />

---
layout: two-cols
---

# 使用 `woff2` 優化

`ttf` 格式的字體檔案通常較大，可以使用 Google 的 `woff2` 工具進行壓縮，大幅減少檔案大小。

**壓縮後檔案大小比較：**

| font                    | ttf     | woff2   |
| ----------------------- | ------- | ------- |
| Inter-VariableFont (英) | 800 kB  | 300 kB  |
| NotoSansTC-Regular (中) | 6900 kB | 2800 kB |

<div class="pt-4 text-xs">
<p>工具參考:</p>
<p><a href="https://github.com/google/woff2" target="_blank">google/woff2</a></p>
</div>

::right::

### Fallback 機制

為了兼容不支援 `woff2` 的舊版瀏覽器，可以提供 `ttf` 作為備用選項。

```css
@font-face {
  font-family: "Inter";
  src:
    /* 優先使用 woff2 */
    url(./fonts/Inter.woff2) format("woff2"),
    /* 若不支援則使用 ttf */
    url(./fonts/Inter.ttf) format("truetype");
}
```

<img src="/use-woff2.webp" class="m-auto" />
