$principal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (-not $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Bu script yönetici olarak çalıştırılmalıdır." -ForegroundColor Yellow
    exit
}

Write-Host "Visual Studio lisans temizliği başlatılıyor..." -ForegroundColor Cyan

Get-Process devenv -ErrorAction SilentlyContinue | Stop-Process -Force

$services = @("NgcCtnrSvc","TokenBroker","OneAuthService")
foreach ($svc in $services) {
    if (Get-Service $svc -ErrorAction SilentlyContinue) {
        Restart-Service $svc -Force -ErrorAction SilentlyContinue
    }
}

$local = $env:LOCALAPPDATA
$paths = @(
    "$local\Microsoft\VSCommon\OnlineLicensing",
    "$local\.IdentityService",
    "$local\IdentityCache"
)
foreach ($p in $paths) {
    if (Test-Path $p) { Remove-Item $p -Recurse -Force -ErrorAction SilentlyContinue }
}

$prog = "C:\ProgramData\Microsoft\VS\Licensing"
if (Test-Path $prog) { Remove-Item "$prog\*" -Recurse -Force -ErrorAction SilentlyContinue }

try {
    dsregcmd /status | Select-String "AzureAdJoined"
} catch {}

Write-Host "Temizlik tamamlandı. Visual Studio’yu yönetici olarak açıp oturum açın." -ForegroundColor Green
