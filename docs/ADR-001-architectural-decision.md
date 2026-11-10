# ADR-001: Autonomous Clinical Operations: ICU Bed Allocation with Clinical Refusal Boundaries

## Status
Accepted

## Service Owner & Sign-Off Authority
Chief Medical Officer & Duty Hospital Matron

## Dominant Artefact
DCB0129 Clinical Safety Refusal Boundary Matrix

## Decision & Refusal Boundary
All production state mutations must pass deterministic pre-flight policy evaluation in `src/Test-ClinicalBedStepDownSafety.ps1` and satisfy the 16-test Pester verification contract in `tests/Boundary-Verification.Tests.ps1` before execution.
