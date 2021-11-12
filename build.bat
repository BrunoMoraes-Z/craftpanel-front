cmd /c "flutter build web"
powershell rm release/* 
powershell copy-item build/web/* ./release