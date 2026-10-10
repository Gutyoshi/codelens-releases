# CodeLens — Releases

Public native binaries for [CodeLens Pro](https://codelens.cloud) — The Context Accelerator & Architecture Armor for Autonomous AI Coding Agents.

---

## 🔑 Early Access — Chave da Comunidade
Para testar de imediato sem necessidade de cadastro, utilize a chave pública do grupo:

```text
cl_live_community_trial_2026
```
*(Cota coletiva ativa de **20.000 requisições** no Turso DB).*

---

## 📖 Guia Passo a Passo de Uso
Para ver como validar o MCP, configurar no Cursor/Claude/AGY e exemplos práticos de prompts com a IA:
👉 **[Consulte o Guia Completo: COMO_USAR.md](COMO_USAR.md)**

---

## ⚡ Quick Install (1-Line Command)

### Windows (PowerShell):
```powershell
irm https://codelens.cloud/install.ps1 | iex
```

### macOS & Linux (Terminal):
```bash
curl -fsSL https://codelens.cloud/install.sh | bash
```

*O instalador detecta a arquitetura automaticamente, adiciona o binário ao PATH e inicia o assistente de ativação da chave.*

---

## 📦 Direct Downloads

The latest precompiled native binaries are available on the [Releases page](https://github.com/Gutyoshi/codelens-releases/releases/latest).

| Platform | Architecture | Archive | Status |
| :--- | :--- | :--- | :--- |
| **Windows** | x86_64 (Intel / AMD) | [`codelens-win-x64.zip`](https://codelens.cloud/codelens-win-x64.zip) | ✅ Verified Native |
| **macOS** | Apple Silicon (M1 / M2 / M3 / M4) | [`codelens-darwin-arm64.tar.gz`](https://codelens.cloud/codelens-darwin-arm64.tar.gz) | ✅ Verified Native |
| **macOS** | Intel x64 | [`codelens-darwin-x64.tar.gz`](https://codelens.cloud/codelens-darwin-x64.tar.gz) | ✅ Verified Native |
| **Linux** | x86_64 (Universal musl static) | [`codelens-linux-x64.tar.gz`](https://codelens.cloud/codelens-linux-x64.tar.gz) | ✅ Verified Native |

---

## 🚀 How It Works

CodeLens compiles directly to optimized, stripped machine code with zero Node.js runtime, zero V8 overhead, and sub-15ms architectural resolution.

1. **Sub-second Codebase Mapping:** Mapeia 10.000+ arquivos em milissegundos através do nosso algoritmo proprietário de indexação contínua, preservando contratos e interfaces tipadas.
2. **Economia de 85% a 96% de Tokens:** Aplica o algoritmo de preservação estrutural que condensa o código redundante e entrega apenas os contratos atômicos necessários para a LLM.
3. **Validação Criptográfica em Tempo Real:** Compara assinaturas SHA-256 de alterações locais e sincroniza cirurgicamente apenas os módulos modificados sem reprocessamento massivo.
4. **Isolamento Atômico de Dependências:** Extrai blocos de código com fechamento de dependências e tipos locais, eliminando alucinações de referências quebradas.
5. **Zero Vazamento de Código:** Todo o processamento executa estritamente local via protocolo STDIO MCP sem enviar linhas de código ou repositórios para servidores externos.

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
Licensing, enterprise keys and token balance management: [CodeLens Gateway](https://codelens.cloud).
