# Follow these steps to revert bad commit
    - git bisect start HEAD <good-commit-hash>
    - git bisect bad HEAD
    - git bisect good <good-commit-hash>
    - git bisect reset
    - git revert <bad-commit-hash>
    - git add <file-name>
    - git revert --continue
    - git push origin master

