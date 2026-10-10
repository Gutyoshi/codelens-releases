# ⚡ CodeLens Pro — Guia Completo: Do Zero ao Uso com IA

> **O Acelerador de Contexto e Guardião de Arquitetura para Agentes Autônomos de Código**  
> Economia comprovada de **85% a 96% de tokens** no Cursor, Claude Desktop, Antigravity (`agy`), Windsurf e VS Code.

---

## 📋 Sumário Rápido do Fluxo
1. **Instalar via Terminal** (1 comando de 1 linha).
2. **Ativar a Chave de Licença** (use a chave pública comunitária ou sua chave própria).
3. **Injeção Automática** do MCP e regras em todos os seus editores/assistentes.
4. **Validar no seu assistente** (Cursor, Claude, `agy`, etc.).
5. **Comandar a IA** com zero desperdício de tokens.

---

## 🔑 Chave de Teste da Comunidade (Early Access)
Para testar de imediato sem necessidade de cadastro prévio, utilize a chave oficial do grupo:

```text
cl_live_community_trial_2026
```
*(Cota coletiva de 20.000 requisições ativas no Turso DB).*

---

## 🚀 Passo 1: Instalação Nativa (1 Linha no Terminal)

### No Windows (PowerShell):
Abra o **PowerShell** e execute:

```powershell
irm https://codelens.cloud/install.ps1 | iex
```

### No macOS ou Linux (Terminal / Bash / Zsh):
Abra o **Terminal** e execute:

```bash
curl -fsSL https://codelens.cloud/install.sh | bash
```

### O que acontece automaticamente nos bastidores:
- Detecta seu sistema operacional e arquitetura (Windows x64, macOS Apple Silicon M1/M2/M3/M4, macOS Intel ou Linux x64).
- Baixa o executável nativo compilado (Rust assembly x86_64/arm64, ~2.3 MB).
- Adiciona o binário ao seu `PATH` global do sistema.
- Inicia imediatamente o assistente de configuração no próprio terminal.

---

## 🔑 Passo 2: Ativação da Chave

O assistente exibirá o banner do CodeLens e solicitará a chave:

```text
🔑 Digite sua chave de licença (cl_live_...):
```

1. Cole a chave comunitária `cl_live_community_trial_2026` (ou sua chave pessoal) e aperte **Enter**.
2. O CLI valida com o Gateway em tempo real.
3. A chave é salva com segurança em `~/.codelens/config.json`.

---

## ⚙️ Passo 3: Injeção Automática do MCP e Regras

Após validar a chave, o CodeLens configura tudo sozinho:

- ✅ **Servidor MCP injetado nos clientes de IA:**
  - **Cursor**: `.cursor/mcp.json` e configuração global do usuário
  - **Claude Desktop**: `claude_desktop_config.json`
  - **Antigravity CLI / IDE (`agy`)**: `~/.gemini/antigravity-cli/mcp_config.json`
  - **Windsurf / VS Code**: `.mcp.json`
- ✅ **Regra Mestra injetada:**
  - Configura o CodeLens como radar de primeiro disparo da IA, eliminando varreduras cegas de diretórios e liberando inspeção profunda dos arquivos identificados.
- ✅ **Skill Agêntica criada:**
  - Registra a skill em `.agents/skills/codelens/SKILL.md`.

---

## 🔍 Passo 4: Validando se o MCP está Conectado

> ⚠️ **Importante:** Se o seu editor (Cursor ou Claude Desktop) já estava aberto durante a instalação, dê um **Reload Window** (`Ctrl+Shift+P` ➔ *Developer: Reload Window*) ou reinicie o aplicativo para que ele leia a nova configuração do MCP.

### No Cursor / Windsurf:
- Vá em **Settings ➔ MCP Servers** (ou verifique o arquivo `.cursor/mcp.json`).
- O servidor `codelens` aparecerá conectado com a luz verde (**Running**).

### No Claude Desktop:
- Clique no ícone de **🔌 Ferramentas / MCP** no canto inferior direito do chat.
- O servidor `codelens` estará listado como conectado.

### No Antigravity (`agy` / CLI):
No prompt do chat, pergunte:
> *"Você tem acesso às ferramentas do CodeLens? Quais ferramentas você vê?"*

A IA listará as ferramentas oficiais:
- `lens_resolve_context`
- `lens_surgical_focus`
- `lens_blueprint`
- `lens_semantic_search`
- `lens_orphan_scanner`
- `lens_sync_workspace`
- `lens_inspect_workspace`

---

## 💬 Passo 5: Como Comandar a IA na Prática

### 🧠 Como a Mágica Funciona:
Quando você pede algo à IA no seu projeto:
1. **Você dá o comando:** ex: *"Utilize o CodeLens para analisar o fluxo de checkout"*.
2. **A IA consulta o CodeLens:** Ela aciona `lens_resolve_context` em 1 único disparo.
3. **O CodeLens resolve instantaneamente (<25ms):** Em vez de ler dezenas de arquivos inteiros, o algoritmo proprietário do CodeLens mapeia a arquitetura do projeto com precisão cirúrgica, localiza os componentes exatos, contratos tipados e o raio de impacto (`Blast Radius`).
4. **Economia Imediata:** A IA recebe apenas as fatias necessárias de código, economizando até **95% dos tokens** da janela de contexto.
5. **Implementação Precisa:** A IA constrói ou refatora com zero alucinações e sem quebrar dependências.

---

### 🌟 Exemplo 1: Melhorar ou Refatorar uma Página
> *"Utilize o CodeLens para analisar a página de Dashboard. Adicione feedback visual de loading no carregamento dos cards e trate erros de API sem quebrar os componentes dependentes."*

### 🚀 Exemplo 2: Adicionar uma Nova Feature sem Quebrar o Sistema
> *"Utilize o CodeLens para encontrar onde os pedidos são processados e adicione um botão para exportar relatório em CSV."*

### 🔬 Exemplo 3: Fatiar uma Função Cirúrgica
> *"Utilize o CodeLens e puxe a fatia cirúrgica da função handleCheckout. Não leia o arquivo inteiro."*

### 🛡️ Exemplo 4: Auditoria de Integridade e Arquivos Órfãos
> *"Rode o orphan scanner do CodeLens para verificar se há arquivos soltos, telas abandonadas ou imports quebrados no projeto."*

---

## 🛠️ Comandos Úteis do Terminal

Você pode rodar comandos manuais a qualquer momento:

```bash
# Reabrir o assistente ou trocar a chave de licença
codelens

# Atualizar o binário para a versão mais recente em <200ms
codelens update

# Sincronizar o mapa estrutural e gerar o ARCHITECTURE.md
codelens scan

# Iniciar o servidor MCP manualmente em modo STDIO
codelens mcp

# Desconectar e limpar a chave local
codelens logout
```

---

## 📄 Suporte & Dashboard

- **Painel de Créditos & Gestão:** [https://codelens.cloud](https://codelens.cloud)
- **Repositório Oficial de Releases:** [https://github.com/Gutyoshi/codelens-releases](https://github.com/Gutyoshi/codelens-releases)
