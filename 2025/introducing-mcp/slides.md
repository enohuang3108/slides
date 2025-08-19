---
title: Introducing MCP
theme: apple-basic
info: |
  ## Introducing MCP
  Model Context Protocol 介紹簡報

  了解 AI Agent 如何透過標準化協議與工具互動
lineNumbers: true
transition: fade-in
colorSchema: light
routerMode: hash
layout: section
fonts:
  sans: 'LINESeedTW, Noto Sans TC, Roboto'
  mono: 'Fira Code'
  local: ['LINESeedTW']
---

# Introducing MCP
## Model Context Protocol

標準化的 AI 工具協議

---

# AI Agent 是什麼？

**AI Agent** = LLM + 工具 + 自主決策

- AI 需要透過**工具**與外部世界互動（資料庫、網路等）
- LLM 會根據當前狀態**自主決定**流程與使用的工具
- **持續循環**直到完成任務

<img src="/mcp-architecture.webp" class="h-80 mt--5 mx-auto" />

<!--
這邊引用 Anthropic 的定義：LLM 會根據當前狀態自主決定流程與使用的工具，持續循環直到完成任務，這樣的系統稱為 Agent。

為了讓不同的 AI 能夠使用不同的工具，甚至能夠使用第三方開發的工具，這就需要一個標準化的溝通方式。
-->
<!--
為了讓不同的 AI 能夠使用不同的工具，甚至能夠使用第三方開發的工具，這就需要一個標準化的溝通方式，這就是 MCP (Model Context Protocol) 的目的。

透過 MCP 規範開發的工具，任何遵循相同協議的系統都能夠使用。
-->

---

# Introducing MCP


<div class="text-xl leading-relaxed">

**MCP(Model Context Protocol)** 是一種標準化協議，定義了：

- AI 如何使用工具的標準方式
- AI Client 如何與 Tool Server 進行溝通

</div>

<!-- MCP 是一種標準化協議，定義了 AI 如何使用工具，或者說 AI Client 如何與 Tool Server 進行溝通。 -->

---
layout: two-cols
---

# Client-Server 架構

MCP 採用 Client-Server 架構：

- **MCP Server**
  提供給 AI 使用的具體工具或功能
- **MCP Client**
  連接 Server 並管理 Context
- **MCP Host**
  AI 應用程式（Cursor、Claude Desktop）

::right::

<div class="flex items-center h-full">
  <img src="/mcp-client-server-architecture.webp" />
</div>

<!--
一個 Host 可能有多個 Client。Server 提供具體的工具或功能，能提供給 AI 使用，例如網路搜尋、資料庫存取等功能。
-->

---
layout: center
class: "text-center"
---

# MCP 的目的：重複使用現有工具

### 以開發 **GitHub Agent** 為例

---
layout: two-cols
---
# 使用 MCP 之前

::right::
<img src="/before-mcp-development.webp" class="h-full mx-auto" />

<!--
在沒有 MCP 的情況下，你需要逐一實作 GitHub 的各項功能（Push、Pull、Issue 管理等）。
-->

---
class: "h1-mb-0"
---

# 使用 MCP 之後

<div class="flex h-full justify-center items-center gap-16 mt--4">
  <img src="/after-mcp-development-1.webp" class="h-full" />
  <img src="/after-mcp-development-2.webp" class="h-full" />
</div>


<!--
但如果服務商提供 MCP 工具，你可以直接透過 MCP 協議使用這些現成的工具，大幅減少開發與維護的負擔。
-->

---

# MCP Flow

<img src="/mcp-flow.webp" class="h-full mx-auto" />

<!--
1. **Client 與 Server 建立連接**
2. **Server** 向 Client 提供可用的**工具清單**
3. **Client** 將工具清單提供給 **LLM**
4. **LLM** 根據任務需求選擇適當的工具，告訴 Client
5. **Client** 告訴 Server 要執行哪個工具，還有其參數
6. **Server** 執行指定的工具
7. 將執行結果回傳給 **LLM**，LLM 基於結果做出結論或進行下一輪循環
-->


---

