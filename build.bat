cmd /c "flutter build web --web-renderer html"
powershell copy-item build/web/* ./release -Recurse -Force