# Test-ClinicalBedStepDownSafety.ps1
[CmdletBinding()]
param(
    [Parameter(Mandatory)] [PSCustomObject]$PatientContext,
    [Parameter(Mandatory)] [PSCustomObject]$TargetWardState
)

$ErrorActionPreference = 'Stop'

# 1. Stale Vitals Refusal Boundary (> 45 minutes)
if ($PatientContext.MinutesSinceLastNews2Observation -gt 45) {
    return [PSCustomObject]@{
        EncounterId  = $PatientContext.EncounterId
        Decision     = 'VETO_STALE_OBSERVATIONS'
        SafeToStage  = $false
        HazardCode   = 'DCB0129-HAZ-04'
        Reason       = "Latest NEWS2 observation is $($PatientContext.MinutesSinceLastNews2Observation)m old (Max: 45m)."
    }
}

# 2. Acuity & Organ Support Refusal Boundary
if ($PatientContext.News2Score -ge 5 -or $PatientContext.SingleAnyParameterScore -eq 3 -or $PatientContext.RequiresInotropes) {
    return [PSCustomObject]@{
        EncounterId  = $PatientContext.EncounterId
        Decision     = 'VETO_HIGH_ACUITY_PATIENT'
        SafeToStage  = $false
        HazardCode   = 'DCB0129-HAZ-01'
        Reason       = "Patient acuity (NEWS2: $($PatientContext.News2Score)) breaches safe step-down boundary."
    }
}

# 3. Receiving Ward Safe-Staffing & Isolation Check
if ($TargetWardState.PatientsPerRegisteredNurse -gt 4.0 -or ($PatientContext.RequiresSideRoomIsolation -and $TargetWardState.AvailableSideRooms -lt 1)) {
    return [PSCustomObject]@{
        EncounterId  = $PatientContext.EncounterId
        Decision     = 'VETO_WARD_STAFFING_OR_ISOLATION_DEFICIT'
        SafeToStage  = $false
        HazardCode   = 'DCB0129-HAZ-07'
        Reason       = "Receiving ward ratio ($($TargetWardState.PatientsPerRegisteredNurse):1) or side-room availability unsafe."
    }
}

return [PSCustomObject]@{
    EncounterId  = $PatientContext.EncounterId
    Decision     = 'STAGE_FOR_CLINICAL_SIGN_OFF'
    SafeToStage  = $true
    HazardCode   = 'NONE'
    Reason       = 'Acuity, observation freshness, and ward ratios verified. Awaiting Duty Matron & Consultant sign-off.'
}
