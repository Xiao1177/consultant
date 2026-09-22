# 后端启动脚本：优先使用环境变量 API_KEY，否则读取 .env.local
if (-not $env:API_KEY -and (Test-Path (Join-Path $PSScriptRoot ".env.local"))) {
    $line = Get-Content (Join-Path $PSScriptRoot ".env.local") -Raw -Encoding UTF8
    if ($line -match '^API_KEY=(.+)$') { $env:API_KEY = $Matches[1].Trim() }
}
$cp = (Join-Path $PSScriptRoot "target\classes") + ";" + (Get-Content (Join-Path $PSScriptRoot "target\cp.txt") -Raw -Encoding UTF8).Trim()
Push-Location $PSScriptRoot
Remove-Item Env:http_proxy, Env:HTTPS_PROXY, Env:HTTP_PROXY, Env:https_proxy -ErrorAction SilentlyContinue
java -cp $cp com.zyt.consultant.ConsultantApplication
