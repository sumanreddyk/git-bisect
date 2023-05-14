# Follow these steps to revert bad commit
    - git bisect start HEAD <good-commit-hash>
    - git bisect bad HEAD
    - git bisect good <good-commit-hash>
    - git bisect reset
    - git revert <bad-commit-hash>
    - git add <file-name>
    - git revert --continue
    - git push origin master

# another approach
    - git bisect start
    - git bisect bad
    - git log --checkout
    - git checkout <good-sha>
    - git bisect good
    - If you see any steps just run 'git bisect bad' command
    - git bisect reset
    - git revert <bad-commit-sha>
    - git add <file-name>
    - git revert --continue
    - git push

