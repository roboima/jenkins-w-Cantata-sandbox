#!/bin/bash
                    cd /home/roboima/workspace/jenkins/checkout
                    # git remote set-url origin https://roboima:password0ed@github.com/roboima/jenkins-sandbox.git
                    git config --global user.email "roboima70@gmail.com"
                    git config --global user.name "Robert M-A"
                    git push -u origin main
                    git status 
                    git add -A
                    git commit -m "Test Case Update: Run Completed"
                    git push -u origin main
                    # history
                    echo 'Success!'
                