param(
    [string]$IPs,
    [switch]$Remove
)

# Ensure script runs as Administrator
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "ERROR: This script must be run as Administrator." -ForegroundColor Red
    exit 1
}

$InboundRuleName  = "Block Inbound from multiple IPs"
$OutboundRuleName = "Block Outbound to multiple IPs"

# Remove rules if -Remove switch is used
if ($Remove) {
    Remove-NetFirewallRule -DisplayName $InboundRuleName  -ErrorAction SilentlyContinue
    Remove-NetFirewallRule -DisplayName $OutboundRuleName -ErrorAction SilentlyContinue
    
    Write-Host "Firewall rules '$InboundRuleName' and '$OutboundRuleName' have been removed." -ForegroundColor Green
    exit 0
}

# Validate input
if ([string]::IsNullOrWhiteSpace($IPs)) {
    Write-Host "ERROR: Please provide IP addresses using the -IPs parameter." -ForegroundColor Red
    Write-Host "Example: .\Block-MultipleIPs.ps1 -IPs `"1.1.1.1,2.2.2.2`"" -ForegroundColor Yellow
    exit 1
}

# Parse and validate IPv4 addresses
$ValidIPs = $IPs -split '[,\s]+' | 
            Where-Object { $_ -match '^(?:(?:25[0-5]|2[0-4]\d|1\d{2}|[1-9]?\d)\.){3}(?:25[0-5]|2[0-4]\d|1\d{2}|[1-9]?\d)$' } |
            Sort-Object -Unique

if ($ValidIPs.Count -eq 0) {
    Write-Host "ERROR: No valid IPv4 addresses were provided." -ForegroundColor Red
    exit 1
}

function Update-FirewallRule {
    param(
        [string]$RuleName,
        [string]$Direction   # Changed from explicit type to simple string
    )

    $ExistingRule = Get-NetFirewallRule -DisplayName $RuleName -ErrorAction SilentlyContinue

    if ($ExistingRule) {
        $CurrentFilter = $ExistingRule | Get-NetFirewallAddressFilter
        $CurrentRemoteIPs = $CurrentFilter.RemoteAddress | 
                            Where-Object { $_ -match '^(?:(?:25[0-5]|2[0-4]\d|1\d{2}|[1-9]?\d)\.){3}(?:25[0-5]|2[0-4]\d|1\d{2}|[1-9]?\d)$' }

        $MergedIPs = ($CurrentRemoteIPs + $ValidIPs) | Sort-Object -Unique

        Set-NetFirewallRule -DisplayName $RuleName -RemoteAddress $MergedIPs -ErrorAction Stop

        Write-Host "UPDATED: $RuleName - Now blocking $($MergedIPs.Count) IP(s): $($MergedIPs -join ', ')" -ForegroundColor Cyan
    }
    else {
        New-NetFirewallRule -DisplayName $RuleName `
                            -Direction $Direction `
                            -Action Block `
                            -RemoteAddress $ValidIPs `
                            -Protocol Any `
                            -Profile Any `
                            -ErrorAction Stop | Out-Null

        Write-Host "CREATED: $RuleName - Blocking $($ValidIPs.Count) IP(s): $($ValidIPs -join ', ')" -ForegroundColor Green
    }
}

# Apply rules
Update-FirewallRule -RuleName $InboundRuleName  -Direction Inbound
Update-FirewallRule -RuleName $OutboundRuleName -Direction Outbound

Write-Host "Operation completed successfully." -ForegroundColor Green