# MCP Transports
## 支援本地/遠端傳輸方式
<br/>

1. STDIO Transport
2. HTTP Transport

---
layout: two-cols
---

# STDIO Transport
## 本地通訊方式

<br/>

- 使用 **subprocess** 在本地執行 MCP Server
- 在同一台機器上 Client 與 Server 通訊
- 支援**雙向通訊**

::right::

<div class="flex items-center h-full">
  <img src="/mcp-stdio-transport.webp"/>
</div>

---

# HTTP Transport
## 遠端通訊方式

<br/>

1. Stateless HTTP
2. SSE

<br/>
<br/>
<br/>

<line-md-alert-square-loop /> 標準 HTTP 的限制：
- 無法讓 Server 主動向 Client 發起請求
- Server 端的通知或 Log 功能會受到限制

**解決方法：** 使用 Streamable HTTP

---
layout: two-cols
---

# Streamable HTTP (SSE)


- Client 與 Server 初始化後，透過 **Server-Sent Events (SSE)** 建立持久連接
- 支援 Server **主動向 Client 發送通知**

**設定：** `stateless_http=False`, `json_response=False`

::right::

<div class="flex flex-col gap-2 items-center h-full">
  <img src="/mcp-streamable-http.webp"/>
  <img src="/mcp-streamable-http2.webp"/>
</div>

---
layout: two-cols
---

# Stateless HTTP

**適用場景：** 需要 **load balancer** 的環境

**缺點：** 無法支援 Server 主動通知功能

需要在**擴展性**與**功能性**之間做出取捨

**設定：** `stateless_http=True`

::right::

<div class="flex items-center h-full">
  <img src="/mcp-stateless-http.webp"/>
</div>

<!--
為什麼 load balancer 時不能用 SSE?
因為 SSE 時，Client 會發出 GET 建立連接，這時候都還不會有問題，但後續在 Call Tool 時會發出 POST 請求，
這個時候如果有 load balancer，可能會導致請求被分配到不同的 Server 上，造成狀態不一致。
-->

---

# MCP Example

<div class="grid grid-cols-2 gap-2">

<div>

## Client：

```python
from mcp.client import MCPClient

# 透過 subprocess 建立 MCPClient
client = MCPClient(command=["python", "server.py"])

# use tool
result = client.call_tool("add", {"a": 3, "b": 4})

print("3 + 4 =", result)
```
</div>

<div>

## Server：

```python
from mcp.server.fastmcp import FastMCP

# 建立 MCP Server
mcp = FastMCP(name="AdditionServer")

@mcp.tool()
def add(a: int, b: int) -> int:
    """加法工具：回傳 a + b 的結果"""
    return a + b

if __name__ == "__main__":
    mcp.run(transport="stdio")
```
</div>
</div>

---
layout: two-cols
---

# 好用的 MCP Server

- context7
### Before
1. 無法獲得最新的 Document
2. 可能出現幻覺

<Footnotes x='l'>
  <Footnote>
    <a href="https://github.com/upstash/context7" rel="noreferrer" target="_blank">
      Context7
    </a>
  </Footnote>
</Footnotes>

::right::

<div class="flex items-center h-full">
  <img src="/before-context7.webp"/>
</div>

---
layout: two-cols
---

# 好用的 MCP Server
- context7
### After
1. 搜尋最新的 Document
2. 提供原始範例

<Footnotes x='l'>
  <Footnote>
    <a href="https://github.com/upstash/context7" rel="noreferrer" target="_blank">
      Context7
    </a>
  </Footnote>
</Footnotes>

::right::

<div class="flex items-center h-full">
  <img src="/after-context7.webp"/>
</div>

---

# 參考資料
- [Anthropic MCP 介紹課程](https://anthropic.skilljar.com/introduction-to-model-context-protocol/)
- [MCP 官方文件 - 入門指南](https://modelcontextprotocol.io/docs/getting-started/intro)
- [MCP 官方文件 - Server 快速開始](https://modelcontextprotocol.io/quickstart/server)
- [ihower MCP](https://ihower.tw/presentation/ihower-MCP-2025-05-23.pdf)
