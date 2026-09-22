# 前端启动脚本
$front = Join-Path $PSScriptRoot "diet_helper-frontend"
Remove-Item Env:http_proxy, Env:HTTPS_PROXY, Env:HTTP_PROXY, Env:https_proxy -ErrorAction SilentlyContinue
Push-Location $front
npm run dev
