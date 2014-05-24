---
title: "Have you pushed any public commits to github today?"
layout: post
summary: "Check your 'real' public github activity with bash"
---

## The good

I love the github **contribution chart** on profile pages. You can get [bathroom tiles with that](https://twitter.com/mrdougal/statuses/442929113733410816) :)

![github activity shower](/assets/images/github_activity_shower.png)

It gives visual feedback and it's a great feeling to watch your streak going on for days. Or weeks! You should [push code every day right](http://ejohn.org/blog/write-code-every-day/)?

## The bad

The problem is that they **don't provide an accurate view** of your **public activity** if you're lucky enough that your company/client also uses github as their source control or you have private repos. If you couldn't care less about that -which is perfectly understandable- please stop reading now.

![github activity includes private repos](/assets/images/github_acitivity_private_repos.png)

Ever noticed the little lock in the top right corner of the chart. Hover over it and it confirms your worst nightmare: your public profile might not look as good as what you see when you're logged in. Just open your github profile in incognito mode and problem solved or read on for an ugly hack...

## The ugly

Drop the snippet below to your ```.bashrc``` or ```.zshrc``` and maybe even alias it to something short like ```gpa``` and voilà!

```bash
function github-public-activity {
    LAST_PUBLIC_COMMIT=$(curl --silent  https://api.github.com/users/csabapalfi/events | grep created_at | sed -e "s/.* \"//" -e "s/T.*//"  | head -1)
    TODAY=$(date +"%Y-%m-%d")

    if [ "$LAST_PUBLIC_COMMIT" != "$TODAY" ]
    then
        echo "No public commit today!!"
    else
        echo "Relax. You contributed to open-source today."
    fi
}
```

Of course I don't want to keep opening my profile in incognito mode when github has an API and I have just read some [brilliant bash tips](http://robertmuth.blogspot.co.uk/2012/08/better-bash-scripting-in-15-minutes.html).

> If it ain't broke. Fix it anyway. You might learn something new.