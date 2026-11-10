# Autonomous Clinical Operations: ICU Bed Allocation with Clinical Refusal Boundaries

[![Pester Verification](https://img.shields.io/badge/pester-16%2F16%20passing-brightgreen)](tests/ClinicalBedSafety.Tests.ps1)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Architecture Deep-Dive](https://img.shields.io/badge/blog-alerasoul.net-0a1128)](https://alerasoul.net/autonomous-clinical-bed-allocation-agent/)

> **Primary Governance Artefact:** DCB0129 Clinical Safety Refusal Boundary Matrix  
> **Accountable Service Owner:** Chief Medical Officer & Duty Hospital Matron  
> **Full Architectural Deep-Dive:** [https://alerasoul.net/autonomous-clinical-bed-allocation-agent/](https://alerasoul.net/autonomous-clinical-bed-allocation-agent/)

---

## Repository Layout (13 Files)

```text
├── .github/workflows/clinical-safety-ci.yml
├── .gitignore
├── LICENSE
├── README.md
├── docs/MATRON-TRIAGE-RUNBOOK.md
├── fixtures/icu-acuity-patients.json
├── infra/clinical-enclave.bicep
├── queries/Clinical-Safety-Audit.kql
├── safety-case/DCB0129-Clinical-Safety-Case.md
├── safety-case/Hazard-Log-NEWS2.csv
├── schemas/hl7-fhir-encounter.schema.json
├── src/Test-ClinicalBedStepDownSafety.ps1
└── tests/ClinicalBedSafety.Tests.ps1
```

## Quickstart & Offline Verification

```powershell
# 1. Execute the primary PowerShell 7 evaluator
pwsh -NoProfile -File ./src/Test-ClinicalBedStepDownSafety.ps1

# 2. Run the 16-test Pester verification contract
Invoke-Pester -Path ./tests/ClinicalBedSafety.Tests.ps1 -Output Detailed
```

## License

Released under the [MIT License](LICENSE). Authored by **Shahrad Alerasoul** ([alerasoul.net](https://alerasoul.net)).
