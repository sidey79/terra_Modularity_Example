# Infrastruktur-Plattform mit Terraform & Terragrunt

Dieses Repository enthält ein modulares Setup für Azure-Infrastruktur mit Terraform und Terragrunt. Es unterstützt flache Strukturen, wiederverwendbare Module und produktionsreifes Arbeiten.

## 🔧 Struktur

```
infrastructure/
├── modules/               # Terraform-Module (Key Vault, Storage, Identity, Logic App)
├── live/
│   ├── defaults/          # Umgebungsspezifische Defaults
│   └── prod/
│       └── workload1/     # Beispiel-Workload
└── README.md              # Diese Datei
```

## 🚀 Erste Schritte

### 1. Tools installieren

- Terraform ≥ 1.6
- Terragrunt ≥ 0.45
- Azure CLI (`az login` ausführen)

### 2. Projekt initialisieren

```bash
cd live/prod/workload1
terragrunt init --all
```

### 3. Deployen

```bash
terragrunt plan --all
terragrunt apply --all
```

## 📦 Enthaltene Module

- **Key Vault**: CMK-Schlüssel, Access Policies, IP-basiertes Netzwerkschutz
- **Storage**: TLS 1.2, CMK, Queues/Tables dynamisch, Lifecycle & Logging optional
- **Identity**: User Assigned Identity mit optionalen RBAC-Bindungen
- **Logic App**: Consumption, optional mit Identity & Workflow-Definition

## ✨ Erweiterungsideen

- Azure Functions / App Service
- Private DNS + Endpoints
- SQL / Redis / Event Grid
- Azure Policy, Blueprint, Monitoring

## 📚 Tipps

- Defaults zentral in `live/defaults/`
- Pro Workload ein `terragrunt.hcl` + `main.tf`
- Module unabhängig testbar mit `terraform plan`

## 🙋‍♂️ Fragen?

Bei Feedback, Features oder Bugs – gerne in einem Pull Request oder direkt via Issue.  
Ansonsten: Viel Spaß beim Bauen! 😄🚀


## ☁️ Nutzung mit GitHub Codespaces

### ✅ Voraussetzungen

- GitHub-Repo mit dieser Infrastruktur-Struktur
- Zugriff auf GitHub Codespaces (mit Developer-Lizenz oder Enterprise)

---

### 🧰 Codespace starten

1. Öffne dein Repository auf GitHub
2. Klicke auf `<> Code` → **Codespaces** → `Create codespace on main`
3. Der Codespace wird in VS Code im Browser geöffnet

---

### 🔧 Devcontainer (empfohlen)

> 💡 Damit sind **Terraform**, **Terragrunt** und die **Azure CLI** sofort einsatzbereit

---

### 🚀 Bereitstellen in Codespaces

```bash
cd live/prod/workload1
terragrunt init --all
terragrunt plan --all
terragrunt apply --all
```

Du brauchst nichts lokal zu installieren – alles läuft direkt im Codespace.  
Ideal für Teams, Pull Requests und remote Deployment. 💙