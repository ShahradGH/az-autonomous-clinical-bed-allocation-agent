# NHS DCB0129 Clinical Risk Management Summary

- **Clinical Safety Officer**: Chief Medical Officer & Duty Hospital Matron
- **Hazard ID**: HAZ-ICU-001 (Algorithmic step-down of high-acuity patient)
- **Mitigation**: Hard deterministic veto in `src/Test-ClinicalBedStepDownSafety.ps1` when `NEWS2 >= 5` or active vasopressor/ventilator telemetry is present.
