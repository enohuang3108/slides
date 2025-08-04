---
theme: apple-basic
title: MCP 介紹
info: ""
transition: slide-left
colorSchema: light
routerMode: hash
layout: section
fonts:
  sans: "LINESeedTW, Noto Sans TC, Robot"
  mono: Fira Code
  local: LINESeedTW
---

# MCP 介紹

---

# Agenda
- What is Agent
- MCP 簡介
- MCP 架構
- MCP 實作範例
- 總結與展望

---

# AI Agent

- AI 如果需要與外部世界有接觸就必須透過工具
- Agent 定義: 可以根據目標指令，決定步驟、不斷呼叫工具，直到完成任務

<img src="/ai-agent.webp" class="w-80 mx-auto" />

---

# AI Agent 的挑戰

<div class="grid grid-cols-2 gap-8">
<div>

## 傳統做法
- 每個工具都需要獨立整合
- 重複的安全性驗證
- 不同的資料格式
- 維護成本高

</div>
<div>

## 期望的解決方案
- 標準化的協定
- 統一的安全性管理
- 一致的資料格式
- 易於擴展

</div>
</div>

---

# MCP (Model Context Protocol)

## 什麼是 MCP？
- Anthropic 開發的開放標準
- 讓 AI 模型安全地連接到外部資源
- 標準化的客戶端-伺服器架構
- 支援多種工具和資源類型

---

# 為什麼需要 MCP？

<div class="grid grid-cols-3 gap-4">
<div class="text-center">

## 🔐 安全性
統一的權限管理和安全控制

</div>
<div class="text-center">

## 🔌 標準化
一致的協定和資料格式

</div>
<div class="text-center">

## 🚀 可擴展性
輕鬆添加新的工具和服務

</div>
</div>

---

# MCP 架構

<img src="/ai-agent-in-loop.webp" class="w-100 mx-auto" />

---

# MCP 組件

<div class="grid grid-cols-2 gap-8">
<div>

## MCP Client
- 通常是 AI 應用程式
- 發送請求給 MCP Server
- 處理回應資料

</div>
<div>

## MCP Server
- 提供工具和資源
- 處理客戶端請求
- 執行實際操作

</div>
</div>

---

# MCP 支援的功能

<div class="grid grid-cols-2 gap-8">
<div>

## Resources 資源
- 檔案系統存取
- 資料庫查詢
- API 呼叫
- 即時資料流

</div>
<div>

## Tools 工具
- 程式碼執行
- 檔案操作
- 網路請求
- 自定義功能

</div>
</div>

---

# MCP 實作範例

## 檔案系統 MCP Server

```python
from mcp.server.fastmcp import FastMCP
import os

mcp = FastMCP("filesystem-server")

@mcp.tool()
def read_file(path: str) -> str:
    """讀取檔案內容"""
    with open(path, 'r', encoding='utf-8') as f:
        return f.read()

@mcp.tool()
def list_directory(path: str) -> list:
    """列出目錄內容"""
    return os.listdir(path)
```

---

# 使用 MCP

## 1. 安裝 MCP Server
```bash
pip install mcp-server-filesystem
```

## 2. 設定 Claude Desktop
```json
{
  "mcpServers": {
    "filesystem": {
      "command": "mcp-server-filesystem",
      "args": ["/path/to/allowed/directory"]
    }
  }
}
```

---

# MCP 的優勢

<div class="grid grid-cols-2 gap-8">
<div>

## 開發者角度
- 減少重複整合工作
- 標準化的開發流程
- 豐富的生態系統
- 活躍的社群支持

</div>
<div>

## 使用者角度
- 更安全的 AI 交互
- 一致的使用體驗
- 豐富的功能擴展
- 透明的操作過程

</div>
</div>

---

# 實際應用場景

<div class="grid grid-cols-3 gap-4">
<div class="text-center">

## 📁 檔案管理
讀寫本地檔案、搜尋內容

</div>
<div class="text-center">

## 🌐 網路存取
API 呼叫、網頁抓取

</div>
<div class="text-center">

## 💾 資料庫
查詢、更新資料庫記錄

</div>
</div>

<div class="grid grid-cols-3 gap-4 mt-8">
<div class="text-center">

## 🔧 開發工具
程式碼執行、測試運行

</div>
<div class="text-center">

## 📊 資料分析
圖表生成、統計計算

</div>
<div class="text-center">

## 🤖 自動化
工作流程、任務調度

</div>
</div>

---

# 總結

## MCP 的價值
- 標準化 AI 工具整合
- 提升安全性和可維護性
- 促進 AI 生態系統發展
- 降低開發門檻

## 未來展望
- 更多工具和服務支援
- 企業級解決方案
- 跨平台相容性
- 社群驅動創新

---

# Q&A

感謝聆聽！

<div class="text-center mt-16">
<div class="text-2xl">🤔 有問題嗎？</div>
</div>

---
