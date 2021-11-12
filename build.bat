cmd /c "flutter build web"
powershell copy-item build/web/* ./release -Recurse -Force