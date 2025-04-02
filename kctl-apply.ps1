<#
.SYNOPSIS
Applies Kubernetes configuration files with error checking
#>

$files = @(
    "backend-configMap.yaml",
    "backend-deployment.yaml",
    "backend-service.yaml"
)

# Create the namespace if it doesn't exist
kubectl create namespace multi-cloud --dry-run=client -o yaml | kubectl apply -f -

foreach ($file in $files) {
    try {
        if (-not (Test-Path $file)) {
            throw "File not found: $file"
        }
        
        Write-Host "Applying $file..." -ForegroundColor Yellow
        kubectl apply -f $file
        if ($LASTEXITCODE -ne 0) {
            throw "Error applying $file"
        }
    }
    catch {
        Write-Host "ERROR: $_" -ForegroundColor Red
        exit 1
    }
}

# Display deployment status
Write-Host "`nDeployment successful. Current status:" -ForegroundColor Green
kubectl get pods,svc,deploy -o wide