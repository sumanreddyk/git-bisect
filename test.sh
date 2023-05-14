#!/bin/bash
user_score=0
if [ -d $4 ]
then
  if [ -d $5 ]
  then
    user_score=`expr $user_score + 1`
    if [ $user_score -eq 1 ]
    then
      echo 'Preliminary local directory checks in local repository... Pass'
    else
      echo 'Preliminary local directory checks in local repository... Fail'
    fi
    cd $5
    [ `eval git log --oneline | grep -io 'revert "perform addition"' | wc -l` -eq 1 ] && echo 'Revert Check... Pass' || echo 'Revert Check... Fail'
    git checkout master > /dev/null 2>&1
    [ `eval git log --oneline | wc -l` -ge 8 ] &&  echo 'Commits check on master... Pass' || echo 'Commits check on master... Fail'
    cd ..
  else
    echo 'No local directory found...'
  fi
  if [ -d $1 ]
  then
    user_score=0
    user_score=`expr $user_score + 1`
    cd $1
    git clone $2 $3 > /dev/null 2>&1
    user_score=`expr $user_score + 1`
    if [ $user_score -eq 2 ]
    then
      echo 'Preliminary remote directory checks in local repository... Pass'
    else
      echo 'Preliminary remote directory checks in local repository... Fail'
    fi
    cd $3
    [ `eval git log --oneline | grep -io 'revert "perform addition"' | wc -l` -eq 1 ] && echo 'Revert Check... Pass' || echo 'Revert Check... Fail'
    git checkout master > /dev/null 2>&1
    [ `eval git log --oneline | wc -l` -ge 8 ] &&  echo 'Commits check on master... Pass' || echo 'Commits check on master... Fail'
    cd ../..
    rm -rf $1/$3
  else
    echo 'No remote directory found...'
  fi
else
  echo 'No git found in the local directory'  
fi

