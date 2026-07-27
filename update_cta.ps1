$targetStyle = @"
.final-cta { text-align: center; padding: 100px 20px; background: #111; color: #fff; border-radius: 24px; max-width: 1200px; margin: 100px auto; position: relative; z-index: 1; }
.final-cta h2 { font-size: 42px; font-weight: 800; margin-bottom: 20px; letter-spacing: -1px; }
.final-cta p { font-size: 18px; color: #aaa; margin-bottom: 40px; }
.final-cta .btn-p { display: inline-block; background: #fff; color: #111; padding: 14px 32px; border-radius: 100px; text-decoration: none; font-weight: 600; transition: transform 0.2s; }
.final-cta .btn-p:hover { transform: translateY(-2px); background: #eee; }
"@

$files = Get-ChildItem -Path "c:\Users\naveed\OneDrive\Desktop\Agency" -Filter "service*.html"

foreach ($f in $files) {
    $content = Get-Content $f.FullName -Raw
    $pattern = '(?s)\.final-cta\s*\{.*\.final-cta\s*\.btn-p:hover\s*\{[^}]*\}'
    
    if ($content -match $pattern) {
        $content = $content -replace $pattern, $targetStyle
        Set-Content $f.FullName -Value $content
        Write-Host "Updated $($f.Name)"
    }
}
