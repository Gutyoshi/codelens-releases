# CodeLens — Releases

Public native binaries for [CodeLens Pro](https://gateway-six-opal.vercel.app) — The Context Accelerator & AST Protection Engine for Autonomous AI Coding Agents.

---

## ⚡ Quick Install (1-Line Command)

### Windows (PowerShell):
```powershell
irm https://gateway-six-opal.vercel.app/install.ps1 | iex
```

### macOS & Linux (Terminal):
```bash
curl -fsSL https://gateway-six-opal.vercel.app/install.sh | bash
```

*O instalador detecta a arquitetura automaticamente, adiciona o binário ao PATH e inicia o assistente de ativação da chave.*

---

## 📦 Direct Downloads

The latest precompiled native binaries are available on the [Releases page](https://github.com/Gutyoshi/codelens-releases/releases/latest).

| Platform | Architecture | Archive | Status |
| :--- | :--- | :--- | :--- |
| **Windows** | x86_64 (Intel / AMD) | [`codelens-win-x64.zip`](https://gateway-six-opal.vercel.app/codelens-win-x64.zip) | ✅ Verified Native |
| **macOS** | Apple Silicon (M1 / M2 / M3 / M4) | [`codelens-darwin-arm64.tar.gz`](https://gateway-six-opal.vercel.app/codelens-darwin-arm64.tar.gz) | ✅ Verified Native |
| **macOS** | Intel x64 | [`codelens-darwin-x64.tar.gz`](https://gateway-six-opal.vercel.app/codelens-darwin-x64.tar.gz) | ✅ Verified Native |
| **Linux** | x86_64 (Universal musl static) | [`codelens-linux-x64.tar.gz`](https://gateway-six-opal.vercel.app/codelens-linux-x64.tar.gz) | ✅ Verified Native |

---

## 🚀 How It Works

CodeLens compiles directly to optimized, stripped machine code (Rust/C++) with zero Node.js runtime, zero V8 overhead, and sub-15ms AST resolution in RAM.

1. **Sub-second AST indexing:** Mapeia 10.000+ arquivos em RAM preservando contratos, tipos e interfaces.
2. **Economia de 85% a 96% de tokens:** Oculta o miolo redundante de funções e entrega apenas o esqueleto tipado para a LLM.
3. **Detecção Dirty em Tempo Real via Git:** Compara hashes SHA-256 de arquivos editados e reprocessa cirurgicamente apenas o que foi alterado.
4. **Zero Vazamento de Código:** Todo o fatiamento e indexação executam localmente via protocolo STDIO MCP sem enviar seu código para a nuvem.

---

## 🔄 Auto-Update

Once installed, update directly from your terminal at any time:

```bash
codelens update
# ou
codelens --update
```

The CLI queries the Gateway, downloads the latest compiled binary for your OS, replaces the executable, and updates in less than 200ms.

---

## 🛡️ Supported IDEs & Harnesses

- **Cursor** (Project & Global `.cursor/mcp.json` + `.cursorrules`)
- **Claude Desktop** (MCP Stdio Client)
- **Windsurf** (`.mcp.json`)
- **Antigravity CLI / AGY** (`mcp_config.json`)
- **VS Code** (Continue / Cline / Roo Code / Standard MCP)

---

## 📄 License & Source Code

Source code is closed-source & proprietary © Trust Forge / dj.  
Licensing, enterprise keys and token balance management: [CodeLens Gateway](https://gateway-six-opal.vercel.app).
