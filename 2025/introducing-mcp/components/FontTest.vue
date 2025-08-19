<template>
  <!DOCTYPE html>
  <html lang="zh-TW" style="height: 100%;">

  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Font Weight Fallback vs Font Synthesis Priority</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=LXGW+WenKai+TC:wght@400&display=swap" rel="stylesheet" />

  </head>

  <body>
    <div class="container">
      <h1>字重 Fallback vs Font Synthesis 優先級測試</h1>

      <div class="info">
        <strong>測試目標：</strong><br />
        使用只載入 Regular (400)
        字重的字體，觀察當請求不存在的字重時，<br />
        模擬字重 (<code>font-synthesis: weight</code>) 與 字重回退
        (<code>font-synthesis: none</code>) 的行為差異。
      </div>

      <div class="test-section">
        <div class="test-title">
          測試 1: font-weight: 900 + font-synthesis: weight
        </div>
        <div class="text-sample font-base test1">
          測試 - 要求 900 字重並允許合成
        </div>
        <div class="weight-info">結果：粗體。</div>
      </div>

      <div class="test-section">
        <div class="test-title">
          測試 2: font-weight: 900 + font-synthesis: none
        </div>
        <div class="text-sample font-base test2">
          測試 - 要求 900 字重但禁止合成
        </div>
        <div class="weight-info">結果：未變化。</div>
      </div>

      <div class="test-section">
        <div class="test-title">
          測試 3: font-weight: 200 + font-synthesis: weight
        </div>
        <div class="text-sample font-base test3">
          測試 - 要求 200 字重並允許合成
        </div>
        <div class="weight-info">結果：未變化，無法合成細字體。</div>
      </div>

      <div class="test-section">
        <div class="test-title">
          測試 4: font-weight: 200 + font-synthesis: none
        </div>
        <div class="text-sample font-base test4">
          測試 - 要求 200 字重但禁止合成
        </div>
        <div class="weight-info">結果：未變化。</div>
      </div>

      <div class="test-section">
        <div class="test-title">測試 5: font-weight: 400 (對照組)</div>
        <div class="text-sample font-base test5">
          測試 - 使用原生 400 字重
        </div>
        <div class="weight-info">
          對照組：顯示字體原始的 Regular (400) 字重。
        </div>
      </div>

      <div class="info">
        <strong>測試結果：</strong><br />
        <ul>
          <li>瀏覽器只會模擬一個階級的粗體（大概是600字重）。</li>

        </ul>
      </div>
    </div>
  </body>

  </html>
</template>
<style>
body {
  font-family: "LXGW WenKai TC", Arial, sans-serif;
  line-height: 1.6;
  margin: 20px;
  background: #f5f5f5;
}

.container {
  max-width: 900px;
  margin: 0 auto;
  background: white;
  padding: 20px;
  border-radius: 8px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.test-section {
  margin: 25px 0;
  padding: 20px;
  border: 2px solid #ddd;
  border-radius: 5px;
}

.test-title {
  background: #333;
  color: white;
  padding: 10px;
  margin: -20px -20px 15px -20px;
  border-radius: 3px 3px 0 0;
  font-weight: bold;
  font-size: 14px;
}

.text-sample {
  font-size: 24px;
  margin: 10px 0;
  padding: 10px;
  background: #f9f9f9;
  border-left: 4px solid #2196f3;
}

.font-base {
  font-family: "LXGW WenKai TC", sans-serif;
  /* 此處我們只導入了 Noto Sans TC 的 400 (Regular) 字重 */
}

/* 測試 1: 要求不存在的字重 (900) + 允許模擬字重 */
.test1 {
  font-weight: 900;
  font-synthesis: weight;
  /* 允許瀏覽器合成粗體 */
}

/* 測試 2: 要求不存在的字重 (900) + 禁止模擬字重 */
.test2 {
  font-weight: 900;
  font-synthesis: none;
  /* 禁止瀏覽器合成粗體，應回退到最接近的可用字重 */
}

/* 測試 3: 要求不存在的字重 (200) + 允許模擬字重 */
.test3 {
  font-weight: 200;
  font-synthesis: weight;
  /* 允許瀏覽器合成細體 (如果可能) */
}

/* 測試 4: 要求不存在的字重 (200) + 禁止模擬字重 */
.test4 {
  font-weight: 200;
  font-synthesis: none;
  /* 禁止瀏覽器合成，應回退到最接近的可用字重 */
}

/* 測試 5: 使用原生 400 字重 (對照組) */
.test5 {
  font-weight: 400;
  /* 預設的 font-synthesis 是 auto，這裡省略表示允許自動合成 */
}

.info {
  background: #e8f4fd;
  padding: 15px;
  border-left: 4px solid #2196f3;
  margin: 20px 0;
  font-size: 14px;
}

.weight-info {
  font-size: 12px;
  color: #666;
  margin-top: 5px;
}
</style>
