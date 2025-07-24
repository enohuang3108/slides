---
# You can also start simply with 'default'
theme: bricks

# some information about your slides (markdown enabled)
title: Model Context Protocol (MCP) 介紹
info: |
  ## Slidev Starter Template
  Presentation slides for developers.

  Learn more at [Sli.dev](https://sli.dev)
# apply unocss classes to the current slide
class: text-center
# https://sli.dev/features/drawing
drawings:
  persist: false
# slide transition: https://sli.dev/guide/animations.html#slide-transitions
transition: slide-left
# enable MDC Syntax: https://sli.dev/features/mdc
mdc: true
# open graph
# seoMeta:
#  ogImage: https://cover.sli.dev
---

# Model Context Protocol (MCP) 介紹

現代 AI Agent 的標準化連接協議

<div class="pt-12">
  <span @click="$slidev.nav.next" class="px-2 py-1 rounded cursor-pointer" hover="bg-white bg-opacity-10">
    開始探索 <carbon:arrow-right class="inline"/>
  </span>
</div>

---

# 議程

<div class="grid grid-cols-1 gap-4 text-left">

1. **Agent 架構** - 現代 AI Agent 的核心組件
2. **Tool 系統** - AI Agent 如何與外部世界互動
3. **MCP 介紹** - Model Context Protocol 是什麼
4. **MCP 功能** - 核心特色與能力
5. **使用方法** - 如何實作與部署 MCP

</div>

---

## layout: section

# 第一部分

## Agent 架構

---

# AI Agent 核心架構 (2025)

<div class="grid grid-cols-2 gap-8">

<div>

## 核心組件

- **感知模組 (Perception)** - 處理環境輸入
- **記憶系統 (Memory)** - 工作記憶 + 持久記憶
- **規劃推理 (Planning)** - 目標導向的行動序列
- **執行層 (Execution)** - 與外部系統互動

</div>

<div>

## 架構模式

- **單一 Agent** - 個人助理、微服務
- **多 Agent 系統** - 協作與競爭
- **代理架構** - 自主性與反思能力

</div>

</div>

---

# Agent 推理框架

<div class="grid grid-cols-2 gap-8">

<div>

## ReAct 範式

```
Think → Act → Observe
```

- **Think**: 分析與計劃
- **Act**: 執行工具操作
- **Observe**: 觀察結果並調整

</div>

<div>

## 關鍵能力

- **意向性 (Intentionality)** - 設定目標
- **預見性 (Forethought)** - 預期結果
- **自我反應性** - 監控表現
- **自我反思性** - 學習改進

</div>

</div>

---

## layout: section

# 第二部分

## Tool 系統

---

# Tool 系統概念

<div class="grid grid-cols-2 gap-8">

<div>

## 什麼是 Tool？

- API 整合
- 資料庫查詢
- 檔案操作
- 外部服務呼叫
- 命令執行

</div>

<div>

## Tool 的重要性

- 擴展 Agent 能力
- 連接真實世界
- 實現複雜任務
- 提供實時資訊

</div>

</div>

---

# Tool 整合挑戰

<div class="text-center mb-8">

## N×M 整合問題

</div>

<div class="grid grid-cols-3 gap-4">

<div class="bg-red-50 p-4 rounded">

### 傳統方式

- 每個 AI 系統需要
- 為每個工具建立
- 客製化連接器
- 維護成本高昂

</div>

<div class="bg-yellow-50 p-4 rounded">

### 問題

- 重複開發
- 不同標準
- 安全性問題
- 擴展困難

</div>

<div class="bg-green-50 p-4 rounded">

### MCP 解決方案

- 標準化協議
- 一次開發
- 多處使用
- 安全可靠

</div>

</div>

---

## layout: section

# 第三部分

## MCP 介紹

---

# 什麼是 MCP？

<div class="text-center mb-8">

## Model Context Protocol

**AI 時代的 USB-C**

</div>

<div class="grid grid-cols-2 gap-8">

<div>

## 核心定義

- Anthropic 於 2024 年推出
- 開放標準協議
- 連接 AI 與資料源
- 標準化 AI 系統整合

</div>

<div>

## 類比說明

就像 USB-C 為設備提供標準連接<br>
MCP 為 AI 模型提供標準化的<br>
資料源與工具連接方式

</div>

</div>

---

# MCP 架構設計

<div class="grid grid-cols-2 gap-8">

<div>

## Client-Server 架構

- **MCP Host** - 應用程式 (Claude Desktop, IDE)
- **MCP Client** - 協議客戶端 (1:1 連接)
- **MCP Server** - 輕量程式 (提供特定能力)

</div>

<div>

## 連接流程

1. **握手** - 交換能力與協議版本
2. **發現** - 查詢可用能力
3. **互動** - 執行工具與存取資源

</div>

</div>

---

# 2025 年重大採用

<div class="grid grid-cols-2 gap-8">

<div>

## 主要採用者

<div v-mark="{ at: 1, color: '#34d399', type: 'highlight' }">

**OpenAI** (2025年3月)

- ChatGPT 桌面版支援
- Agents SDK 整合

</div>

<div v-mark="{ at: 2, color: '#60a5fa', type: 'highlight' }">

**Google DeepMind** (2025年4月)

- Gemini 模型支援
- 基礎設施整合

</div>

<div v-mark="{ at: 3, color: '#f59e0b', type: 'highlight' }">

**Microsoft**

- 官方 C# SDK
- .NET 生態整合

</div>

</div>

<div>

## 產業影響

- 數千個整合
- 開放標準
- 快速成長的生態系統
- 成為 AI 互操作性標準

</div>

</div>

---

## layout: section

# 第四部分

## MCP 功能特色

---

# 核心功能

<div class="grid grid-cols-3 gap-6">

<div class="bg-blue-50 p-4 rounded">

### 資源 (Resources)

- 檔案與文件
- 資料庫內容
- 外部知識庫
- 即時資料流

</div>

<div class="bg-green-50 p-4 rounded">

### 工具 (Tools)

- API 整合
- 可執行函數
- 外部程式連接
- 自動化操作

</div>

<div class="bg-purple-50 p-4 rounded">

### 提示 (Prompts)

- 範本化互動
- 結構化對話
- 上下文注入
- 工作流程引導

</div>

</div>

---

# 進階能力 (2025)

<div class="grid grid-cols-2 gap-8">

<div>

## 使用者體驗

- **進度追蹤** - 長時間任務監控
- **取消支援** - 自然流程控制
- **自動完成** - 智慧建議
- **日誌記錄** - 除錯與監控

</div>

<div>

## 系統能力

- **動態發現** - 即時偵測可用服務
- **安全邊界** - 資源控制與存取管理
- **多語言 SDK** - Python, TypeScript, C#, Java
- **跨平台支援** - 桌面、網頁、行動裝置

</div>

</div>

---

# 熱門 MCP 伺服器

<div class="grid grid-cols-2 gap-8">

<div>

## 企業整合

- **Salesforce** - CRM 資料
- **Slack** - 即時對話
- **Notion** - 知識管理
- **Google Calendar** - 行程安排

</div>

<div>

## 開發工具

- **GitHub** - 程式碼管理
- **Docker** - 容器化部署
- **Azure** - 雲端資源
- **PostgreSQL** - 資料庫操作

</div>

</div>

---

# 安全性特色

<div class="grid grid-cols-2 gap-8">

<div>

## 內建安全

- 伺服器控制自己的資源
- 不需與 LLM 提供者分享 API 金鑰
- 清楚的系統邊界
- 獨立的身份驗證與存取控制

</div>

<div>

## 注意事項

2025年4月安全研究發現：

- Prompt injection 風險
- 工具權限組合問題
- 偽造工具替換風險

_需要謹慎的安全配置_

</div>

</div>

---

## layout: section

# 第五部分

## 使用方法

---

# 快速開始

<div class="grid grid-cols-2 gap-8">

<div>

## 環境需求

```bash
# Python 3.10+
pip install mcp

# 或使用 uv
uv init my-mcp-server
cd my-mcp-server
uv add "mcp[cli]" httpx
```

</div>

<div>

## 基本結構

1. **環境設定** - 載入憑證與配置
2. **伺服器初始化** - 建立 MCP 伺服器
3. **定義組件** - 工具、資源、提示
4. **暴露能力** - 讓客戶端可存取

</div>

</div>

---

# 建立第一個 MCP 伺服器

```python {1-5|7-12|14-20|22-25}
# 基本導入
from mcp import Server, McpError
from mcp.types import Tool, TextContent
import asyncio

# 初始化伺服器
app = Server("my-first-server")

@app.tool()
async def hello_world(name: str) -> str:
    """向指定的人打招呼"""
    return f"你好, {name}! 歡迎使用 MCP!"

@app.resource("config://settings")
async def get_settings():
    """提供設定資訊"""
    return TextContent(
        type="text",
        text="這是我的設定檔案內容"
    )

# 啟動伺服器
if __name__ == "__main__":
    asyncio.run(app.run())
```

---

# 實際應用範例

<div class="grid grid-cols-2 gap-8">

<div>

## GitHub 整合

```python
@app.tool()
async def get_pr_details(repo: str, pr_number: int):
    """獲取 PR 詳細資訊"""
    # GitHub API 呼叫
    return pr_info

@app.tool()
async def create_issue(title: str, body: str):
    """建立新的 issue"""
    # 建立 issue 邏輯
    return issue_url
```

</div>

<div>

## 資料庫查詢

```python
@app.tool()
async def query_users(filter: str):
    """查詢使用者資料"""
    # 資料庫查詢
    return users

@app.resource("db://users/{user_id}")
async def get_user(user_id: str):
    """獲取特定使用者"""
    # 返回使用者資料
    return user_data
```

</div>

</div>

---

# 與 Claude Desktop 整合

<div class="grid grid-cols-2 gap-8">

<div>

## 設定檔案

```json
{
  "mcpServers": {
    "my-server": {
      "command": "python",
      "args": ["path/to/server.py"],
      "env": {
        "API_KEY": "your-api-key"
      }
    }
  }
}
```

</div>

<div>

## 使用步驟

1. 編寫 MCP 伺服器
2. 更新 Claude Desktop 設定
3. 重啟 Claude Desktop
4. 開始使用新功能！

</div>

</div>

---

# 最佳實踐

<div class="grid grid-cols-2 gap-8">

<div>

## 開發建議

- 單一責任原則 - 每個伺服器專注特定領域
- 錯誤處理 - 優雅處理異常狀況
- 文件撰寫 - 清楚的工具描述
- 測試驗證 - 確保功能正確性

</div>

<div>

## 安全考量

- 輸入驗證 - 防止惡意輸入
- 權限控制 - 最小權限原則
- 資料保護 - 敏感資訊加密
- 存取記錄 - 審計與監控

</div>

</div>

---

# 學習資源

<div class="grid grid-cols-2 gap-8">

<div>

## 官方資源

- **官方文件**: modelcontextprotocol.io
- **GitHub**: github.com/modelcontextprotocol
- **Python SDK**: mcp python 套件
- **TypeScript SDK**: @modelcontextprotocol/sdk

</div>

<div>

## 社群資源

- **Microsoft 課程**: mcp-for-beginners
- **範例專案**: 數千個社群伺服器
- **最佳實踐**: DataCamp, Towards Data Science
- **生態系統**: PulseMCP 目錄

</div>

</div>

---

layout: center
class: text-center

---

# 結論

## MCP: AI 時代的標準化協議

<div class="pt-8 grid grid-cols-3 gap-8">

<div>
<h3>統一標準</h3>
解決 N×M 整合問題
</div>

<div>
<h3>生態繁榮</h3>
數千個整合與應用
</div>

<div>
<h3>未來趨勢</h3>
AI 互操作性的基石
</div>

</div>

<div class="pt-12">
  <a href="https://modelcontextprotocol.io" target="_blank" class="px-6 py-3 bg-blue-600 text-white rounded-lg hover:bg-blue-700">
    開始使用 MCP
  </a>
</div>

---

layout: center
class: text-center

---

# 謝謝！

## Q & A

<div class="pt-8">
有任何關於 MCP 的問題嗎？
</div>
