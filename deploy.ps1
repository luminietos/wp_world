flutter build web --base-href /wp_world/
Remove-Item -Recurse -Force docs/*
Copy-Item -Recurse build/web/* docs/
git add docs
git commit -m "Deploy"
git push
