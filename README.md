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
cd infrastructure/live/prod/workload1
terragrunt run-all init
```

### 3. Deployen

```bash
terragrunt run-all plan
terragrunt run-all apply
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
