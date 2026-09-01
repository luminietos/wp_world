flutter build web --base-href /wp_world/ # builds the Flutter web app with a base href of /wp_world/

if ($LASTEXITCODE -ne 0) { # IF the build failed...
    Write-Host "Build failed, aborting deploy." # prints out statement to the console
    exit $LASTEXITCODE # holds the exit code of the last command
    #...it exits the script with the same exit code as the build command
}

# The rest of the steps only run if the build succeeded:

Remove-Item -Recurse -Force docs/*
Copy-Item -Recurse build/web/* docs/

git add docs
git commit -m "Deploy"
git push

Write-Host "Deployment complete ✔"