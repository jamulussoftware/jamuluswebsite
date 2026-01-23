---
layout: post
title: "Mitigating User Tracking Caused By Correlation Attack"
lang: "en"
author: "@rdica"
heading: "Mitigating User Tracking Caused By Correlation Attack"
---

By default the Jamulus protocol does not map usernames to IP addresses in any publicly available data.  
However it is possible to execute a correlation attack to achieve user&lt;&dash;&gt;IP mapping.  
This was first reported to Jamulus developers here: [https://github.com/orgs/jamulussoftware/discussions/3545](https://github.com/orgs/jamulussoftware/discussions/3545)

<!--more-->

## Scope
